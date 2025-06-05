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

import 'index.dart'; // Imports other custom actions

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

Future<bool> testConnectionServer() async {
  String? newHost = FFAppState()
      .ConfigGlobaisServer
      .host
      .replaceFirst('${FFAppState().ConfigGlobaisServer.viacomunicao}://', '')
      .replaceFirst(
          ':${FFAppState().ConfigGlobaisServer.porta}/${FFAppState().ConfigGlobaisServer.path}',
          '');

  List<String?> hosts = [
    newHost,
    FFAppState().ConfigGlobaisServer.hostPrimario,
    FFAppState().ConfigGlobaisServer.hostSecundario,
    FFAppState().ConfigGlobaisServer.hostTerciario
  ];

  for (var i = 0; i < hosts.length; i++) {
    String? baseHost = hosts[i];
    if (baseHost == null || baseHost.isEmpty) {
      continue;
    }

    String currentHost = '${FFAppState().ConfigGlobaisServer.viacomunicao}://'
        '$baseHost:${FFAppState().ConfigGlobaisServer.porta}'
        '/${FFAppState().ConfigGlobaisServer.path}/auth/testconnection';

    try {
      final response = await http
          .post(
            Uri.parse(currentHost),
            headers: {
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*',
            },
            body: json.encode({}),
          )
          .timeout(const Duration(milliseconds: 700));

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic> &&
            responseBody['value'] is bool) {
          // Atualiza o host no estado global
          FFAppState().ConfigGlobaisServer.host =
              '${FFAppState().ConfigGlobaisServer.viacomunicao}://'
              '$baseHost:${FFAppState().ConfigGlobaisServer.porta}'
              '/${FFAppState().ConfigGlobaisServer.path}';

          return responseBody['value'];
        }
      }
    } on TimeoutException {
      print('Timeout ao tentar conectar com $currentHost');
    } on SocketException {
      print('Erro de rede ao tentar conectar com $currentHost');
    } catch (e) {
      print('Erro inesperado ao conectar com $currentHost: $e');
    }
  }

  print('Falha ao conectar com todos os servidores disponíveis.');
  return false;
}
