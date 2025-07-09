// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:m_s_framework_flutter_p5iajh/backend/schema/structs/index.dart"
    as m_s_framework_flutter_p5iajh_data_schema;
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'dart:convert';

// Carregar a imagem dos assets
Future<pw.ImageProvider> loadImage() async {
  final imageData = await rootBundle.load(
      'assets/images/logo.png'); // Ajuste para o caminho correto da sua imagem
  return pw.MemoryImage(imageData.buffer.asUint8List());
}

Future<String> geraValeBase64(
  BuildContext context,
  ValeCombustivelDataTypeStruct? dtValeCombustivel,
  String? sClienteName,
  String? sOperador,
) async {
  final pdf = pw.Document();
  final pageFormat = PdfPageFormat.roll57;

  final formatador = NumberFormat.simpleCurrency(locale: 'pt_BR');

  final dataMov = dtValeCombustivel?.data != null
      ? DateFormat('dd/MM/yyyy').format(DateTime.parse(dtValeCombustivel!.data))
      : '---';

  // Carregar a imagem antes de adicionar a página
  final image = await loadImage();

  pdf.addPage(
    pw.Page(
      pageFormat: pageFormat,
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                  FFAppState().Empresa.nomeFantasia,
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.center,
                ),
                pw.Text(
                  FFAppState().Empresa.cnpj,
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ),
          pw.Center(
            child: pw.Image(image,
                width: 50, height: 50), // Usando a imagem carregada
          ),
          pw.Text('CLIENTE: ${sClienteName}',
              style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.left),
          pw.Text('REG.: $dataMov',
              style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.left),
          pw.Text('OPERADOR: ${sOperador ?? 'NÃO INFORMADO'}',
              style: pw.TextStyle(fontSize: 8), textAlign: pw.TextAlign.left),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.Column(
              children: [
                pw.Text(
                    'DOCUMENTO: #${dtValeCombustivel?.idRequisicao ?? '---'}',
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(fontSize: 10)),
                pw.Divider(),
                pw.Text(
                  '* VALE COMBUSTIVEL *',
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.center,
                ),
                pw.Text(
                  'NÃO É DOCUMENTO FISCAL',
                  style: pw.TextStyle(fontSize: 8),
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 8),
          pw.Divider(),
          pw.Align(
            alignment: pw.Alignment.centerRight,
            child: pw.Text(
              'VALOR DO VALE: ${formatador.format(dtValeCombustivel?.totalreq ?? 0)}',
              style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Center(
            child: pw.BarcodeWidget(
              barcode: pw.Barcode.qrCode(),
              data: '${dtValeCombustivel?.idRequisicao ?? '---'}',
              width: 80,
              height: 80,
            ),
          ),
          pw.SizedBox(height: 10),
          pw.Text(
            'IMPRESSO EM: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}',
            style: pw.TextStyle(fontSize: 7),
            textAlign: pw.TextAlign.left,
          ),
          pw.SizedBox(height: 30),
        ],
      ),
    ),
  );

  final Uint8List pdfBytes = await pdf.save(); // ← Conteúdo real do arquivo PDF
  return base64Encode(pdfBytes); // ← Codifica TODO o conteúdo como Base64
}
