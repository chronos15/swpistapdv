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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> validateServerConnection(
    String? hostIP,
    String? hostIP2,
    String? hostIP3,
    String? sViaComunicacao,
    String? iPorta,
    String? sPath,
    String? host) async {
  // Add your function code here!
  String? newHost = host
      ?.replaceFirst('${sViaComunicacao}://', '')
      .replaceFirst(':${iPorta}/${sPath}', '');

  //print('$newHost');

  List<String?> hosts = [newHost, hostIP, hostIP2, hostIP3];

  for (var i = 0; i < hosts.length; i++) {
    // Constrói o `currentHost` de forma segura usando o operador `?`
    String? baseHost = hosts[i];
    if (baseHost == null || baseHost.isEmpty) {
      //print('Host IP inválido para a tentativa ${i + 1}');
      continue;
    }

    String currentHost = '${sViaComunicacao}://'
        '$baseHost:${iPorta}'
        '/${sPath}/auth/testconnection';

    try {
      //print(
      //'Tentando conectar com o servidor: $currentHost (tentativa ${i + 1})');
      final response = await http
          .post(
            Uri.parse(currentHost),
            headers: {
              'Content-Type': 'application/json',
              'Access-Control-Allow-Origin': '*',
            },
            body: json.encode({}),
          )
          .timeout(Duration(milliseconds: 700));

      //print('Resposta recebida com código: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        //print('Corpo da resposta: $responseBody');

        if (responseBody is Map<String, dynamic> &&
            responseBody['value'] is bool) {
          //print('Valor booleano encontrado: ${responseBody['value']}');

          // Define o host correto no FFAppState
          host = '${sViaComunicacao}://'
              '$baseHost:${iPorta}'
              '/${sPath}';
          //print('Host correto configurado: $currentHost tentativa ${i + 1}');

          return responseBody['value'];
        } else {
          //print('Campo "value" não encontrado ou não é booleano');
        }
      } else {
        //print('Falha na requisição. Status code: ${response.statusCode}');
      }
    } catch (e) {
      //print('Erro na conexão ou timeout: $e');
    }
  }

  //print('Retornando false após falhas nas três tentativas de conexão');
  return false;
}
