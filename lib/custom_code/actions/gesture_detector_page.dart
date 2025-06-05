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

Future<bool> gestureDetectorPage(
    Future Function(bool bDetected)? actReturnGesture) async {
  final completer = Completer<bool>();
  Timer? timer;
  final streamController = StreamController<void>();

  // Função que é chamada quando detecta toque
  void _onUserInteraction() {
    print("[INFO] Toque detectado!");

    if (!completer.isCompleted) {
      print("[INFO] Cancelando temporizador...");
      timer?.cancel(); // Cancela o timer se o usuário tocar
      print("[INFO] Chamando função de callback...");
      actReturnGesture?.call(true);
      completer.complete(true);
      print("[INFO] Future completo!");
    }
  }

  // Inicia um timer para acionar automaticamente após 1 minuto (60 segundos)
  timer = Timer(Duration(seconds: 60), () {
    if (!completer.isCompleted) {
      print("[INFO] Nenhuma interação detectada após 1 minuto!");
      actReturnGesture?.call(true);
      completer.complete(true);
    }
  });

  // Usando StreamController para ouvir interações
  streamController.stream.listen((_) {
    _onUserInteraction();
  });

  // Adiciona o GestureDetector na página para escutar toques
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print("[INFO] Toque detectado pelo GestureDetector!");
        streamController.add(null); // Dispara a interação
      },
      onPanUpdate: (_) {
        print("[INFO] Pan detectado!");
        streamController.add(null); // Dispara a interação
      },
    );
  });

  print("[INFO] Aguardando interação do usuário por até 1 minuto...");
  return completer.future;
}
