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

import 'dart:io';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

Future saveAndShareQRCode(
  String valueChave,
  String sTitulo,
  String sSubtitulo,
  String? sRodape,
) async {
  // Add your function code here!
  try {
    // Cria o QR Code com base no valor fornecido
    final qrPainter = QrPainter(
      data: valueChave,
      version: QrVersions.auto,
      gapless: false,
      emptyColor: Colors.white,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    // Define o tamanho da imagem do QR Code e converte para bytes no formato PNG
    final uiImage = await qrPainter.toImage(300);
    final byteData = await uiImage.toByteData(format: ui.ImageByteFormat.png);
    final qrImageBytes = byteData!.buffer.asUint8List();

    // Configura a estrutura personalizada com título, subtítulo e rodapé
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final double containerWidth = 350;
    final double containerHeight = 475;

    final paint = Paint()..color = Colors.white;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, containerWidth, containerHeight), paint);

    // Título
    final titlePainter = TextPainter(
      text: TextSpan(
        text: sTitulo,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: containerWidth);
    titlePainter.paint(
        canvas, Offset((containerWidth - titlePainter.width) / 2, 20));

    // Subtítulo
    final subtitlePainter = TextPainter(
      text: TextSpan(
        text: sSubtitulo,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: containerWidth);
    subtitlePainter.paint(
        canvas, Offset((containerWidth - subtitlePainter.width) / 2, 60));

    // QR Code centralizado
    final qrOffset =
        Offset((containerWidth - 300) / 2, (containerHeight - 300) / 2);
    canvas.drawImage(uiImage, qrOffset, Paint());

    // Rodapé
    final footerPainter = TextPainter(
      text: TextSpan(
        text: sRodape,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: containerWidth);
    footerPainter.paint(
        canvas,
        Offset(
            (containerWidth - footerPainter.width) / 2, containerHeight - 40));

    // Finaliza o desenho e converte para imagem PNG
    final picture = recorder.endRecording();
    final finalImage =
        await picture.toImage(containerWidth.toInt(), containerHeight.toInt());
    final finalByteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final buffer = finalByteData!.buffer.asUint8List();

    // Solicita o diretório de salvamento
    String? directoryPath = await FilePicker.platform.getDirectoryPath();

    if (directoryPath == null) {
      // Usuário cancelou a seleção do diretório
      return null;
    }

    // Salva a imagem no diretório escolhido
    final filePath = '$directoryPath/custom_qr_code.png';
    final file = File(filePath);
    await file.writeAsBytes(buffer);

    // Compartilha o arquivo gerado
    await Share.shareXFiles([XFile(filePath)], text: valueChave);

    print('QR Code com layout customizado salvo em: $filePath');

    return filePath;
  } catch (e) {
    print('Erro ao criar e exportar o QR Code com layout customizado: $e');
    return null;
  }
}
