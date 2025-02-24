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

import 'package:file_picker/file_picker.dart';
import 'package:ini/ini.dart';

Future<List<String>> loadIniFileFromPicker() async {
  try {
    // Permite que o usuário escolha um arquivo
    final result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result != null && result.files.single.bytes != null) {
      // Lê o conteúdo do arquivo selecionado
      final content = String.fromCharCodes(result.files.single.bytes!);
      final config = Config.fromString(content);

      // Extrai os valores do arquivo .ini
      final chaveApp = config.get('CHAVE', 'CHAVEAPP') ?? '';
      final usuario = config.get('LOGADO', 'USUARIO') ?? '';
      final senha = config.get('LOGADO', 'SENHA') ?? '';
      final adm = config.get('LOGADO', 'ADM') ?? '';
      final lembrar = config.get('LOGADO', 'LEMBRAR') ?? '';

      // Retorna os valores como uma lista
      return [chaveApp, usuario, senha, adm, lembrar];
    } else {
      return ['Nenhum arquivo selecionado.'];
    }
  } catch (e) {
    return ['Erro ao carregar o arquivo: $e'];
  }
}
