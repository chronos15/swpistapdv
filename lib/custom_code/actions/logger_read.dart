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

import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

Future<List<dynamic>> loggerRead() async {
  try {
    // Obtém o diretório para ler os logs
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/app_logs.json";
    final file = File(filePath);

    // Verifica se o arquivo existe
    if (await file.exists()) {
      final content = await file.readAsString();
      if (content.isNotEmpty) {
        // Retorna a lista de logs
        return json.decode(content);
      }
    }
  } catch (e) {
    print("Erro ao ler os logs: $e");
  }

  // Retorna uma lista vazia se não houver logs
  return [];
}
