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
import 'dart:convert'; // importante para usar jsonEncode
import 'package:device_info_plus/device_info_plus.dart';

Future<dynamic> getDeviceName() async {
  final deviceInfo = DeviceInfoPlugin();

  try {
    Map<String, String> deviceData;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceData = {
        'name': androidInfo.model ?? 'Android',
        'serial': androidInfo.id ?? 'Unknown Serial',
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceData = {
        'name': iosInfo.name ?? 'iPhone',
        'serial': iosInfo.identifierForVendor ?? 'Unknown Serial',
      };
    } else if (Platform.isMacOS) {
      final macInfo = await deviceInfo.macOsInfo;
      deviceData = {
        'name': macInfo.computerName ?? 'Mac',
        'serial': macInfo.systemGUID ?? 'Unknown Serial',
      };
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      deviceData = {
        'name': windowsInfo.computerName ?? 'Windows PC',
        'serial': windowsInfo.deviceId ?? 'Unknown Serial',
      };
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      deviceData = {
        'name': linuxInfo.name ?? 'Linux',
        'serial': linuxInfo.machineId ?? 'Unknown Serial',
      };
    } else {
      deviceData = {
        'name': 'Unknown',
        'serial': 'Unknown',
      };
    }

    return jsonEncode(deviceData);
  } catch (e) {
    return jsonEncode({
      'name': 'Error',
      'serial': 'Error: $e',
    });
  }
}
