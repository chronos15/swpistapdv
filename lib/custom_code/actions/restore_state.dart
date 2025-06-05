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

import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';

Future<bool> restoreState() async {
  try {
    final resultPick = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (resultPick == null || resultPick.files.single.path == null) {
      print('Nenhum arquivo selecionado');
      return false;
    }

    final file = File(resultPick.files.single.path!);
    final jsonString = await file.readAsString();
    final Map<String, dynamic> data = jsonDecode(jsonString);

    final prefs = await SharedPreferences.getInstance();

    for (var entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is String) {
        await prefs.setString(key, value);
      } else if (value is List) {
        // Verifica se é uma lista de strings
        if (value.every((element) => element is String)) {
          await prefs.setStringList(key, List<String>.from(value));
        }
      }
    }

    return true;
  } catch (e) {
    return false;
  }
}
