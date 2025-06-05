// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DTRetornoValorStruct extends BaseStruct {
  DTRetornoValorStruct({
    double? valor,
    double? troco,
  })  : _valor = valor,
        _troco = troco;

  // "Valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "Troco" field.
  double? _troco;
  double get troco => _troco ?? 0.0;
  set troco(double? val) => _troco = val;

  void incrementTroco(double amount) => troco = troco + amount;

  bool hasTroco() => _troco != null;

  static DTRetornoValorStruct fromMap(Map<String, dynamic> data) =>
      DTRetornoValorStruct(
        valor: castToType<double>(data['Valor']),
        troco: castToType<double>(data['Troco']),
      );

  static DTRetornoValorStruct? maybeFromMap(dynamic data) => data is Map
      ? DTRetornoValorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Valor': _valor,
        'Troco': _troco,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'Troco': serializeParam(
          _troco,
          ParamType.double,
        ),
      }.withoutNulls;

  static DTRetornoValorStruct fromSerializableMap(Map<String, dynamic> data) =>
      DTRetornoValorStruct(
        valor: deserializeParam(
          data['Valor'],
          ParamType.double,
          false,
        ),
        troco: deserializeParam(
          data['Troco'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DTRetornoValorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DTRetornoValorStruct &&
        valor == other.valor &&
        troco == other.troco;
  }

  @override
  int get hashCode => const ListEquality().hash([valor, troco]);
}

DTRetornoValorStruct createDTRetornoValorStruct({
  double? valor,
  double? troco,
}) =>
    DTRetornoValorStruct(
      valor: valor,
      troco: troco,
    );
