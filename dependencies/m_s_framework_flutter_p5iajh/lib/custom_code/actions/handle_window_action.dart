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
import 'package:bitsdojo_window/bitsdojo_window.dart';

Future handleWindowAction(int? choiceTypeAction) async {
  //Realiza ação na tela
  //1 - Minimiza tela do app
  //2- restaura ou maximiza tela do App
  //3 - Fecha aplicativo (nativo windows - funciona em Windows e Mac)
  //4 - só Maximiza app  (pouco usado)
  //Outro - 5 +> Fecha aplicativo nativamente Flutter
  if (choiceTypeAction == 1) {
    appWindow.minimize();
  } else if (choiceTypeAction == 2) {
    if (appWindow.isMaximized) {
      appWindow.restore();
    } else {
      appWindow.maximize();
    }
  } else if (choiceTypeAction == 3) {
    appWindow.close();
  } else if (choiceTypeAction == 4) {
    appWindow.maximize();
  } else {
    exit(0);
  }
}
