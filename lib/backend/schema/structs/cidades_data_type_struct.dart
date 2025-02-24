// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CidadesDataTypeStruct extends BaseStruct {
  CidadesDataTypeStruct({
    int? idCodigo,
    String? nome,
    String? cep,
    String? uf,
    String? codmunibge,
  })  : _idCodigo = idCodigo,
        _nome = nome,
        _cep = cep,
        _uf = uf,
        _codmunibge = codmunibge;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "NOME" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "CEP" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "UF" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  // "CODMUNIBGE" field.
  String? _codmunibge;
  String get codmunibge => _codmunibge ?? '';
  set codmunibge(String? val) => _codmunibge = val;

  bool hasCodmunibge() => _codmunibge != null;

  static CidadesDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CidadesDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        nome: data['NOME'] as String?,
        cep: data['CEP'] as String?,
        uf: data['UF'] as String?,
        codmunibge: data['CODMUNIBGE'] as String?,
      );

  static CidadesDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CidadesDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'NOME': _nome,
        'CEP': _cep,
        'UF': _uf,
        'CODMUNIBGE': _codmunibge,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'NOME': serializeParam(
          _nome,
          ParamType.String,
        ),
        'CEP': serializeParam(
          _cep,
          ParamType.String,
        ),
        'UF': serializeParam(
          _uf,
          ParamType.String,
        ),
        'CODMUNIBGE': serializeParam(
          _codmunibge,
          ParamType.String,
        ),
      }.withoutNulls;

  static CidadesDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CidadesDataTypeStruct(
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        nome: deserializeParam(
          data['NOME'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['CEP'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['UF'],
          ParamType.String,
          false,
        ),
        codmunibge: deserializeParam(
          data['CODMUNIBGE'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CidadesDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CidadesDataTypeStruct &&
        idCodigo == other.idCodigo &&
        nome == other.nome &&
        cep == other.cep &&
        uf == other.uf &&
        codmunibge == other.codmunibge;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([idCodigo, nome, cep, uf, codmunibge]);
}

CidadesDataTypeStruct createCidadesDataTypeStruct({
  int? idCodigo,
  String? nome,
  String? cep,
  String? uf,
  String? codmunibge,
}) =>
    CidadesDataTypeStruct(
      idCodigo: idCodigo,
      nome: nome,
      cep: cep,
      uf: uf,
      codmunibge: codmunibge,
    );
