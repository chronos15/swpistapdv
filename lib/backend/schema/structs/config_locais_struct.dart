// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigLocaisStruct extends BaseStruct {
  ConfigLocaisStruct({
    String? usuario,
    String? senha,
    bool? lembrarUsuario,
    String? frentista,
  })  : _usuario = usuario,
        _senha = senha,
        _lembrarUsuario = lembrarUsuario,
        _frentista = frentista;

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

  static ConfigLocaisStruct fromMap(Map<String, dynamic> data) =>
      ConfigLocaisStruct(
        usuario: data['Usuario'] as String?,
        senha: data['Senha'] as String?,
        lembrarUsuario: data['LembrarUsuario'] as bool?,
        frentista: data['Frentista'] as String?,
      );

  static ConfigLocaisStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigLocaisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Usuario': _usuario,
        'Senha': _senha,
        'LembrarUsuario': _lembrarUsuario,
        'Frentista': _frentista,
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
      );

  @override
  String toString() => 'ConfigLocaisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigLocaisStruct &&
        usuario == other.usuario &&
        senha == other.senha &&
        lembrarUsuario == other.lembrarUsuario &&
        frentista == other.frentista;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([usuario, senha, lembrarUsuario, frentista]);
}

ConfigLocaisStruct createConfigLocaisStruct({
  String? usuario,
  String? senha,
  bool? lembrarUsuario,
  String? frentista,
}) =>
    ConfigLocaisStruct(
      usuario: usuario,
      senha: senha,
      lembrarUsuario: lembrarUsuario,
      frentista: frentista,
    );
