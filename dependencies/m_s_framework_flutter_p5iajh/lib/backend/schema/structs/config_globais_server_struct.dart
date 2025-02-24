// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigGlobaisServerStruct extends BaseStruct {
  ConfigGlobaisServerStruct({
    String? host,
    String? hostPrimario,
    String? hostSecundario,
    String? hostTerciario,
    int? porta,
    String? path,
    String? cnpj,
    int? terminal,
    String? chaveacesso,
    String? viacomunicao,
  })  : _host = host,
        _hostPrimario = hostPrimario,
        _hostSecundario = hostSecundario,
        _hostTerciario = hostTerciario,
        _porta = porta,
        _path = path,
        _cnpj = cnpj,
        _terminal = terminal,
        _chaveacesso = chaveacesso,
        _viacomunicao = viacomunicao;

  // "HOST" field.
  String? _host;
  String get host => _host ?? '';
  set host(String? val) => _host = val;

  bool hasHost() => _host != null;

  // "HOST_PRIMARIO" field.
  String? _hostPrimario;
  String get hostPrimario => _hostPrimario ?? '';
  set hostPrimario(String? val) => _hostPrimario = val;

  bool hasHostPrimario() => _hostPrimario != null;

  // "HOST_SECUNDARIO" field.
  String? _hostSecundario;
  String get hostSecundario => _hostSecundario ?? '';
  set hostSecundario(String? val) => _hostSecundario = val;

  bool hasHostSecundario() => _hostSecundario != null;

  // "HOST_TERCIARIO" field.
  String? _hostTerciario;
  String get hostTerciario => _hostTerciario ?? '';
  set hostTerciario(String? val) => _hostTerciario = val;

  bool hasHostTerciario() => _hostTerciario != null;

  // "PORTA" field.
  int? _porta;
  int get porta => _porta ?? 0;
  set porta(int? val) => _porta = val;

  void incrementPorta(int amount) => porta = porta + amount;

  bool hasPorta() => _porta != null;

  // "PATH" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "CNPJ" field.
  String? _cnpj;
  String get cnpj => _cnpj ?? '';
  set cnpj(String? val) => _cnpj = val;

  bool hasCnpj() => _cnpj != null;

  // "TERMINAL" field.
  int? _terminal;
  int get terminal => _terminal ?? 0;
  set terminal(int? val) => _terminal = val;

  void incrementTerminal(int amount) => terminal = terminal + amount;

  bool hasTerminal() => _terminal != null;

  // "CHAVEACESSO" field.
  String? _chaveacesso;
  String get chaveacesso => _chaveacesso ?? '';
  set chaveacesso(String? val) => _chaveacesso = val;

  bool hasChaveacesso() => _chaveacesso != null;

  // "VIACOMUNICAO" field.
  String? _viacomunicao;
  String get viacomunicao => _viacomunicao ?? '';
  set viacomunicao(String? val) => _viacomunicao = val;

  bool hasViacomunicao() => _viacomunicao != null;

  static ConfigGlobaisServerStruct fromMap(Map<String, dynamic> data) =>
      ConfigGlobaisServerStruct(
        host: data['HOST'] as String?,
        hostPrimario: data['HOST_PRIMARIO'] as String?,
        hostSecundario: data['HOST_SECUNDARIO'] as String?,
        hostTerciario: data['HOST_TERCIARIO'] as String?,
        porta: castToType<int>(data['PORTA']),
        path: data['PATH'] as String?,
        cnpj: data['CNPJ'] as String?,
        terminal: castToType<int>(data['TERMINAL']),
        chaveacesso: data['CHAVEACESSO'] as String?,
        viacomunicao: data['VIACOMUNICAO'] as String?,
      );

  static ConfigGlobaisServerStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigGlobaisServerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'HOST': _host,
        'HOST_PRIMARIO': _hostPrimario,
        'HOST_SECUNDARIO': _hostSecundario,
        'HOST_TERCIARIO': _hostTerciario,
        'PORTA': _porta,
        'PATH': _path,
        'CNPJ': _cnpj,
        'TERMINAL': _terminal,
        'CHAVEACESSO': _chaveacesso,
        'VIACOMUNICAO': _viacomunicao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'HOST': serializeParam(
          _host,
          ParamType.String,
        ),
        'HOST_PRIMARIO': serializeParam(
          _hostPrimario,
          ParamType.String,
        ),
        'HOST_SECUNDARIO': serializeParam(
          _hostSecundario,
          ParamType.String,
        ),
        'HOST_TERCIARIO': serializeParam(
          _hostTerciario,
          ParamType.String,
        ),
        'PORTA': serializeParam(
          _porta,
          ParamType.int,
        ),
        'PATH': serializeParam(
          _path,
          ParamType.String,
        ),
        'CNPJ': serializeParam(
          _cnpj,
          ParamType.String,
        ),
        'TERMINAL': serializeParam(
          _terminal,
          ParamType.int,
        ),
        'CHAVEACESSO': serializeParam(
          _chaveacesso,
          ParamType.String,
        ),
        'VIACOMUNICAO': serializeParam(
          _viacomunicao,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigGlobaisServerStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConfigGlobaisServerStruct(
        host: deserializeParam(
          data['HOST'],
          ParamType.String,
          false,
        ),
        hostPrimario: deserializeParam(
          data['HOST_PRIMARIO'],
          ParamType.String,
          false,
        ),
        hostSecundario: deserializeParam(
          data['HOST_SECUNDARIO'],
          ParamType.String,
          false,
        ),
        hostTerciario: deserializeParam(
          data['HOST_TERCIARIO'],
          ParamType.String,
          false,
        ),
        porta: deserializeParam(
          data['PORTA'],
          ParamType.int,
          false,
        ),
        path: deserializeParam(
          data['PATH'],
          ParamType.String,
          false,
        ),
        cnpj: deserializeParam(
          data['CNPJ'],
          ParamType.String,
          false,
        ),
        terminal: deserializeParam(
          data['TERMINAL'],
          ParamType.int,
          false,
        ),
        chaveacesso: deserializeParam(
          data['CHAVEACESSO'],
          ParamType.String,
          false,
        ),
        viacomunicao: deserializeParam(
          data['VIACOMUNICAO'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigGlobaisServerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigGlobaisServerStruct &&
        host == other.host &&
        hostPrimario == other.hostPrimario &&
        hostSecundario == other.hostSecundario &&
        hostTerciario == other.hostTerciario &&
        porta == other.porta &&
        path == other.path &&
        cnpj == other.cnpj &&
        terminal == other.terminal &&
        chaveacesso == other.chaveacesso &&
        viacomunicao == other.viacomunicao;
  }

  @override
  int get hashCode => const ListEquality().hash([
        host,
        hostPrimario,
        hostSecundario,
        hostTerciario,
        porta,
        path,
        cnpj,
        terminal,
        chaveacesso,
        viacomunicao
      ]);
}

ConfigGlobaisServerStruct createConfigGlobaisServerStruct({
  String? host,
  String? hostPrimario,
  String? hostSecundario,
  String? hostTerciario,
  int? porta,
  String? path,
  String? cnpj,
  int? terminal,
  String? chaveacesso,
  String? viacomunicao,
}) =>
    ConfigGlobaisServerStruct(
      host: host,
      hostPrimario: hostPrimario,
      hostSecundario: hostSecundario,
      hostTerciario: hostTerciario,
      porta: porta,
      path: path,
      cnpj: cnpj,
      terminal: terminal,
      chaveacesso: chaveacesso,
      viacomunicao: viacomunicao,
    );
