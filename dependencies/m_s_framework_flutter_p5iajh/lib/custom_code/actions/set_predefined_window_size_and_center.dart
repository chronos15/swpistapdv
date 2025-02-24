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

Future setPredefinedWindowSizeAndCenter() async {
  //Se a plataforma for windows, ele seta o minimo de tela e alinha ao centro.
  //Obs: Inserir a função no inicio do main.dart (recomendado) ou na exceução da tela inicial.
  // Add your function code here!
  if (!kIsWeb) {
    if (Platform.isWindows) {
      doWhenWindowReady(() {
        const initialSize = Size(800,
            600); // O tamanho não pode ser inserido por parametro caso coloque no main.dart
        // appWindow.size = initialSize;
        appWindow.minSize = initialSize; // Defina o tamanho mínimo da janela
        //appWindow.alignment =
        //Alignment.center; // Centraliza a janela no monitor
        //appWindow.maximize();
        //appWindow.show();
      });
    }
  }
}
