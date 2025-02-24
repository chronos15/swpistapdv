import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'interceptors.dart';
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/interceptors.dart'
    as m_s_framework_flutter_p5iajh_api_interceptors;


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AutentificacaoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? usuario = '',
    String? senha = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Autentificacao',
      apiUrl: '${ip}/services/Autentificacao',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {
        'Usuario': usuario,
        'Senha': senha,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static UsuarioDataTypeStruct? usuario(dynamic response) =>
      UsuarioDataTypeStruct.maybeFromMap(getJsonField(
        response,
        r'''$.Usuario''',
      ));
  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class AbastecimentosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? demmand,
    int? skip,
    String? orderby = '',
    String? filtro = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Abastecimentos',
        apiUrl:
            '${ip}/entities/ABASTECIMENTO?${filtro}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
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

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
  ];

  static List<int>? idabastecimento(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_ABASTECIMENTO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idbico(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_BICO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? combustivel(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].COMBUSTIVEL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].DATA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? hora(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].HORA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? quantidade(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].QUANTIDADE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? precounit(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].PRECO_UNIT''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? vlrtotal(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].VLRTOTAL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? identificador(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_IDENTIFIC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? value(dynamic response) => getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?;
}

class ListaAbastecimentosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? demmand,
    int? skip,
    String? orderby = '',
    String? filtro = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'ListaAbastecimentos',
        apiUrl:
            '${ip}/entities/ABASTECIMENTO?${filtro}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
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

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
    AddTimerOnRequest(),
  ];

  static List<int>? idabastecimento(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_ABASTECIMENTO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? idbico(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_BICO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? combustivel(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].COMBUSTIVEL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? data(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].DATA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? hora(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].HORA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? quantidade(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].QUANTIDADE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? vlrtotal(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].VLRTOTAL''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<String>? identificador(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_IDENTIFIC''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<ListaAbastecimentoDataTypeStruct>? abastecimentos(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ListaAbastecimentoDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class UsuariosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    int? porta,
    String? path = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Usuarios',
      apiUrl: 'http://${ip}:${porta}/${path}/entities/USUARIO',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? senha(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value[:].SENHA''',
      ));
  static String? usuario(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value[:].USUARIO''',
      ));
  static String? vendedor(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value[:].NOME_VENDEDOR''',
      ));
  static int? idcodigo(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.value[:].ID_CODIGO''',
      ));
}

class FrentistasCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? filtro = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Frentistas',
      apiUrl: '${ip}/entities/FRENTISTA?${filtro}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? nome(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].NOME_FRENTISTA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? completo(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].NOME_FRENTISTACOMPLETO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idfrentista(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_FRENTISTA''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<FrentistasDataTypeStruct>? frentistas(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => FrentistasDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class CidadesCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? filtro = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Cidades',
        apiUrl: '${ip}/entities/CIDADE?${filtro}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
  ];

  static List<CidadesDataTypeStruct>? frentistas(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CidadesDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ConfiguracaoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Configuracao',
      apiUrl: '${ip}/entities/CONFIGURACAO_PDVPST',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ConfiguracaoDataTypeStruct>? configuracao(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ConfiguracaoDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ClientesCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? pesquisa = '',
    int? demmand,
    int? skip,
    String? orderby = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Clientes',
      apiUrl:
          '${ip}/entities/CLIENTELISTA?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<ClienteListaDataTypeStruct>? value(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ClienteListaDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ProdutosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? pesquisa = '',
    int? demmand,
    int? skip,
    String? orderby = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Produtos',
        apiUrl:
            '${ip}/entities/PRODUTOLISTA?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
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

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
    AddTimerOnRequest(),
  ];

  static List<ProdutoDataTypeStruct>? value(dynamic response) => (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ProdutoDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<String>? abreviado(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ABREVIADO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CombustiveisCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Combustiveis',
      apiUrl: '${ip}/entities/COMBUSTIVEL',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<CombustiveisDataTypeStruct>? combustiveis(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CombustiveisDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<String>? nome(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].NOME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? idproduto(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_PRODUTO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class BicosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? filtro = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Bicos',
      apiUrl: '${ip}/entities/BICOS?${filtro}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<BicosDataTypeStruct>? bicos(dynamic response) => (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BicosDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class CondPagamentosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    int? porta,
    String? path = '',
    String? token = '',
    String? pesquisa = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CondPagamentos',
      apiUrl:
          'http://${ip}:${porta}/${path}/entities/CONDPAGAMENTO?${pesquisa}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? descricao(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].DESCRICAO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? value(dynamic response) => getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_CODIGO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class VendasCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? pesquisa = '',
    String? orderby = '',
    int? demmand,
    int? skip,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Vendas',
      apiUrl:
          '${ip}/entities/VENDA_REM?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? value(dynamic response) => getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?;
  static List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].ID_CODIGO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class EmpresaCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Empresa',
        apiUrl: '${ip}/entities/EMPRESAVIEW',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: true,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
  ];

  static EmpresaDataTypeStruct? empresa(dynamic response) =>
      EmpresaDataTypeStruct.maybeFromMap(getJsonField(
        response,
        r'''$.value[0]''',
      ));
}

class VendaCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    dynamic vendajsonJson,
  }) async {
    final vendajson = _serializeJson(vendajsonJson);
    final ffApiRequestBody = '''
${vendajson}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Venda',
      apiUrl: '${ip}/entities/VENDA_REM',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? senha(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value[:].SENHA''',
      ));
  static String? nomefantasia(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.value[:].NOME_FANTASIA''',
      ));
  static String? cnpj(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value[:].CNPJ''',
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
