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

import 'package:ff_commons/api_requests/api_interceptor.dart';
import 'dart:async';

class AddTimerOnRequest extends FFApiInterceptor {
  static const int _minimumResponseTimeInMillis = 700;

  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Modifique os options se necessário antes da chamada API.
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Marca o início do tempo de processamento.
    final startTime = DateTime.now();

    // Aguarda a resposta normalmente.
    final result = response;

    // Calcula o tempo que a requisição levou.
    final elapsedTime = DateTime.now().difference(startTime).inMilliseconds;

    // Se o tempo decorrido for menor que o tempo mínimo, espera o restante.
    if (elapsedTime < _minimumResponseTimeInMillis) {
      await Future.delayed(
          Duration(milliseconds: _minimumResponseTimeInMillis - elapsedTime));
    }

    // Se jsonBody for null, retorna um ApiCallResponse seguro com dados vazios
    if (result.jsonBody == null || result.jsonBody is! Map) {
      return const ApiCallResponse(
        {
          'value': []
        }, // <- sempre retorna um Map com pelo menos uma chave esperada
        {},
        0,
      );
    }

    // Retorna a resposta após garantir o tempo mínimo.
    return result;
  }
}
