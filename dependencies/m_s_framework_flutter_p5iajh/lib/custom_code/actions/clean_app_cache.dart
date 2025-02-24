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

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> cleanAppCache() async {
  try {
    // Limpar o cache do diretório temporário
    /* final tempDir = await getTemporaryDirectory();
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }*/

    // Limpar o cache do diretório persistente
    final appDir = await getApplicationSupportDirectory();
    if (appDir.existsSync()) {
      appDir.deleteSync(recursive: true);
    }

    // Limpar SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    debugPrint('Cache e estado do aplicativo limpos com sucesso!');
    return true;
  } catch (e) {
    debugPrint('Erro ao limpar o cache: $e');
    return false;
  }
}
