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

import 'package:ff_commons/api_requests/api_interceptor.dart';
import 'dart:convert';

class InterceptorVerificaToken extends FFApiInterceptor {
  bool verificarTokenJWT(String? token) {
    if (token == null || token.isEmpty) {
      print('Erro: Token JWT está vazio ou não definido.');
      return false;
    }

    try {
      // Divida o token JWT e decodifique o payload (segunda parte do token)
      final parts = token.split('.');
      if (parts.length != 3) {
        throw Exception('Token inválido.');
      }

      final payload = parts[1];
      final normalized = base64Url.normalize(payload);
      final decodedBytes = base64Url.decode(normalized);
      final decodedJson = jsonDecode(utf8.decode(decodedBytes));

      // Verifique a data de expiração (campo "exp")
      final expiration = decodedJson['exp'];
      final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      if (expiration == null || currentTimestamp >= expiration) {
        return false;
      }
      return true;
    } catch (e) {
      print('Erro ao processar o token JWT: $e');
      return false;
    }
  }

  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    testConnectionServer;
    final token = FFAppState().Token;
    //final novoToken = await renovarToken();

    if (!verificarTokenJWT(token)) {
      final novoToken = await renovarToken();

      if (novoToken == null) {
        print('Erro: Falha ao renovar o token.');
        return options; // Retorna as opções, mas pode-se adicionar lógica para bloquear a requisição.
      } else {
        //print('Token renovado, continuando requisição...');
        options.headers['Authorization'] = 'Bearer $novoToken';
      }
    }

    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    final result = response;

    final jsonMap = response.jsonBody as Map<String, dynamic>? ?? {};

    final error = jsonMap['error'];
    final code = (error is Map && error['code'] != null)
        ? error['code'].toString()
        : null;

    if (response.jsonBody == null ||
        response.jsonBody is! Map ||
        response.statusCode == 500 ||
        code == 'IBNativeException') {
      return const ApiCallResponse({'value': []}, {}, 0);
    }

    return result;
  }
}
