// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfiguracaoDataTypeStruct extends BaseStruct {
  ConfiguracaoDataTypeStruct({
    int? idKey,
    String? solicitaSenha,
  })  : _idKey = idKey,
        _solicitaSenha = solicitaSenha;

  // "ID_KEY" field.
  int? _idKey;
  int get idKey => _idKey ?? 0;
  set idKey(int? val) => _idKey = val;

  void incrementIdKey(int amount) => idKey = idKey + amount;

  bool hasIdKey() => _idKey != null;

  // "SOLICITA_SENHA" field.
  String? _solicitaSenha;
  String get solicitaSenha => _solicitaSenha ?? '';
  set solicitaSenha(String? val) => _solicitaSenha = val;

  bool hasSolicitaSenha() => _solicitaSenha != null;

  static ConfiguracaoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ConfiguracaoDataTypeStruct(
        idKey: castToType<int>(data['ID_KEY']),
        solicitaSenha: data['SOLICITA_SENHA'] as String?,
      );

  static ConfiguracaoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfiguracaoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_KEY': _idKey,
        'SOLICITA_SENHA': _solicitaSenha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_KEY': serializeParam(
          _idKey,
          ParamType.int,
        ),
        'SOLICITA_SENHA': serializeParam(
          _solicitaSenha,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfiguracaoDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConfiguracaoDataTypeStruct(
        idKey: deserializeParam(
          data['ID_KEY'],
          ParamType.int,
          false,
        ),
        solicitaSenha: deserializeParam(
          data['SOLICITA_SENHA'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfiguracaoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfiguracaoDataTypeStruct &&
        idKey == other.idKey &&
        solicitaSenha == other.solicitaSenha;
  }

  @override
  int get hashCode => const ListEquality().hash([idKey, solicitaSenha]);
}

ConfiguracaoDataTypeStruct createConfiguracaoDataTypeStruct({
  int? idKey,
  String? solicitaSenha,
}) =>
    ConfiguracaoDataTypeStruct(
      idKey: idKey,
      solicitaSenha: solicitaSenha,
    );
