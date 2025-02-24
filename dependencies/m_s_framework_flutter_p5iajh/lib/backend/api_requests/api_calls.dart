import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'interceptors.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ServerConnection Group Code

class ServerConnectionGroup {
  static String getBaseUrl({
    String? ip = '',
  }) =>
      '${ip}';
  static Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json',
  };
  static GetTokenCall getTokenCall = GetTokenCall();
  static TestConnectionCall testConnectionCall = TestConnectionCall();

  static final interceptors = [
    InterceptorVerificaToken(),
  ];
}

class GetTokenCall {
  Future<ApiCallResponse> call({
    String? path = '',
    String? cnpj = '',
    String? ip = '',
  }) async {
    final baseUrl = ServerConnectionGroup.getBaseUrl(
      ip: ip,
    );

    final ffApiRequestBody = '''
{
  "username": "${path}",
  "Password": "${cnpj}",
  "ChaveToken": "secret_my@msswfppa2010-nowjverps#avancarsempre"
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetToken',
        apiUrl: '${baseUrl}/auth/token',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: true,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ServerConnectionGroup.interceptors,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.value''',
      );
  dynamic buildMin(dynamic response) => getJsonField(
        response,
        r'''$.BuildClientMin''',
      );
  dynamic buildMax(dynamic response) => getJsonField(
        response,
        r'''$.BuildClientMax''',
      );
  dynamic buildServer(dynamic response) => getJsonField(
        response,
        r'''$.BuildServer''',
      );
  dynamic logo(dynamic response) => getJsonField(
        response,
        r'''$.ImageUrl''',
      );
}

class TestConnectionCall {
  Future<ApiCallResponse> call({
    String? ip = '',
  }) async {
    final baseUrl = ServerConnectionGroup.getBaseUrl(
      ip: ip,
    );

    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'TestConnection',
        apiUrl: '${baseUrl}/auth/testconnection',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      ServerConnectionGroup.interceptors,
    );
  }
}

/// End ServerConnection Group Code

class ConsultaCEPCall {
  static Future<ApiCallResponse> call({
    String? sCep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultaCEP',
      apiUrl: 'viacep.com.br/ws/${sCep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? jcep(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
  static String? jlogradouro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? jbairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? jcidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? juf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? jestado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.estado''',
      ));
  static String? jregiao(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.regiao''',
      ));
  static String? jibge(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ibge''',
      ));
  static String? jddd(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ddd''',
      ));
  static String? jcodsiafi(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.siafi''',
      ));
  static String? jerror(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.erro''',
      ));
}

class ConsultaCNPJCall {
  static Future<ApiCallResponse> call({
    String? sCNPJ = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultaCNPJ',
      apiUrl: 'https://publica.cnpj.ws/cnpj/${sCNPJ}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? razaoSocial(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.razao_social''',
      ));
  static String? nomeFantasia(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..nome_fantasia''',
      ));
  static String? situacaoCad(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$..situacao_cadastral''',
      ));
  static String? inscEstadual(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.estabelecimento.inscricoes_estaduais[:].inscricao_estadual''',
      ));
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
