// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrupoDataTypeStruct extends BaseStruct {
  GrupoDataTypeStruct({
    int? idCodigo,
    String? descricao,
    String? datacadastro,
    int? idCategoria,
    int? qtdProd,
  })  : _idCodigo = idCodigo,
        _descricao = descricao,
        _datacadastro = datacadastro,
        _idCategoria = idCategoria,
        _qtdProd = qtdProd;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "DESCRICAO" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "DATACADASTRO" field.
  String? _datacadastro;
  String get datacadastro => _datacadastro ?? '';
  set datacadastro(String? val) => _datacadastro = val;

  bool hasDatacadastro() => _datacadastro != null;

  // "ID_CATEGORIA" field.
  int? _idCategoria;
  int get idCategoria => _idCategoria ?? 0;
  set idCategoria(int? val) => _idCategoria = val;

  void incrementIdCategoria(int amount) => idCategoria = idCategoria + amount;

  bool hasIdCategoria() => _idCategoria != null;

  // "QTD_PROD" field.
  int? _qtdProd;
  int get qtdProd => _qtdProd ?? 0;
  set qtdProd(int? val) => _qtdProd = val;

  void incrementQtdProd(int amount) => qtdProd = qtdProd + amount;

  bool hasQtdProd() => _qtdProd != null;

  static GrupoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      GrupoDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        descricao: data['DESCRICAO'] as String?,
        datacadastro: data['DATACADASTRO'] as String?,
        idCategoria: castToType<int>(data['ID_CATEGORIA']),
        qtdProd: castToType<int>(data['QTD_PROD']),
      );

  static GrupoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? GrupoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'DESCRICAO': _descricao,
        'DATACADASTRO': _datacadastro,
        'ID_CATEGORIA': _idCategoria,
        'QTD_PROD': _qtdProd,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'DESCRICAO': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'DATACADASTRO': serializeParam(
          _datacadastro,
          ParamType.String,
        ),
        'ID_CATEGORIA': serializeParam(
          _idCategoria,
          ParamType.int,
        ),
        'QTD_PROD': serializeParam(
          _qtdProd,
          ParamType.int,
        ),
      }.withoutNulls;

  static GrupoDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      GrupoDataTypeStruct(
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        descricao: deserializeParam(
          data['DESCRICAO'],
          ParamType.String,
          false,
        ),
        datacadastro: deserializeParam(
          data['DATACADASTRO'],
          ParamType.String,
          false,
        ),
        idCategoria: deserializeParam(
          data['ID_CATEGORIA'],
          ParamType.int,
          false,
        ),
        qtdProd: deserializeParam(
          data['QTD_PROD'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'GrupoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrupoDataTypeStruct &&
        idCodigo == other.idCodigo &&
        descricao == other.descricao &&
        datacadastro == other.datacadastro &&
        idCategoria == other.idCategoria &&
        qtdProd == other.qtdProd;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idCodigo, descricao, datacadastro, idCategoria, qtdProd]);
}

GrupoDataTypeStruct createGrupoDataTypeStruct({
  int? idCodigo,
  String? descricao,
  String? datacadastro,
  int? idCategoria,
  int? qtdProd,
}) =>
    GrupoDataTypeStruct(
      idCodigo: idCodigo,
      descricao: descricao,
      datacadastro: datacadastro,
      idCategoria: idCategoria,
      qtdProd: qtdProd,
    );
