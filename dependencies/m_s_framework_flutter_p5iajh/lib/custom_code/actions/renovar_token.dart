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

Future<String?> renovarToken() async {
  // Add your function code here!
  final url =
      '${FFAppState().ConfigGlobaisServer.host}/auth/token'; // Substitua pela URL da API.
  final body = {
    "username": FFAppState().ConfigGlobaisServer.path,
    "Password": FFAppState().ConfigGlobaisServer.cnpj,
    "ChaveToken": "secret_my@msswfppa2010-nowjverps#avancarsempre"
  };

  try {
    // Realiza a requisição POST.
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    // Verifica o status da resposta.
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      // Extrai o token do campo `value`.
      final newToken = decodedResponse['value'];

      if (newToken != null && newToken.isNotEmpty) {
        // Atualiza o estado global com o novo token.
        FFAppState().Token = newToken;
        //print('Token renovado com sucesso.');
        return newToken;
      } else {
        return null;
      }
    } else {
      print(
          'Erro: Não foi possível renovar o token. Status: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Erro ao tentar renovar o token: $e');
    return null;
  }
}
