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
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:ini/ini.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveAndShareKeyFile(String valueChave, String? usuario,
    String? senhacript, bool bSaver, bool bShared, bool bLembrarSenha) async {
  try {
    // Cria o conteúdo do arquivo INI
    final config = Config();
    config.addSection('CHAVE');
    config.set('CHAVE', 'CHAVEAPP', valueChave);

    config.addSection('LOGADO');
    if (usuario != null && usuario.isNotEmpty) {
      config.set('LOGADO', 'USUARIO', usuario);
    }

    if (senhacript != null && senhacript.isNotEmpty) {
      config.set('LOGADO', 'SENHA', senhacript);
    }

    config.set('LOGADO', 'ADM', '0');
    config.set(
      'LOGADO',
      'LEMBRAR',
      bLembrarSenha == true ? '1' : '0',
    );

    // Converte o conteúdo do INI em bytes
    Uint8List bytes = Uint8List.fromList(config.toString().codeUnits);

    String filePath;

    if ((bSaver) && (!kIsWeb)) {
      // Usa o FilePicker para permitir que o usuário escolha onde salvar o arquivo
      final directory = await FilePicker.platform.getDirectoryPath();
      if (directory == null) {
        print('Nenhum diretório selecionado.');
        return;
      }
      filePath = '$directory/SOFTWORKEasy.ini';
    } else {
      // Salva automaticamente no diretório acessível do aplicativo
      final directory = await getApplicationDocumentsDirectory();
      filePath = '${directory.path}/SOFTWORKEasy.ini';
    }

    // Salva o conteúdo no arquivo
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    print('Arquivo INI salvo em: $filePath');

    // Compartilha o arquivo usando o caminho salvo
    if (bShared) {
      await Share.shareXFiles([XFile(filePath)],
          text: 'Confira o arquivo de configuração.');
    }
    ;
  } catch (e) {
    print('Erro ao salvar ou compartilhar o arquivo INI: $e');
  }
}
