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
import 'package:http/http.dart' as http;

Future<String> buscaNFeFromDoc(
  String? host,
  int? idVenda,
  String? token,
  String? modeloDoc,
) async {
  if (host == null || idVenda == null || token == null || modeloDoc == null) {
    throw ArgumentError('Parâmetros inválidos');
  }

  const int maxTentativas = 10;
  const Duration delayEntreTentativas = Duration(seconds: 1);
  const Duration tempoLimite = Duration(seconds: 3);

  for (int i = 0; i < maxTentativas; i++) {
    try {
      final url = Uri.parse('$host/Services/GetNumDoc?IdVenda=$idVenda');

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ).timeout(tempoLimite);

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final numeroDoc = body['value'];

        if (numeroDoc != null && numeroDoc > 0) {
          final pdfUrl =
              Uri.parse('$host/documentos/${modeloDoc}_$numeroDoc.pdf');

          print(pdfUrl);
          final pdfResponse = await http.get(pdfUrl).timeout(tempoLimite);

          if (pdfResponse.statusCode == 200) {
            final bytes = pdfResponse.bodyBytes;
            final base64Pdf = base64Encode(bytes);
            return base64Pdf;
          } else {
            print(
                'Tentativa $i: Erro ao baixar PDF (${pdfResponse.statusCode})');
          }
        }
      } else {
        print('Tentativa $i: Erro HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Tentativa $i: Exceção ou timeout - $e');
    }

    await Future.delayed(delayEntreTentativas);
  }

  return '';
}
