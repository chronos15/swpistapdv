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
  bool hasScanned = false;
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        QRView(
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
        Positioned(
          top: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isFlashOn = !isFlashOn;
                controller?.toggleFlash();
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
        hasScanned = true;
        widget.actReturn?.call(scanData.code);
        print('QR code: ${scanData.code}');
        Future.delayed(Duration(seconds: 2), () {
          hasScanned = false;
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
