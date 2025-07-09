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

import 'dart:async';
import 'dart:convert';
//import 'package:nfc_manager/nfc_manager.dart';

Future<String> nfcReaderManager() async {
  return '';
  /*bool isAvailable = await NfcManager.instance.isAvailable();

  if (!isAvailable) {
    return "NFC não disponível no dispositivo.";
  }

  final completer = Completer<String>();

  try {
    await NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        try {
          // Captura todos os dados disponíveis
          Map<String, dynamic> tagData = tag.data;

          if (tagData.isNotEmpty) {
            // Converte os dados para JSON formatado como string
            String tagDataString = jsonEncode(tagData);
            completer.complete("Dados lidos: $tagDataString");
          } else {
            completer.complete("Nenhum dado válido encontrado.");
          }
        } catch (e) {
          completer.complete("Erro ao processar NFC: $e");
        } finally {
          await NfcManager.instance.stopSession();
        }
      },
    );

    return completer.future;
  } catch (e) {
    return "Erro ao iniciar leitura NFC: $e";
  }*/
}
