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

import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<FFUploadedFile> bodyPDFApiToUploaded(
  String? urlAPI,
  String? tokenBearer,
) async {
  try {
    // Realize a chamada GET
    final response = await http.get(
      Uri.parse(urlAPI!),
      headers: {
        'Authorization': 'Bearer $tokenBearer',
        'Accept': '*/*', // Definindo que o retorno esperado é qualquer coisa
      },
    );

    // Verifica se a chamada foi bem-sucedida
    if (response.statusCode == 200) {
      // Converte os bytes da imagem para FFUploadedFile
      Uint8List imageData = response.bodyBytes;

      // Cria o objeto FFUploadedFile
      FFUploadedFile uploadedFile = FFUploadedFile(
        bytes: imageData,
        name: 'downloaded_image.pdf', // Pode ser ajustado conforme necessário
      );

      return uploadedFile;
      debugPrint('sucesso');
    } else {
      debugPrint(urlAPI);
      throw Exception(
          'Erro ao buscar a imagem. Status code: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Erro na requisição GET: $e');
    rethrow;
  }
}
