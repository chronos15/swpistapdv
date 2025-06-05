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

import 'index.dart'; // Imports other custom actions

import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

Future<bool> cieloLioRealizaImpressaoImage(
    BuildContext context, FFUploadedFile? pdfUp) async {
  if (pdfUp?.bytes == null) {
    print("Erro: PDF ou bytes não fornecidos.");
    return false;
  }

  final hasPermission = await Permission.storage.request();
  if (!hasPermission.isGranted) {
    print("Permissão de armazenamento negada.");
    return false;
  }

  try {
    // Renderização direta sem salvar em disco
    final document = await PdfDocument.openData(pdfUp!.bytes!);
    final page = await document.getPage(1).timeout(const Duration(seconds: 2));
    const scaleFactor = 3.0;

    final pageImage = await page.render(
      width: (page.width * scaleFactor).toInt(),
      height: (page.height * scaleFactor).toInt(),
    );

    final rawImage = img.Image.fromBytes(
      width: pageImage.width,
      height: pageImage.height,
      bytes: pageImage.pixels.buffer,
      order: img.ChannelOrder.bgra,
    );

    final pngBytes = img.encodeJpg(rawImage,
        quality:
            80); // Use encodeJpg(rawImage, quality: 80) para mais desempenho

    final downloadsDir = Directory('/storage/emulated/0/Download');
    final fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.png';
    final imagePath = '${downloadsDir.path}/$fileName';

    await File(imagePath).writeAsBytes(pngBytes);

    final printRequest = {
      "operation": "PRINT_IMAGE",
      "styles": [{}],
      "value": [imagePath]
    };

    final jsonBase64 = base64Encode(utf8.encode(jsonEncode(printRequest)));
    final url = "lio://print?request=$jsonBase64&urlCallback=order://response";

    if (!await canLaunchUrl(Uri.parse("lio://print"))) {
      print("Lio não instalada.");
      return false;
    }

    final completer = Completer<bool>();
    final appLinks = AppLinks();

    final subscription = appLinks.uriLinkStream.listen((uri) {
      if (uri?.scheme == "order" && uri?.host == "response") {
        final status = uri?.queryParameters["status"] ?? '';
        if (!completer.isCompleted)
          completer.complete(status.toLowerCase() == "success");
      }
    }, onError: (err) {
      print("Erro deep link: $err");
      if (!completer.isCompleted) completer.complete(false);
    });

    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

    final result = await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 3), () {
        if (!completer.isCompleted) {
          print("Timeout aguardando resposta.");
          completer.complete(false);
        }
        return false;
      }),
    ]);

    await subscription.cancel();
    return result;
  } catch (e) {
    print("Erro ao processar PDF: $e");
    return false;
  }
}
