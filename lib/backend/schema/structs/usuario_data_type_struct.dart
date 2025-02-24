// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsuarioDataTypeStruct extends BaseStruct {
  UsuarioDataTypeStruct({
    int? idCodigo,
    int? codempresa,
    String? usuario,
    String? nome,
    String? funcao,
    String? inserir,
    String? editar,
    String? excluir,
  })  : _idCodigo = idCodigo,
        _codempresa = codempresa,
        _usuario = usuario,
        _nome = nome,
        _funcao = funcao,
        _inserir = inserir,
        _editar = editar,
        _excluir = excluir;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "CODEMPRESA" field.
  int? _codempresa;
  int get codempresa => _codempresa ?? 0;
  set codempresa(int? val) => _codempresa = val;

  void incrementCodempresa(int amount) => codempresa = codempresa + amount;

  bool hasCodempresa() => _codempresa != null;

  // "USUARIO" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "NOME" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "FUNCAO" field.
  String? _funcao;
  String get funcao => _funcao ?? '';
  set funcao(String? val) => _funcao = val;

  bool hasFuncao() => _funcao != null;

  // "INSERIR" field.
  String? _inserir;
  String get inserir => _inserir ?? '';
  set inserir(String? val) => _inserir = val;

  bool hasInserir() => _inserir != null;

  // "EDITAR" field.
  String? _editar;
  String get editar => _editar ?? '';
  set editar(String? val) => _editar = val;

  bool hasEditar() => _editar != null;

  // "EXCLUIR" field.
  String? _excluir;
  String get excluir => _excluir ?? '';
  set excluir(String? val) => _excluir = val;

  bool hasExcluir() => _excluir != null;

  static UsuarioDataTypeStruct fromMap(Map<String, dynamic> data) =>
      UsuarioDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        codempresa: castToType<int>(data['CODEMPRESA']),
        usuario: data['USUARIO'] as String?,
        nome: data['NOME'] as String?,
        funcao: data['FUNCAO'] as String?,
        inserir: data['INSERIR'] as String?,
        editar: data['EDITAR'] as String?,
        excluir: data['EXCLUIR'] as String?,
      );

  static UsuarioDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? UsuarioDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'CODEMPRESA': _codempresa,
        'USUARIO': _usuario,
        'NOME': _nome,
        'FUNCAO': _funcao,
        'INSERIR': _inserir,
        'EDITAR': _editar,
        'EXCLUIR': _excluir,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'CODEMPRESA': serializeParam(
          _codempresa,
          ParamType.int,
        ),
        'USUARIO': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'NOME': serializeParam(
          _nome,
          ParamType.String,
        ),
        'FUNCAO': serializeParam(
          _funcao,
          ParamType.String,
        ),
        'INSERIR': serializeParam(
          _inserir,
          ParamType.String,
        ),
        'EDITAR': serializeParam(
          _editar,
          ParamType.String,
        ),
        'EXCLUIR': serializeParam(
          _excluir,
          ParamType.String,
        ),
      }.withoutNulls;

  static UsuarioDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      UsuarioDataTypeStruct(
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        codempresa: deserializeParam(
          data['CODEMPRESA'],
          ParamType.int,
          false,
        ),
        usuario: deserializeParam(
          data['USUARIO'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['NOME'],
          ParamType.String,
          false,
        ),
        funcao: deserializeParam(
          data['FUNCAO'],
          ParamType.String,
          false,
        ),
        inserir: deserializeParam(
          data['INSERIR'],
          ParamType.String,
          false,
        ),
        editar: deserializeParam(
          data['EDITAR'],
          ParamType.String,
          false,
        ),
        excluir: deserializeParam(
          data['EXCLUIR'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UsuarioDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UsuarioDataTypeStruct &&
        idCodigo == other.idCodigo &&
        codempresa == other.codempresa &&
        usuario == other.usuario &&
        nome == other.nome &&
        funcao == other.funcao &&
        inserir == other.inserir &&
        editar == other.editar &&
        excluir == other.excluir;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [idCodigo, codempresa, usuario, nome, funcao, inserir, editar, excluir]);
}

UsuarioDataTypeStruct createUsuarioDataTypeStruct({
  int? idCodigo,
  int? codempresa,
  String? usuario,
  String? nome,
  String? funcao,
  String? inserir,
  String? editar,
  String? excluir,
}) =>
    UsuarioDataTypeStruct(
      idCodigo: idCodigo,
      codempresa: codempresa,
      usuario: usuario,
      nome: nome,
      funcao: funcao,
      inserir: inserir,
      editar: editar,
      excluir: excluir,
    );
