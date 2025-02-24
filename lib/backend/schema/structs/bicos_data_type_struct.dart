// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BicosDataTypeStruct extends BaseStruct {
  BicosDataTypeStruct({
    int? idTanque,
    int? idBico,
    String? combustivel,
    int? idProduto,
    String? cor,
    String? cortexto,
    double? pravista,
  })  : _idTanque = idTanque,
        _idBico = idBico,
        _combustivel = combustivel,
        _idProduto = idProduto,
        _cor = cor,
        _cortexto = cortexto,
        _pravista = pravista;

  // "ID_TANQUE" field.
  int? _idTanque;
  int get idTanque => _idTanque ?? 0;
  set idTanque(int? val) => _idTanque = val;

  void incrementIdTanque(int amount) => idTanque = idTanque + amount;

  bool hasIdTanque() => _idTanque != null;

  // "ID_BICO" field.
  int? _idBico;
  int get idBico => _idBico ?? 0;
  set idBico(int? val) => _idBico = val;

  void incrementIdBico(int amount) => idBico = idBico + amount;

  bool hasIdBico() => _idBico != null;

  // "COMBUSTIVEL" field.
  String? _combustivel;
  String get combustivel => _combustivel ?? '';
  set combustivel(String? val) => _combustivel = val;

  bool hasCombustivel() => _combustivel != null;

  // "ID_PRODUTO" field.
  int? _idProduto;
  int get idProduto => _idProduto ?? 0;
  set idProduto(int? val) => _idProduto = val;

  void incrementIdProduto(int amount) => idProduto = idProduto + amount;

  bool hasIdProduto() => _idProduto != null;

  // "COR" field.
  String? _cor;
  String get cor => _cor ?? '';
  set cor(String? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "CORTEXTO" field.
  String? _cortexto;
  String get cortexto => _cortexto ?? '';
  set cortexto(String? val) => _cortexto = val;

  bool hasCortexto() => _cortexto != null;

  // "PRAVISTA" field.
  double? _pravista;
  double get pravista => _pravista ?? 0.0;
  set pravista(double? val) => _pravista = val;

  void incrementPravista(double amount) => pravista = pravista + amount;

  bool hasPravista() => _pravista != null;

  static BicosDataTypeStruct fromMap(Map<String, dynamic> data) =>
      BicosDataTypeStruct(
        idTanque: castToType<int>(data['ID_TANQUE']),
        idBico: castToType<int>(data['ID_BICO']),
        combustivel: data['COMBUSTIVEL'] as String?,
        idProduto: castToType<int>(data['ID_PRODUTO']),
        cor: data['COR'] as String?,
        cortexto: data['CORTEXTO'] as String?,
        pravista: castToType<double>(data['PRAVISTA']),
      );

  static BicosDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? BicosDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_TANQUE': _idTanque,
        'ID_BICO': _idBico,
        'COMBUSTIVEL': _combustivel,
        'ID_PRODUTO': _idProduto,
        'COR': _cor,
        'CORTEXTO': _cortexto,
        'PRAVISTA': _pravista,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_TANQUE': serializeParam(
          _idTanque,
          ParamType.int,
        ),
        'ID_BICO': serializeParam(
          _idBico,
          ParamType.int,
        ),
        'COMBUSTIVEL': serializeParam(
          _combustivel,
          ParamType.String,
        ),
        'ID_PRODUTO': serializeParam(
          _idProduto,
          ParamType.int,
        ),
        'COR': serializeParam(
          _cor,
          ParamType.String,
        ),
        'CORTEXTO': serializeParam(
          _cortexto,
          ParamType.String,
        ),
        'PRAVISTA': serializeParam(
          _pravista,
          ParamType.double,
        ),
      }.withoutNulls;

  static BicosDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      BicosDataTypeStruct(
        idTanque: deserializeParam(
          data['ID_TANQUE'],
          ParamType.int,
          false,
        ),
        idBico: deserializeParam(
          data['ID_BICO'],
          ParamType.int,
          false,
        ),
        combustivel: deserializeParam(
          data['COMBUSTIVEL'],
          ParamType.String,
          false,
        ),
        idProduto: deserializeParam(
          data['ID_PRODUTO'],
          ParamType.int,
          false,
        ),
        cor: deserializeParam(
          data['COR'],
          ParamType.String,
          false,
        ),
        cortexto: deserializeParam(
          data['CORTEXTO'],
          ParamType.String,
          false,
        ),
        pravista: deserializeParam(
          data['PRAVISTA'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BicosDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BicosDataTypeStruct &&
        idTanque == other.idTanque &&
        idBico == other.idBico &&
        combustivel == other.combustivel &&
        idProduto == other.idProduto &&
        cor == other.cor &&
        cortexto == other.cortexto &&
        pravista == other.pravista;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idTanque, idBico, combustivel, idProduto, cor, cortexto, pravista]);
}

BicosDataTypeStruct createBicosDataTypeStruct({
  int? idTanque,
  int? idBico,
  String? combustivel,
  int? idProduto,
  String? cor,
  String? cortexto,
  double? pravista,
}) =>
    BicosDataTypeStruct(
      idTanque: idTanque,
      idBico: idBico,
      combustivel: combustivel,
      idProduto: idProduto,
      cor: cor,
      cortexto: cortexto,
      pravista: pravista,
    );
