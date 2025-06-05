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
import 'package:flutter/services.dart' show rootBundle;
import 'package:ini/ini.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

//esse nao funciona no web, dart:io da biblioteca importada dá falha de namespace na busca do arquivo :).

Future<List<String>> loadIniFile(
    bool byFilePicker, bool? bAssets, String sIniName) async {
  try {
    if (!byFilePicker) {
      String directory;
      if (bAssets!) {
        // Tenta carregar dos assets
        directory = await rootBundle.loadString('assets/$sIniName.ini');
      } else {
        // Diretório de documentos
        final appDocDir = await getApplicationDocumentsDirectory();
        directory = '${appDocDir.path}/$sIniName.ini';
      }

      // Lê o arquivo
      final file = File(directory);
      if (!file.existsSync()) {
        return ['Arquivo não encontrado: $directory'];
      }
      final content = await file.readAsString();
      final config = Config.fromString(content);

      // Retorna valores
      return [
        config.get('CHAVE', 'CHAVEAPP') ?? '',
        config.get('LOGADO', 'USUARIO') ?? '',
        config.get('LOGADO', 'SENHA') ?? '',
        config.get('LOGADO', 'ADM') ?? '',
        config.get('LOGADO', 'LEMBRAR') ?? '',
      ];
    } else {
      // FilePicker
      final result = await FilePicker.platform.pickFiles(type: FileType.any);
      if (result != null && result.files.single.path != null) {
        final content = await File(result.files.single.path!).readAsString();
        final config = Config.fromString(content);

        return [
          config.get('CHAVE', 'CHAVEAPP') ?? '',
          config.get('LOGADO', 'USUARIO') ?? '',
          config.get('LOGADO', 'SENHA') ?? '',
          config.get('LOGADO', 'ADM') ?? '',
          config.get('LOGADO', 'LEMBRAR') ?? '',
        ];
      } else {
        return ['Nenhum arquivo selecionado.'];
      }
    }
  } catch (e, stackTrace) {
    return ['Erro: $e', 'Detalhes: $stackTrace'];
  }
}
