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

import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

StreamController<Map<String, dynamic>> _messageController =
    StreamController.broadcast();

Future<void> notificaoWebSocket(String? host) async {
  if (host == null) {
    // Emite um erro no StreamController se o host for nulo
    _messageController
        .add({'status': 'error', 'message': 'Host WebSocket não definido.'});
    return;
  }

  WebSocketChannel? channel;
  try {
    // Tenta se conectar ao WebSocket
    channel = WebSocketChannel.connect(Uri.parse(host));

    print('Conectado ao WebSocket: $host');

    // Escuta as mensagens do WebSocket
    await for (var message in channel.stream) {
      print('Mensagem recebida: $message');

      // Envia a mensagem recebida para o StreamController
      _messageController.add({
        'status': 'success',
        'message': message,
      });
    }
  } catch (error) {
    // Em caso de erro, envia uma mensagem de erro para o StreamController
    _messageController.add({
      'status': 'error',
      'message': 'Erro ao se conectar ou receber dados: $error',
    });
  } finally {
    // Se o WebSocket foi fechado, tenta reconectar
    if (channel != null && channel.closeCode != null) {
      print('WebSocket desconectado. Tentando reconectar...');
      await Future.delayed(Duration(seconds: 5));
      notificaoWebSocket(host); // Reconectar
    }
    // Fecha o canal WebSocket quando terminar
    await channel?.sink.close();
  }
}

Stream<Map<String, dynamic>> get messageStream => _messageController.stream;

void closeStream() {
  _messageController.close();
}
