// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClienteListaDataTypeStruct extends BaseStruct {
  ClienteListaDataTypeStruct({
    int? idCodigo,
    String? nome,
    String? denome,
    String? tppessoa,
    String? cpfcnpj,
    String? cidade,
    String? estado,
    String? endereco,
    String? complemento,
    String? cep,
    int? codCidade,
    String? bairro,
    String? codibge,
  })  : _idCodigo = idCodigo,
        _nome = nome,
        _denome = denome,
        _tppessoa = tppessoa,
        _cpfcnpj = cpfcnpj,
        _cidade = cidade,
        _estado = estado,
        _endereco = endereco,
        _complemento = complemento,
        _cep = cep,
        _codCidade = codCidade,
        _bairro = bairro,
        _codibge = codibge;

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

  // "DENOME" field.
  String? _denome;
  String get denome => _denome ?? '';
  set denome(String? val) => _denome = val;

  bool hasDenome() => _denome != null;

  // "TPPESSOA" field.
  String? _tppessoa;
  String get tppessoa => _tppessoa ?? '';
  set tppessoa(String? val) => _tppessoa = val;

  bool hasTppessoa() => _tppessoa != null;

  // "CPFCNPJ" field.
  String? _cpfcnpj;
  String get cpfcnpj => _cpfcnpj ?? '';
  set cpfcnpj(String? val) => _cpfcnpj = val;

  bool hasCpfcnpj() => _cpfcnpj != null;

  // "CIDADE" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "ESTADO" field.
  String? _estado;
  String get estado => _estado ?? '';
  set estado(String? val) => _estado = val;

  bool hasEstado() => _estado != null;

  // "ENDERECO" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "COMPLEMENTO" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  set complemento(String? val) => _complemento = val;

  bool hasComplemento() => _complemento != null;

  // "CEP" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "COD_CIDADE" field.
  int? _codCidade;
  int get codCidade => _codCidade ?? 0;
  set codCidade(int? val) => _codCidade = val;

  void incrementCodCidade(int amount) => codCidade = codCidade + amount;

  bool hasCodCidade() => _codCidade != null;

  // "BAIRRO" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "CODIBGE" field.
  String? _codibge;
  String get codibge => _codibge ?? '';
  set codibge(String? val) => _codibge = val;

  bool hasCodibge() => _codibge != null;

  static ClienteListaDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ClienteListaDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        nome: data['NOME'] as String?,
        denome: data['DENOME'] as String?,
        tppessoa: data['TPPESSOA'] as String?,
        cpfcnpj: data['CPFCNPJ'] as String?,
        cidade: data['CIDADE'] as String?,
        estado: data['ESTADO'] as String?,
        endereco: data['ENDERECO'] as String?,
        complemento: data['COMPLEMENTO'] as String?,
        cep: data['CEP'] as String?,
        codCidade: castToType<int>(data['COD_CIDADE']),
        bairro: data['BAIRRO'] as String?,
        codibge: data['CODIBGE'] as String?,
      );

  static ClienteListaDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ClienteListaDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'NOME': _nome,
        'DENOME': _denome,
        'TPPESSOA': _tppessoa,
        'CPFCNPJ': _cpfcnpj,
        'CIDADE': _cidade,
        'ESTADO': _estado,
        'ENDERECO': _endereco,
        'COMPLEMENTO': _complemento,
        'CEP': _cep,
        'COD_CIDADE': _codCidade,
        'BAIRRO': _bairro,
        'CODIBGE': _codibge,
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
        'DENOME': serializeParam(
          _denome,
          ParamType.String,
        ),
        'TPPESSOA': serializeParam(
          _tppessoa,
          ParamType.String,
        ),
        'CPFCNPJ': serializeParam(
          _cpfcnpj,
          ParamType.String,
        ),
        'CIDADE': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'ESTADO': serializeParam(
          _estado,
          ParamType.String,
        ),
        'ENDERECO': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'COMPLEMENTO': serializeParam(
          _complemento,
          ParamType.String,
        ),
        'CEP': serializeParam(
          _cep,
          ParamType.String,
        ),
        'COD_CIDADE': serializeParam(
          _codCidade,
          ParamType.int,
        ),
        'BAIRRO': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'CODIBGE': serializeParam(
          _codibge,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClienteListaDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ClienteListaDataTypeStruct(
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
        denome: deserializeParam(
          data['DENOME'],
          ParamType.String,
          false,
        ),
        tppessoa: deserializeParam(
          data['TPPESSOA'],
          ParamType.String,
          false,
        ),
        cpfcnpj: deserializeParam(
          data['CPFCNPJ'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['CIDADE'],
          ParamType.String,
          false,
        ),
        estado: deserializeParam(
          data['ESTADO'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['ENDERECO'],
          ParamType.String,
          false,
        ),
        complemento: deserializeParam(
          data['COMPLEMENTO'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['CEP'],
          ParamType.String,
          false,
        ),
        codCidade: deserializeParam(
          data['COD_CIDADE'],
          ParamType.int,
          false,
        ),
        bairro: deserializeParam(
          data['BAIRRO'],
          ParamType.String,
          false,
        ),
        codibge: deserializeParam(
          data['CODIBGE'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClienteListaDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClienteListaDataTypeStruct &&
        idCodigo == other.idCodigo &&
        nome == other.nome &&
        denome == other.denome &&
        tppessoa == other.tppessoa &&
        cpfcnpj == other.cpfcnpj &&
        cidade == other.cidade &&
        estado == other.estado &&
        endereco == other.endereco &&
        complemento == other.complemento &&
        cep == other.cep &&
        codCidade == other.codCidade &&
        bairro == other.bairro &&
        codibge == other.codibge;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCodigo,
        nome,
        denome,
        tppessoa,
        cpfcnpj,
        cidade,
        estado,
        endereco,
        complemento,
        cep,
        codCidade,
        bairro,
        codibge
      ]);
}

ClienteListaDataTypeStruct createClienteListaDataTypeStruct({
  int? idCodigo,
  String? nome,
  String? denome,
  String? tppessoa,
  String? cpfcnpj,
  String? cidade,
  String? estado,
  String? endereco,
  String? complemento,
  String? cep,
  int? codCidade,
  String? bairro,
  String? codibge,
}) =>
    ClienteListaDataTypeStruct(
      idCodigo: idCodigo,
      nome: nome,
      denome: denome,
      tppessoa: tppessoa,
      cpfcnpj: cpfcnpj,
      cidade: cidade,
      estado: estado,
      endereco: endereco,
      complemento: complemento,
      cep: cep,
      codCidade: codCidade,
      bairro: bairro,
      codibge: codibge,
    );
