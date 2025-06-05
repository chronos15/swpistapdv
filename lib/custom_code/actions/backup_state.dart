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

import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> backupState() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final Map<String, dynamic> data = {};
    for (var key in keys) {
      final value = prefs.get(key);
      data[key] = value;
    }

    final jsonString = jsonEncode(data);

    // Pasta persistente do app
    final directory = await getApplicationDocumentsDirectory();

    final now = DateTime.now();
    final formatted =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';

    final file = File('${directory.path}/backup_prefs_$formatted.json');

    await file.writeAsString(jsonString);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Backup do estado salvo do app.',
    );
  } catch (e) {
    print('Erro ao gerar backup: $e');
  }
}
