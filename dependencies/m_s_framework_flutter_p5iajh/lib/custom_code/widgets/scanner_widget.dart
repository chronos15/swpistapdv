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

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
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
  bool isDeviceSupported = true; // <- Flag para saber se o device é compatível

  @override
  void initState() {
    super.initState();
    _checkAndroidVersion();
  }

  Future<void> _checkAndroidVersion() async {
    if (!kIsWeb && Theme.of(context).platform == TargetPlatform.android) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      final sdkInt = androidInfo.version.sdkInt ?? 0;

      if (sdkInt < 24) {
        // Android 7 = API 24
        setState(() {
          isDeviceSupported = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isDeviceSupported) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Este dispositivo não é compatível com a leitura de QR Code.\n(Android 7 ou superior é necessário)',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      );
    }

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
        Future.delayed(const Duration(seconds: 2), () {
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
