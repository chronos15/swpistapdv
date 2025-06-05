// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigLocaisStruct extends BaseStruct {
  ConfigLocaisStruct({
    String? usuario,
    String? senha,
    bool? lembrarUsuario,
    String? frentista,
    GateWay? gatewayPgto,
    String? versaoServer,
    String? versaoMin,
    String? versaoMax,
    String? versaoClienteAtual,
    List<TpPagamento>? tPagDisable,
  })  : _usuario = usuario,
        _senha = senha,
        _lembrarUsuario = lembrarUsuario,
        _frentista = frentista,
        _gatewayPgto = gatewayPgto,
        _versaoServer = versaoServer,
        _versaoMin = versaoMin,
        _versaoMax = versaoMax,
        _versaoClienteAtual = versaoClienteAtual,
        _tPagDisable = tPagDisable;

  // "Usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "Senha" field.
  String? _senha;
  String get senha => _senha ?? '';
  set senha(String? val) => _senha = val;

  bool hasSenha() => _senha != null;

  // "LembrarUsuario" field.
  bool? _lembrarUsuario;
  bool get lembrarUsuario => _lembrarUsuario ?? false;
  set lembrarUsuario(bool? val) => _lembrarUsuario = val;

  bool hasLembrarUsuario() => _lembrarUsuario != null;

  // "Frentista" field.
  String? _frentista;
  String get frentista => _frentista ?? '';
  set frentista(String? val) => _frentista = val;

  bool hasFrentista() => _frentista != null;

  // "GatewayPgto" field.
  GateWay? _gatewayPgto;
  GateWay get gatewayPgto => _gatewayPgto ?? GateWay.Cielo;
  set gatewayPgto(GateWay? val) => _gatewayPgto = val;

  bool hasGatewayPgto() => _gatewayPgto != null;

  // "VersaoServer" field.
  String? _versaoServer;
  String get versaoServer => _versaoServer ?? '';
  set versaoServer(String? val) => _versaoServer = val;

  bool hasVersaoServer() => _versaoServer != null;

  // "VersaoMin" field.
  String? _versaoMin;
  String get versaoMin => _versaoMin ?? '';
  set versaoMin(String? val) => _versaoMin = val;

  bool hasVersaoMin() => _versaoMin != null;

  // "VersaoMax" field.
  String? _versaoMax;
  String get versaoMax => _versaoMax ?? '';
  set versaoMax(String? val) => _versaoMax = val;

  bool hasVersaoMax() => _versaoMax != null;

  // "VersaoClienteAtual" field.
  String? _versaoClienteAtual;
  String get versaoClienteAtual => _versaoClienteAtual ?? '';
  set versaoClienteAtual(String? val) => _versaoClienteAtual = val;

  bool hasVersaoClienteAtual() => _versaoClienteAtual != null;

  // "TPagDisable" field.
  List<TpPagamento>? _tPagDisable;
  List<TpPagamento> get tPagDisable => _tPagDisable ?? const [];
  set tPagDisable(List<TpPagamento>? val) => _tPagDisable = val;

  void updateTPagDisable(Function(List<TpPagamento>) updateFn) {
    updateFn(_tPagDisable ??= []);
  }

  bool hasTPagDisable() => _tPagDisable != null;

  static ConfigLocaisStruct fromMap(Map<String, dynamic> data) =>
      ConfigLocaisStruct(
        usuario: data['Usuario'] as String?,
        senha: data['Senha'] as String?,
        lembrarUsuario: data['LembrarUsuario'] as bool?,
        frentista: data['Frentista'] as String?,
        gatewayPgto: data['GatewayPgto'] is GateWay
            ? data['GatewayPgto']
            : deserializeEnum<GateWay>(data['GatewayPgto']),
        versaoServer: data['VersaoServer'] as String?,
        versaoMin: data['VersaoMin'] as String?,
        versaoMax: data['VersaoMax'] as String?,
        versaoClienteAtual: data['VersaoClienteAtual'] as String?,
        tPagDisable: getEnumList<TpPagamento>(data['TPagDisable']),
      );

  static ConfigLocaisStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigLocaisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Usuario': _usuario,
        'Senha': _senha,
        'LembrarUsuario': _lembrarUsuario,
        'Frentista': _frentista,
        'GatewayPgto': _gatewayPgto?.serialize(),
        'VersaoServer': _versaoServer,
        'VersaoMin': _versaoMin,
        'VersaoMax': _versaoMax,
        'VersaoClienteAtual': _versaoClienteAtual,
        'TPagDisable': _tPagDisable?.map((e) => e.serialize()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'Senha': serializeParam(
          _senha,
          ParamType.String,
        ),
        'LembrarUsuario': serializeParam(
          _lembrarUsuario,
          ParamType.bool,
        ),
        'Frentista': serializeParam(
          _frentista,
          ParamType.String,
        ),
        'GatewayPgto': serializeParam(
          _gatewayPgto,
          ParamType.Enum,
        ),
        'VersaoServer': serializeParam(
          _versaoServer,
          ParamType.String,
        ),
        'VersaoMin': serializeParam(
          _versaoMin,
          ParamType.String,
        ),
        'VersaoMax': serializeParam(
          _versaoMax,
          ParamType.String,
        ),
        'VersaoClienteAtual': serializeParam(
          _versaoClienteAtual,
          ParamType.String,
        ),
        'TPagDisable': serializeParam(
          _tPagDisable,
          ParamType.Enum,
          isList: true,
        ),
      }.withoutNulls;

  static ConfigLocaisStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigLocaisStruct(
        usuario: deserializeParam(
          data['Usuario'],
          ParamType.String,
          false,
        ),
        senha: deserializeParam(
          data['Senha'],
          ParamType.String,
          false,
        ),
        lembrarUsuario: deserializeParam(
          data['LembrarUsuario'],
          ParamType.bool,
          false,
        ),
        frentista: deserializeParam(
          data['Frentista'],
          ParamType.String,
          false,
        ),
        gatewayPgto: deserializeParam<GateWay>(
          data['GatewayPgto'],
          ParamType.Enum,
          false,
        ),
        versaoServer: deserializeParam(
          data['VersaoServer'],
          ParamType.String,
          false,
        ),
        versaoMin: deserializeParam(
          data['VersaoMin'],
          ParamType.String,
          false,
        ),
        versaoMax: deserializeParam(
          data['VersaoMax'],
          ParamType.String,
          false,
        ),
        versaoClienteAtual: deserializeParam(
          data['VersaoClienteAtual'],
          ParamType.String,
          false,
        ),
        tPagDisable: deserializeParam<TpPagamento>(
          data['TPagDisable'],
          ParamType.Enum,
          true,
        ),
      );

  @override
  String toString() => 'ConfigLocaisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigLocaisStruct &&
        usuario == other.usuario &&
        senha == other.senha &&
        lembrarUsuario == other.lembrarUsuario &&
        frentista == other.frentista &&
        gatewayPgto == other.gatewayPgto &&
        versaoServer == other.versaoServer &&
        versaoMin == other.versaoMin &&
        versaoMax == other.versaoMax &&
        versaoClienteAtual == other.versaoClienteAtual &&
        listEquality.equals(tPagDisable, other.tPagDisable);
  }

  @override
  int get hashCode => const ListEquality().hash([
        usuario,
        senha,
        lembrarUsuario,
        frentista,
        gatewayPgto,
        versaoServer,
        versaoMin,
        versaoMax,
        versaoClienteAtual,
        tPagDisable
      ]);
}

ConfigLocaisStruct createConfigLocaisStruct({
  String? usuario,
  String? senha,
  bool? lembrarUsuario,
  String? frentista,
  GateWay? gatewayPgto,
  String? versaoServer,
  String? versaoMin,
  String? versaoMax,
  String? versaoClienteAtual,
}) =>
    ConfigLocaisStruct(
      usuario: usuario,
      senha: senha,
      lembrarUsuario: lembrarUsuario,
      frentista: frentista,
      gatewayPgto: gatewayPgto,
      versaoServer: versaoServer,
      versaoMin: versaoMin,
      versaoMax: versaoMax,
      versaoClienteAtual: versaoClienteAtual,
    );
