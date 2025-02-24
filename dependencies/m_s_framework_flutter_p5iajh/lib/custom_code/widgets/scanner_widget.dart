// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'dart:async'; // Importa a biblioteca de Timer

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({
    super.key,
    this.width,
    this.height,
    this.actReturn,
  });

  final double? width;
  final double? height;
  final Future Function(String? sReturn)? actReturn;

  @override
  State<ScannerWidget> createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrCodeResult;
  bool isFlashOn = false; // Estado do flash
  bool hasScanned = false; // Para evitar múltiplas chamadas

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn; // Alterna o estado do flash
                controller?.toggleFlash(); // Alterna o flash
              });
            },
            child: Text(isFlashOn ? 'Desligar Flash' : 'Ligar Flash'),
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!hasScanned) {
        // Verifica se já foi escaneado um código
        setState(() {
          qrCodeResult = scanData.code;
          hasScanned =
              true; // Marca como escaneado para evitar múltiplas chamadas
        });

        // Chama a função actReturn passando o QR Code escaneado
        if (widget.actReturn != null) {
          widget.actReturn!(qrCodeResult).then((_) {
            // Lógica adicional pode ser inserida aqui após a execução de actReturn
          });
        }

        // Imprime a mensagem personalizada no console
        print('Código QR escaneado: $qrCodeResult');

        // Aguarda 2 segundos antes de permitir outro escaneamento
        Timer(Duration(seconds: 2), () {
          setState(() {
            hasScanned =
                false; // Libera para escanear novamente após 2 segundos
          });
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
