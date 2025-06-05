// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentDataTypeStruct extends BaseStruct {
  PaymentDataTypeStruct({
    double? valor,
    TpPagamento? tPPagEnum,
    int? parcelas,
    bool? confirmado,
    int? bModoReg,
    DadosTEFStruct? tefProcessado,
    double? troco,
  })  : _valor = valor,
        _tPPagEnum = tPPagEnum,
        _parcelas = parcelas,
        _confirmado = confirmado,
        _bModoReg = bModoReg,
        _tefProcessado = tefProcessado,
        _troco = troco;

  // "VALOR" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "TPPagEnum" field.
  TpPagamento? _tPPagEnum;
  TpPagamento? get tPPagEnum => _tPPagEnum;
  set tPPagEnum(TpPagamento? val) => _tPPagEnum = val;

  bool hasTPPagEnum() => _tPPagEnum != null;

  // "Parcelas" field.
  int? _parcelas;
  int get parcelas => _parcelas ?? 1;
  set parcelas(int? val) => _parcelas = val;

  void incrementParcelas(int amount) => parcelas = parcelas + amount;

  bool hasParcelas() => _parcelas != null;

  // "Confirmado" field.
  bool? _confirmado;
  bool get confirmado => _confirmado ?? false;
  set confirmado(bool? val) => _confirmado = val;

  bool hasConfirmado() => _confirmado != null;

  // "bModoReg" field.
  int? _bModoReg;
  int get bModoReg => _bModoReg ?? 0;
  set bModoReg(int? val) => _bModoReg = val;

  void incrementBModoReg(int amount) => bModoReg = bModoReg + amount;

  bool hasBModoReg() => _bModoReg != null;

  // "TefProcessado" field.
  DadosTEFStruct? _tefProcessado;
  DadosTEFStruct get tefProcessado => _tefProcessado ?? DadosTEFStruct();
  set tefProcessado(DadosTEFStruct? val) => _tefProcessado = val;

  void updateTefProcessado(Function(DadosTEFStruct) updateFn) {
    updateFn(_tefProcessado ??= DadosTEFStruct());
  }

  bool hasTefProcessado() => _tefProcessado != null;

  // "Troco" field.
  double? _troco;
  double get troco => _troco ?? 0.0;
  set troco(double? val) => _troco = val;

  void incrementTroco(double amount) => troco = troco + amount;

  bool hasTroco() => _troco != null;

  static PaymentDataTypeStruct fromMap(Map<String, dynamic> data) =>
      PaymentDataTypeStruct(
        valor: castToType<double>(data['VALOR']),
        tPPagEnum: data['TPPagEnum'] is TpPagamento
            ? data['TPPagEnum']
            : deserializeEnum<TpPagamento>(data['TPPagEnum']),
        parcelas: castToType<int>(data['Parcelas']),
        confirmado: data['Confirmado'] as bool?,
        bModoReg: castToType<int>(data['bModoReg']),
        tefProcessado: data['TefProcessado'] is DadosTEFStruct
            ? data['TefProcessado']
            : DadosTEFStruct.maybeFromMap(data['TefProcessado']),
        troco: castToType<double>(data['Troco']),
      );

  static PaymentDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'VALOR': _valor,
        'TPPagEnum': _tPPagEnum?.serialize(),
        'Parcelas': _parcelas,
        'Confirmado': _confirmado,
        'bModoReg': _bModoReg,
        'TefProcessado': _tefProcessado?.toMap(),
        'Troco': _troco,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'VALOR': serializeParam(
          _valor,
          ParamType.double,
        ),
        'TPPagEnum': serializeParam(
          _tPPagEnum,
          ParamType.Enum,
        ),
        'Parcelas': serializeParam(
          _parcelas,
          ParamType.int,
        ),
        'Confirmado': serializeParam(
          _confirmado,
          ParamType.bool,
        ),
        'bModoReg': serializeParam(
          _bModoReg,
          ParamType.int,
        ),
        'TefProcessado': serializeParam(
          _tefProcessado,
          ParamType.DataStruct,
        ),
        'Troco': serializeParam(
          _troco,
          ParamType.double,
        ),
      }.withoutNulls;

  static PaymentDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentDataTypeStruct(
        valor: deserializeParam(
          data['VALOR'],
          ParamType.double,
          false,
        ),
        tPPagEnum: deserializeParam<TpPagamento>(
          data['TPPagEnum'],
          ParamType.Enum,
          false,
        ),
        parcelas: deserializeParam(
          data['Parcelas'],
          ParamType.int,
          false,
        ),
        confirmado: deserializeParam(
          data['Confirmado'],
          ParamType.bool,
          false,
        ),
        bModoReg: deserializeParam(
          data['bModoReg'],
          ParamType.int,
          false,
        ),
        tefProcessado: deserializeStructParam(
          data['TefProcessado'],
          ParamType.DataStruct,
          false,
          structBuilder: DadosTEFStruct.fromSerializableMap,
        ),
        troco: deserializeParam(
          data['Troco'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PaymentDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentDataTypeStruct &&
        valor == other.valor &&
        tPPagEnum == other.tPPagEnum &&
        parcelas == other.parcelas &&
        confirmado == other.confirmado &&
        bModoReg == other.bModoReg &&
        tefProcessado == other.tefProcessado &&
        troco == other.troco;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [valor, tPPagEnum, parcelas, confirmado, bModoReg, tefProcessado, troco]);
}

PaymentDataTypeStruct createPaymentDataTypeStruct({
  double? valor,
  TpPagamento? tPPagEnum,
  int? parcelas,
  bool? confirmado,
  int? bModoReg,
  DadosTEFStruct? tefProcessado,
  double? troco,
}) =>
    PaymentDataTypeStruct(
      valor: valor,
      tPPagEnum: tPPagEnum,
      parcelas: parcelas,
      confirmado: confirmado,
      bModoReg: bModoReg,
      tefProcessado: tefProcessado ?? DadosTEFStruct(),
      troco: troco,
    );
