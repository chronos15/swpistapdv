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

Future<bool> getNetRealizaImpressaoImage(
  BuildContext context,
  FFUploadedFile? pdfUp,
) async {
  if (pdfUp?.bytes == null) {
    debugPrint("Erro: PDF ou bytes não fornecidos.");
    return false;
  }

  try {
    final tempDir = await getTemporaryDirectory();
    final pdfPath = '${tempDir.path}/temp_pdf.pdf';

    await File(pdfPath).writeAsBytes(pdfUp!.bytes!);

    const scale = 3.0;

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

    final image = img.Image.fromBytes(
      width: pageImage.width,
      height: pageImage.height,
      bytes: pageImage.pixels.buffer,
      order: img.ChannelOrder.bgra,
    );

    final pngBytes = img.encodePng(image);

    final imagePath =
        '${tempDir.path}/img_${DateTime.now().millisecondsSinceEpoch}.png';
    final imageFile = await File(imagePath).writeAsBytes(pngBytes);

    if (!await imageFile.exists()) {
      debugPrint("Erro ao salvar imagem.");
      return false;
    }

    final base64 = base64Encode(pngBytes); // usa direto os bytes que já temos

    FocusScope.of(context).unfocus();

    final comprovante = [
      ItemPrintModel.image(
        content: base64,
        align: AlignModeEnum.center,
        height: 600, // ajuste conforme o necessário
      ),
    ];

    await GetnetPayments.pos.print(comprovante);
    return true;
  } catch (e, stack) {
    debugPrint("Erro ao converter/imprimir imagem: $e\n$stack");
    return false;
  }
}
