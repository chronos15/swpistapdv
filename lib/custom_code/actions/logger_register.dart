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
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

Future loggerRegister(
  String? details,
  String? stack,
  int? logLevel,
) async {
  // Add your function code here
  try {
    // Define o nível padrão como 3 (ERROR) se não for especificado
    final int finalLogLevel = logLevel ?? 3;

    // Ignora logs de níveis baixos
    if (finalLogLevel < 3) return;

    // Obtém o diretório para salvar os logs
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/app_logs.json";
    final file = File(filePath);

    // Formata a data e hora atual
    final timestamp = DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.now());

// Cria o objeto JSON para o log
    final logEntry = {
      "timestamp": timestamp,
      "logLevel": finalLogLevel,
      "error": details ?? 'Detalhes não informados',
      "stacktrace": stack ?? 'Sem stacktrace',
    };

    // Verifica se o arquivo já existe e contém dados
    List<dynamic> logs = [];
    if (await file.exists()) {
      final content = await file.readAsString();
      if (content.trim().isNotEmpty) {
        try {
          logs = json.decode(content);
          if (logs is! List) {
            throw FormatException(
                "O arquivo de log não contém uma lista válida.");
          }
        } catch (e) {
          print("⚠️ O arquivo de log está corrompido. Resetando...");
          logs = [];
        }
      }
    }

    // Adiciona o novo log
    logs.add(logEntry);

    // Salva o log no arquivo com indentação para facilitar a leitura
    await file.writeAsString(json.encode(logs), mode: FileMode.write);
  } catch (e) {
    print("⚠️ Erro ao salvar o log: $e");
  }
}
