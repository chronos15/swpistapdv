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
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:io';

Future<String> getDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  final networkInfo = NetworkInfo();

  String deviceData = 'Unknown device';
  String ipAddress = 'Unknown IP';
  String wifiName = 'Unknown Wi-Fi';

  try {
    // Obter informações do dispositivo
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceData = 'Device: ${androidInfo.model}\n'
          'Manufacturer: ${androidInfo.manufacturer}\n'
          'Android Version: ${androidInfo.version.release}';
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceData = 'Device: ${iosInfo.name}\n'
          'Model: ${iosInfo.model}\n'
          'iOS Version: ${iosInfo.systemVersion}';
    } else if (Platform.isMacOS) {
      final macInfo = await deviceInfo.macOsInfo;
      deviceData = 'Device: ${macInfo.model}\n'
          'OS Version: ${macInfo.osRelease}\n'
          'System: ${macInfo.computerName}';
    } else if (Platform.isWindows) {
      final windowsInfo = await deviceInfo.windowsInfo;
      deviceData = 'Device: ${windowsInfo.computerName}\n'
          'OS Version: ${windowsInfo.productName}';
    } else if (Platform.isLinux) {
      final linuxInfo = await deviceInfo.linuxInfo;
      deviceData = 'Machine ID: ${linuxInfo.machineId}\n'
          'OS Version: ${linuxInfo.versionId}\n'
          'System: ${linuxInfo.name}';
    } else if (Platform.isFuchsia) {
      deviceData = 'Fuchsia device detected';
    } else {
      final webInfo = await deviceInfo.webBrowserInfo;
      deviceData = 'Browser: ${webInfo.browserName}\n'
          'User Agent: ${webInfo.userAgent}\n'
          'Platform: ${webInfo.platform}';
    }

    // Obter informações de rede
    ipAddress = await networkInfo.getWifiIP() ?? 'Unknown IP';
    wifiName = await networkInfo.getWifiName() ?? 'Unknown Wi-Fi';
  } catch (e) {
    deviceData = 'Failed to get device information: $e';
  }

  String fullInfo = '$deviceData\n'
      'IP Address: $ipAddress\n'
      'Wi-Fi Name: $wifiName';

  print(fullInfo);
  return fullInfo;
}
