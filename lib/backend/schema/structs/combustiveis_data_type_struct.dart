// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CombustiveisDataTypeStruct extends BaseStruct {
  CombustiveisDataTypeStruct({
    int? idProduto,
    String? refCombustivel,
    String? nome,
    String? cor,
    String? cortexto,
  })  : _idProduto = idProduto,
        _refCombustivel = refCombustivel,
        _nome = nome,
        _cor = cor,
        _cortexto = cortexto;

  // "ID_PRODUTO" field.
  int? _idProduto;
  int get idProduto => _idProduto ?? 0;
  set idProduto(int? val) => _idProduto = val;

  void incrementIdProduto(int amount) => idProduto = idProduto + amount;

  bool hasIdProduto() => _idProduto != null;

  // "REF_COMBUSTIVEL" field.
  String? _refCombustivel;
  String get refCombustivel => _refCombustivel ?? '';
  set refCombustivel(String? val) => _refCombustivel = val;

  bool hasRefCombustivel() => _refCombustivel != null;

  // "NOME" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

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

  static CombustiveisDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CombustiveisDataTypeStruct(
        idProduto: castToType<int>(data['ID_PRODUTO']),
        refCombustivel: data['REF_COMBUSTIVEL'] as String?,
        nome: data['NOME'] as String?,
        cor: data['COR'] as String?,
        cortexto: data['CORTEXTO'] as String?,
      );

  static CombustiveisDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CombustiveisDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_PRODUTO': _idProduto,
        'REF_COMBUSTIVEL': _refCombustivel,
        'NOME': _nome,
        'COR': _cor,
        'CORTEXTO': _cortexto,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_PRODUTO': serializeParam(
          _idProduto,
          ParamType.int,
        ),
        'REF_COMBUSTIVEL': serializeParam(
          _refCombustivel,
          ParamType.String,
        ),
        'NOME': serializeParam(
          _nome,
          ParamType.String,
        ),
        'COR': serializeParam(
          _cor,
          ParamType.String,
        ),
        'CORTEXTO': serializeParam(
          _cortexto,
          ParamType.String,
        ),
      }.withoutNulls;

  static CombustiveisDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CombustiveisDataTypeStruct(
        idProduto: deserializeParam(
          data['ID_PRODUTO'],
          ParamType.int,
          false,
        ),
        refCombustivel: deserializeParam(
          data['REF_COMBUSTIVEL'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['NOME'],
          ParamType.String,
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
      );

  @override
  String toString() => 'CombustiveisDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CombustiveisDataTypeStruct &&
        idProduto == other.idProduto &&
        refCombustivel == other.refCombustivel &&
        nome == other.nome &&
        cor == other.cor &&
        cortexto == other.cortexto;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idProduto, refCombustivel, nome, cor, cortexto]);
}

CombustiveisDataTypeStruct createCombustiveisDataTypeStruct({
  int? idProduto,
  String? refCombustivel,
  String? nome,
  String? cor,
  String? cortexto,
}) =>
    CombustiveisDataTypeStruct(
      idProduto: idProduto,
      refCombustivel: refCombustivel,
      nome: nome,
      cor: cor,
      cortexto: cortexto,
    );
