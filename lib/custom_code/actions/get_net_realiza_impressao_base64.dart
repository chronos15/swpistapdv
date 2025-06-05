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

import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:getnet_payments/getnet_payments.dart';
import 'package:image/image.dart' as img;

Future<bool> getNetRealizaImpressaoBase64(
  BuildContext context,
  String? pdfBase64,
) async {
  if (pdfBase64 == null || pdfBase64.isEmpty) {
    debugPrint("Erro: Base64 do PDF não fornecido.");
    return false;
  }

  try {
    final tempDir = await getTemporaryDirectory();
    final pdfPath = '${tempDir.path}/temp_pdf.pdf';

    // Converte Base64 para bytes e salva temporariamente o PDF
    final pdfBytes = base64Decode(pdfBase64);
    await File(pdfPath).writeAsBytes(pdfBytes);

    const scale = 3.0;

    // Abre o PDF a partir do caminho temporário
    final document = await PdfDocument.openFile(pdfPath);
    final page = await document.getPage(1);

    final pageImage = await page.render(
      width: (page.width * scale).toInt(),
      height: (page.height * scale).toInt(),
    );

    if (pageImage == null) {
      debugPrint("Erro ao renderizar imagem do PDF.");
      return false;
    }

    // Converte para imagem PNG
    final image = img.Image.fromBytes(
      width: pageImage.width,
      height: pageImage.height,
      bytes: pageImage.pixels.buffer,
      order: img.ChannelOrder.bgra,
    );

    final pngBytes = img.encodeJpg(image, quality: 80);

    // Gera caminho da imagem (opcional, para debug ou log)
    /*final imagePath =
        '${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}.png';
    final imageFile = await File(imagePath).writeAsBytes(pngBytes);

    if (!await imageFile.exists()) {
      debugPrint("Erro ao salvar imagem.");
      return false;
    }*/

    // Converte imagem para base64 novamente
    final base64Image = base64Encode(pngBytes);

    FocusScope.of(context).unfocus();

    final comprovante = [
      ItemPrintModel.image(
        content: base64Image,
        align: AlignModeEnum.center,
        height: 600, // ajuste conforme necessário
      ),
    ];

    await GetnetPayments.pos.print(comprovante);
    return true;
  } catch (e, stack) {
    debugPrint("Erro ao converter/imprimir imagem: $e\n$stack");
    return false;
  }
}
