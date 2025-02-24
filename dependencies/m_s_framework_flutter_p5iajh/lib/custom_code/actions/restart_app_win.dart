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
import 'package:path/path.dart' as path;

Future<void> restartAppWin() async {
  try {
    // Caminho do executável do aplicativo
    final executable = Platform.resolvedExecutable;

    // Diretório do executável
    final executableDir = path.dirname(executable);

    // Nome do arquivo executável
    final appName = path.basename(executable);

    // Reinicia o aplicativo
    Process.start(
      path.join(executableDir, appName),
      [],
      mode: ProcessStartMode.detached,
    );

    // Fecha o aplicativo atual
    exit(0);
  } catch (e) {
    print('Erro ao reiniciar o aplicativo: $e');
  }
}
