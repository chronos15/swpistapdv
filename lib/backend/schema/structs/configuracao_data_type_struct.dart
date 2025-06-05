// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfiguracaoDataTypeStruct extends BaseStruct {
  ConfiguracaoDataTypeStruct({
    int? idKey,
    String? solicitaSenha,
    double? vlrparcMin,
    String? valecombClicad,
  })  : _idKey = idKey,
        _solicitaSenha = solicitaSenha,
        _vlrparcMin = vlrparcMin,
        _valecombClicad = valecombClicad;

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

  // "VLRPARC_MIN" field.
  double? _vlrparcMin;
  double get vlrparcMin => _vlrparcMin ?? 0.0;
  set vlrparcMin(double? val) => _vlrparcMin = val;

  void incrementVlrparcMin(double amount) => vlrparcMin = vlrparcMin + amount;

  bool hasVlrparcMin() => _vlrparcMin != null;

  // "VALECOMB_CLICAD" field.
  String? _valecombClicad;
  String get valecombClicad => _valecombClicad ?? '';
  set valecombClicad(String? val) => _valecombClicad = val;

  bool hasValecombClicad() => _valecombClicad != null;

  static ConfiguracaoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ConfiguracaoDataTypeStruct(
        idKey: castToType<int>(data['ID_KEY']),
        solicitaSenha: data['SOLICITA_SENHA'] as String?,
        vlrparcMin: castToType<double>(data['VLRPARC_MIN']),
        valecombClicad: data['VALECOMB_CLICAD'] as String?,
      );

  static ConfiguracaoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfiguracaoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_KEY': _idKey,
        'SOLICITA_SENHA': _solicitaSenha,
        'VLRPARC_MIN': _vlrparcMin,
        'VALECOMB_CLICAD': _valecombClicad,
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
        'VLRPARC_MIN': serializeParam(
          _vlrparcMin,
          ParamType.double,
        ),
        'VALECOMB_CLICAD': serializeParam(
          _valecombClicad,
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
        vlrparcMin: deserializeParam(
          data['VLRPARC_MIN'],
          ParamType.double,
          false,
        ),
        valecombClicad: deserializeParam(
          data['VALECOMB_CLICAD'],
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
        solicitaSenha == other.solicitaSenha &&
        vlrparcMin == other.vlrparcMin &&
        valecombClicad == other.valecombClicad;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idKey, solicitaSenha, vlrparcMin, valecombClicad]);
}

ConfiguracaoDataTypeStruct createConfiguracaoDataTypeStruct({
  int? idKey,
  String? solicitaSenha,
  double? vlrparcMin,
  String? valecombClicad,
}) =>
    ConfiguracaoDataTypeStruct(
      idKey: idKey,
      solicitaSenha: solicitaSenha,
      vlrparcMin: vlrparcMin,
      valecombClicad: valecombClicad,
    );
