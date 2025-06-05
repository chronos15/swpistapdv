// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ValueVoucherValeStruct extends BaseStruct {
  ValueVoucherValeStruct({
    String? value,
    TpPagamento? payTp,
    double? desconto,
    int? parcela,
    int? idPagReturn,
  })  : _value = value,
        _payTp = payTp,
        _desconto = desconto,
        _parcela = parcela,
        _idPagReturn = idPagReturn;

  // "Value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "PayTp" field.
  TpPagamento? _payTp;
  TpPagamento? get payTp => _payTp;
  set payTp(TpPagamento? val) => _payTp = val;

  bool hasPayTp() => _payTp != null;

  // "Desconto" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  set desconto(double? val) => _desconto = val;

  void incrementDesconto(double amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  // "Parcela" field.
  int? _parcela;
  int get parcela => _parcela ?? 0;
  set parcela(int? val) => _parcela = val;

  void incrementParcela(int amount) => parcela = parcela + amount;

  bool hasParcela() => _parcela != null;

  // "idPagReturn" field.
  int? _idPagReturn;
  int get idPagReturn => _idPagReturn ?? 0;
  set idPagReturn(int? val) => _idPagReturn = val;

  void incrementIdPagReturn(int amount) => idPagReturn = idPagReturn + amount;

  bool hasIdPagReturn() => _idPagReturn != null;

  static ValueVoucherValeStruct fromMap(Map<String, dynamic> data) =>
      ValueVoucherValeStruct(
        value: data['Value'] as String?,
        payTp: data['PayTp'] is TpPagamento
            ? data['PayTp']
            : deserializeEnum<TpPagamento>(data['PayTp']),
        desconto: castToType<double>(data['Desconto']),
        parcela: castToType<int>(data['Parcela']),
        idPagReturn: castToType<int>(data['idPagReturn']),
      );

  static ValueVoucherValeStruct? maybeFromMap(dynamic data) => data is Map
      ? ValueVoucherValeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Value': _value,
        'PayTp': _payTp?.serialize(),
        'Desconto': _desconto,
        'Parcela': _parcela,
        'idPagReturn': _idPagReturn,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Value': serializeParam(
          _value,
          ParamType.String,
        ),
        'PayTp': serializeParam(
          _payTp,
          ParamType.Enum,
        ),
        'Desconto': serializeParam(
          _desconto,
          ParamType.double,
        ),
        'Parcela': serializeParam(
          _parcela,
          ParamType.int,
        ),
        'idPagReturn': serializeParam(
          _idPagReturn,
          ParamType.int,
        ),
      }.withoutNulls;

  static ValueVoucherValeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ValueVoucherValeStruct(
        value: deserializeParam(
          data['Value'],
          ParamType.String,
          false,
        ),
        payTp: deserializeParam<TpPagamento>(
          data['PayTp'],
          ParamType.Enum,
          false,
        ),
        desconto: deserializeParam(
          data['Desconto'],
          ParamType.double,
          false,
        ),
        parcela: deserializeParam(
          data['Parcela'],
          ParamType.int,
          false,
        ),
        idPagReturn: deserializeParam(
          data['idPagReturn'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ValueVoucherValeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ValueVoucherValeStruct &&
        value == other.value &&
        payTp == other.payTp &&
        desconto == other.desconto &&
        parcela == other.parcela &&
        idPagReturn == other.idPagReturn;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([value, payTp, desconto, parcela, idPagReturn]);
}

ValueVoucherValeStruct createValueVoucherValeStruct({
  String? value,
  TpPagamento? payTp,
  double? desconto,
  int? parcela,
  int? idPagReturn,
}) =>
    ValueVoucherValeStruct(
      value: value,
      payTp: payTp,
      desconto: desconto,
      parcela: parcela,
      idPagReturn: idPagReturn,
    );
