// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

Future<bool> pdfEditavel(
  dynamic jsonPedidoMaster,
  List<dynamic>? jsonPedidoDetails,
) async {
  try {
    // Carregar o modelo de PDF da pasta assets
    final ByteData data = await rootBundle.load('assets/pedido_custom.pdf');
    final List<int> pdfBytes = data.buffer.asUint8List();

    // Carregar o documento PDF existente
    PdfDocument document = PdfDocument(inputBytes: pdfBytes);
    PdfTextExtractor extractor = PdfTextExtractor(document);

    // Extrair texto do PDF para análise de placeholders
    String pdfContent = extractor.extractText();

    // Converter JSON para Map
    Map<String, dynamic> pedidoMaster =
        Map<String, dynamic>.from(jsonPedidoMaster);
    List<Map<String, dynamic>> pedidoDetails = jsonPedidoDetails != null
        ? jsonPedidoDetails
            .map((e) => Map<String, dynamic>.from(jsonDecode(e)))
            .toList()
        : [];

    // Substituir placeholders de dados fixos no conteúdo do PDF
    pedidoMaster.forEach((key, value) {
      pdfContent = pdfContent.replaceAll('[$key]', value.toString());
    });

    // Processamento dinâmico dos itens
    String itemTemplate = _extractItemTemplate(pdfContent);
    if (itemTemplate.isEmpty) {
      throw Exception("Template de item não encontrado no PDF");
    }

    String itemsGenerated = '';

    for (var i = 0; i < pedidoDetails.length; i++) {
      String filledItem = itemTemplate;
      pedidoDetails[i].forEach((key, value) {
        filledItem = filledItem.replaceAll('[$key]', value.toString());
      });
      itemsGenerated += filledItem + '\n'; // Adiciona uma linha por item
    }

    // Substituir o template original pela lista gerada dinamicamente
    pdfContent = pdfContent.replaceAll(itemTemplate, itemsGenerated.trim());

    // Criar um novo documento PDF com os dados preenchidos
    PdfPage page = document.pages[0];
    PdfGraphics graphics = page.graphics;
    PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);

    graphics.drawString(pdfContent, font,
        bounds: const Rect.fromLTWH(50, 50, 500, 700));

    // Salvar o novo PDF com os dados preenchidos
    final List<int> newPdfBytes = document.saveSync();
    final outputFile = File('output_pedido.pdf');
    await outputFile.writeAsBytes(newPdfBytes);

    // Fechar o documento
    document.dispose();

    return true;
  } catch (e) {
    debugPrint('Erro ao gerar o PDF editável: $e');
    return false;
  }
}

/// Função auxiliar para identificar o template de itens no PDF
String _extractItemTemplate(String pdfContent) {
  // Expressão regular para identificar a linha de itens no PDF
  RegExp regex = RegExp(
      r'1\s\[QUANTIDADE\]\s+\[NOMPRO\]\s+\[VALORVENDIDO\]\s+\[SUBTOTAL\]');
  Match? match = regex.firstMatch(pdfContent);
  return match != null ? match.group(0)! : '';
}
