// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltrosAbastecimentoStruct extends BaseStruct {
  FiltrosAbastecimentoStruct({
    DateTime? dateInitial,
    DateTime? dateFinal,
    BicosDataTypeStruct? bico,
    FrentistasDataTypeStruct? frentista,
    CombustiveisDataTypeStruct? combustivelSelected,
    TPRegistro? tPRegistro,
  })  : _dateInitial = dateInitial,
        _dateFinal = dateFinal,
        _bico = bico,
        _frentista = frentista,
        _combustivelSelected = combustivelSelected,
        _tPRegistro = tPRegistro;

  // "DateInitial" field.
  DateTime? _dateInitial;
  DateTime? get dateInitial => _dateInitial;
  set dateInitial(DateTime? val) => _dateInitial = val;

  bool hasDateInitial() => _dateInitial != null;

  // "DateFinal" field.
  DateTime? _dateFinal;
  DateTime? get dateFinal => _dateFinal;
  set dateFinal(DateTime? val) => _dateFinal = val;

  bool hasDateFinal() => _dateFinal != null;

  // "Bico" field.
  BicosDataTypeStruct? _bico;
  BicosDataTypeStruct get bico => _bico ?? BicosDataTypeStruct();
  set bico(BicosDataTypeStruct? val) => _bico = val;

  void updateBico(Function(BicosDataTypeStruct) updateFn) {
    updateFn(_bico ??= BicosDataTypeStruct());
  }

  bool hasBico() => _bico != null;

  // "Frentista" field.
  FrentistasDataTypeStruct? _frentista;
  FrentistasDataTypeStruct get frentista =>
      _frentista ?? FrentistasDataTypeStruct();
  set frentista(FrentistasDataTypeStruct? val) => _frentista = val;

  void updateFrentista(Function(FrentistasDataTypeStruct) updateFn) {
    updateFn(_frentista ??= FrentistasDataTypeStruct());
  }

  bool hasFrentista() => _frentista != null;

  // "CombustivelSelected" field.
  CombustiveisDataTypeStruct? _combustivelSelected;
  CombustiveisDataTypeStruct get combustivelSelected =>
      _combustivelSelected ?? CombustiveisDataTypeStruct();
  set combustivelSelected(CombustiveisDataTypeStruct? val) =>
      _combustivelSelected = val;

  void updateCombustivelSelected(
      Function(CombustiveisDataTypeStruct) updateFn) {
    updateFn(_combustivelSelected ??= CombustiveisDataTypeStruct());
  }

  bool hasCombustivelSelected() => _combustivelSelected != null;

  // "TPRegistro" field.
  TPRegistro? _tPRegistro;
  TPRegistro get tPRegistro => _tPRegistro ?? TPRegistro.Todos;
  set tPRegistro(TPRegistro? val) => _tPRegistro = val;

  bool hasTPRegistro() => _tPRegistro != null;

  static FiltrosAbastecimentoStruct fromMap(Map<String, dynamic> data) =>
      FiltrosAbastecimentoStruct(
        dateInitial: data['DateInitial'] as DateTime?,
        dateFinal: data['DateFinal'] as DateTime?,
        bico: data['Bico'] is BicosDataTypeStruct
            ? data['Bico']
            : BicosDataTypeStruct.maybeFromMap(data['Bico']),
        frentista: data['Frentista'] is FrentistasDataTypeStruct
            ? data['Frentista']
            : FrentistasDataTypeStruct.maybeFromMap(data['Frentista']),
        combustivelSelected:
            data['CombustivelSelected'] is CombustiveisDataTypeStruct
                ? data['CombustivelSelected']
                : CombustiveisDataTypeStruct.maybeFromMap(
                    data['CombustivelSelected']),
        tPRegistro: data['TPRegistro'] is TPRegistro
            ? data['TPRegistro']
            : deserializeEnum<TPRegistro>(data['TPRegistro']),
      );

  static FiltrosAbastecimentoStruct? maybeFromMap(dynamic data) => data is Map
      ? FiltrosAbastecimentoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'DateInitial': _dateInitial,
        'DateFinal': _dateFinal,
        'Bico': _bico?.toMap(),
        'Frentista': _frentista?.toMap(),
        'CombustivelSelected': _combustivelSelected?.toMap(),
        'TPRegistro': _tPRegistro?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DateInitial': serializeParam(
          _dateInitial,
          ParamType.DateTime,
        ),
        'DateFinal': serializeParam(
          _dateFinal,
          ParamType.DateTime,
        ),
        'Bico': serializeParam(
          _bico,
          ParamType.DataStruct,
        ),
        'Frentista': serializeParam(
          _frentista,
          ParamType.DataStruct,
        ),
        'CombustivelSelected': serializeParam(
          _combustivelSelected,
          ParamType.DataStruct,
        ),
        'TPRegistro': serializeParam(
          _tPRegistro,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static FiltrosAbastecimentoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FiltrosAbastecimentoStruct(
        dateInitial: deserializeParam(
          data['DateInitial'],
          ParamType.DateTime,
          false,
        ),
        dateFinal: deserializeParam(
          data['DateFinal'],
          ParamType.DateTime,
          false,
        ),
        bico: deserializeStructParam(
          data['Bico'],
          ParamType.DataStruct,
          false,
          structBuilder: BicosDataTypeStruct.fromSerializableMap,
        ),
        frentista: deserializeStructParam(
          data['Frentista'],
          ParamType.DataStruct,
          false,
          structBuilder: FrentistasDataTypeStruct.fromSerializableMap,
        ),
        combustivelSelected: deserializeStructParam(
          data['CombustivelSelected'],
          ParamType.DataStruct,
          false,
          structBuilder: CombustiveisDataTypeStruct.fromSerializableMap,
        ),
        tPRegistro: deserializeParam<TPRegistro>(
          data['TPRegistro'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'FiltrosAbastecimentoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FiltrosAbastecimentoStruct &&
        dateInitial == other.dateInitial &&
        dateFinal == other.dateFinal &&
        bico == other.bico &&
        frentista == other.frentista &&
        combustivelSelected == other.combustivelSelected &&
        tPRegistro == other.tPRegistro;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dateInitial,
        dateFinal,
        bico,
        frentista,
        combustivelSelected,
        tPRegistro
      ]);
}

FiltrosAbastecimentoStruct createFiltrosAbastecimentoStruct({
  DateTime? dateInitial,
  DateTime? dateFinal,
  BicosDataTypeStruct? bico,
  FrentistasDataTypeStruct? frentista,
  CombustiveisDataTypeStruct? combustivelSelected,
  TPRegistro? tPRegistro,
}) =>
    FiltrosAbastecimentoStruct(
      dateInitial: dateInitial,
      dateFinal: dateFinal,
      bico: bico ?? BicosDataTypeStruct(),
      frentista: frentista ?? FrentistasDataTypeStruct(),
      combustivelSelected: combustivelSelected ?? CombustiveisDataTypeStruct(),
      tPRegistro: tPRegistro,
    );
