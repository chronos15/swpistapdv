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

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

Future setWindowSizeAndCenterAlignment(
  double vMinWidth,
  double vMinHeight,
) async {
  //Se a plataforma for windows, ele seta o minimo de tela e alinha ao centro.
  //Obs: Inserir a função na execução da tela inicial.
  // Add your function code here!
  if (!kIsWeb) {
    if (Platform.isWindows) {
      doWhenWindowReady(() {
        final initialSize = Size(vMinWidth,
            vMinHeight); // Definido por parametro não pode ser inserido no main.dart. Caso queira, utilize a ação setPredefinedWindoSizeAndCenter
        appWindow.size = initialSize;
        appWindow.minSize = initialSize; // Defina o tamanho mínimo da janela
        appWindow.alignment =
            Alignment.center; // Centraliza a janela no monitor
        appWindow.maximize();
        //appWindow.show();
      });
    }
  }
}
