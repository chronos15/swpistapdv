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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Autentificacao',
        apiUrl: '${ip}/services/Autentificacao',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
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
      ),

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
  ];

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

class VerificaTerminalCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? id,
    String? dispositivo = '',
    String? serial = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'VerificaTerminal',
        apiUrl: '${ip}/services/VerificaTerminal',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'id': id,
          'dispositivo': dispositivo,
          'serial': serial,
        },

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

class AbastecimentoUnicoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? id,
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'AbastecimentoUnico',
        apiUrl:
            '${ip}/entities/ABASTECIMENTO?\$filter=(COD_ABASTECIMENTO EQ \'${id}\')&\$orderby=DATAHORA desc&\$top=1&\$skip=0',
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

  static List? abastecimento(dynamic response) => getJsonField(
        response,
        r'''$.value[0]''',
        true,
      ) as List?;
}

class VerificaAbastecimentoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? id,
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'VerificaAbastecimento',
        apiUrl: '${ip}/Services/AbastecimentoDisponível',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'aid': id,
        },

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

  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.value''',
      ));
}

class UsuariosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    int? porta,
    String? path = '',
    String? token = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Usuarios',
        apiUrl: 'http://${ip}:${porta}/${path}/entities/USUARIO',
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Frentistas',
        apiUrl: '${ip}/entities/FRENTISTA?${filtro}&\$orderby=NOME_FRENTISTA',
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
    AddTimerOnRequest(),
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Configuracao',
        apiUrl: '${ip}/entities/CONFIGURACAO_PDVPST',
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Clientes',
        apiUrl:
            '${ip}/entities/CLIENTELISTA?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
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

class ValeCombustivelCall {
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
        callName: 'ValeCombustivel',
        apiUrl:
            '${ip}/entities/VALECOMBUSTIVEL?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
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

  static List<ValeCombustivelDataTypeStruct>? value(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ValeCombustivelDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ValeCombustivelListaCall {
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
        callName: 'ValeCombustivelLista',
        apiUrl:
            '${ip}/entities/VALECOMBUSTIVELLISTA?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
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

  static List<ValeCombustivelDataTypeStruct>? value(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ValeCombustivelDataTypeStruct.maybeFromMap(x))
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Combustiveis',
        apiUrl: '${ip}/entities/COMBUSTIVEL',
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

class GruposCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Grupos',
        apiUrl: '${ip}/entities/GRUPO',
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

  static List<GrupoDataTypeStruct>? grupos(dynamic response) => (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => GrupoDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<String>? descricao(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].DESCRICAO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

class BicosCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    String? filtro = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Bicos',
        apiUrl: '${ip}/entities/BICOS?${filtro}',
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
    String? pesquisa = '',
    String? token = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'CondPagamentos',
        apiUrl: '${ip}/entities/CONDPAGAMENTO?${pesquisa}',
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

  static List<String>? descricao(dynamic response) => (getJsonField(
        response,
        r'''$.value[:].DESCRICAO''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<CondPagamentoDataTypeStruct>? value(dynamic response) =>
      (getJsonField(
        response,
        r'''$.value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CondPagamentoDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
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

class BuscaNFeCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    int? idVenda,
    String? token = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'BuscaNFe',
        apiUrl: '${ip}/entities/VENDANFE(${idVenda})/IMAGEM_NFE',
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Vendas',
        apiUrl:
            '${ip}/entities/VENDA_REM?${pesquisa}&\$orderby=${orderby}&\$top=${demmand}&\$skip=${skip}',
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
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'Venda',
        apiUrl: '${ip}/Services/EnviaVenda',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
          'xdata-expand-level': '3',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
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

  static dynamic value(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? idretorno(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id_key''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic vendaRem(dynamic response) => getJsonField(
        response,
        r'''$.Venda''',
      );
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static int? novodoc(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.novodoc''',
      ));
}

class GetStatusNFeCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? idVenda,
  }) async {
    final ffApiRequestBody = '''
{
  "IdVenda": ${idVenda}
}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetStatusNFe',
        apiUrl: '${ip}/Services/GetResponseNFe',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
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

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value''',
      ));
}

class GetNumDocumentoFiscalCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    int? idVenda,
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'GetNumDocumentoFiscal',
        apiUrl: '${ip}/Services/GetNumDoc',
        callType: ApiCallType.GET,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {
          'IdVenda': idVenda,
        },

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

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value''',
      ));
}

class AddListaAbastecimentoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    dynamic listaAbastecimentoJson,
  }) async {
    final listaAbastecimento = _serializeJson(listaAbastecimentoJson, true);
    final ffApiRequestBody = '''
${listaAbastecimento}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'AddListaAbastecimento',
        apiUrl: '${ip}/Services/AdicionaListaAbastecimento',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
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

  static bool? resultCall(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result''',
      ));
}

class AddRemoveVerificaAbastecimentoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    dynamic aparamsJson,
  }) async {
    final aparams = _serializeJson(aparamsJson);
    final ffApiRequestBody = '''
${aparams}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'AddRemoveVerificaAbastecimento',
        apiUrl: '${ip}/Services/AbastecimentoEmUso',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
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

  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result''',
      ));
  static String? mensagem(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mensagem''',
      ));
  static List<int>? abastindisponiveis(dynamic response) => (getJsonField(
        response,
        r'''$.abastind''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List? abastinuso(dynamic response) => getJsonField(
        response,
        r'''$.idcodigo''',
        true,
      ) as List?;
  static List? terminaisemuso(dynamic response) => getJsonField(
        response,
        r'''$.terminais''',
        true,
      ) as List?;
}

class AddAbastecimentoCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
    String? token = '',
    dynamic listaAbastecimentoJson,
  }) async {
    final listaAbastecimento = _serializeJson(listaAbastecimentoJson);
    final ffApiRequestBody = '''
${listaAbastecimento}''';
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'AddAbastecimento',
        apiUrl: '${ip}/Services/AdicionaAbastecimento',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {
          'Content-Type': 'application/json',
          'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
        },
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
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

  static bool? resultCall(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.result''',
      ));
  static int? returnID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.value''',
      ));
}

class TestConnectAppCall {
  static Future<ApiCallResponse> call({
    String? ip = '',
  }) async {
    return FFApiInterceptor.makeApiCall(
      // ignore: prefer_const_constructors - can be mutated by interceptors
      ApiCallOptions(
        callName: 'TestConnectApp',
        apiUrl: '${ip}/auth/testconnection',
        callType: ApiCallType.POST,
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        headers: {},
        // ignore: prefer_const_literals_to_create_immutables - can be mutated by interceptors
        params: {},

        bodyType: BodyType.NONE,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: true,
        alwaysAllowBody: false,
      ),

      interceptors,
    );
  }

  static final interceptors = [
    m_s_framework_flutter_p5iajh_api_interceptors.InterceptorVerificaToken(),
  ];
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
