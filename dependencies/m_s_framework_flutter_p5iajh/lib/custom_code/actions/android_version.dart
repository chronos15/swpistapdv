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

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<double> androidVersion() async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (Platform.isAndroid) {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    final version = androidInfo.version.release; // Ex: "6.0.1"

    // Converte "6.0.1" para 6.0 (double)
    final parts = version.split('.');
    final major = int.tryParse(parts[0]) ?? 0;
    final minor = int.tryParse(parts.length > 1 ? parts[1] : '0') ?? 0;

    return double.parse('$major.$minor');
  }

  return 0.0; // Não é Android

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
