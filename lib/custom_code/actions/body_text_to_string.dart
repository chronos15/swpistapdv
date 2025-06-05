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
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> bodyTextToString(
  String? urlAPI,
  String? tokenBearer,
) async {
  try {
    final response = await http.get(
      Uri.parse(urlAPI!),
      headers: {
        'Authorization': 'Bearer $tokenBearer',
        'Accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      try {
        // Tenta decodificar com latin1
        final String rawText = latin1.decode(response.bodyBytes);
        debugPrint('sucesso');
        return rawText;
      } catch (e) {
        debugPrint('Erro ao decodificar: $e');
        // Se falhar ao decodificar, retorna string bruta com fallback
        return String.fromCharCodes(response.bodyBytes);
      }
    } else {
      debugPrint(urlAPI);
      debugPrint('Erro: Status code ${response.statusCode}');
      return '';
    }
  } catch (e) {
    debugPrint('Erro na requisição GET: $e');
    return '';
  }
}
