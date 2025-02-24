// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrentistasDataTypeStruct extends BaseStruct {
  FrentistasDataTypeStruct({
    int? idFrentista,
    String? nomeFrentista,
    String? nomeFrentistacompleto,
    String? cpfFrentista,
    double? limitemaxdesc,
    String? password,
    String? idCartao,
    int? idRefcartao,
  })  : _idFrentista = idFrentista,
        _nomeFrentista = nomeFrentista,
        _nomeFrentistacompleto = nomeFrentistacompleto,
        _cpfFrentista = cpfFrentista,
        _limitemaxdesc = limitemaxdesc,
        _password = password,
        _idCartao = idCartao,
        _idRefcartao = idRefcartao;

  // "ID_FRENTISTA" field.
  int? _idFrentista;
  int get idFrentista => _idFrentista ?? 0;
  set idFrentista(int? val) => _idFrentista = val;

  void incrementIdFrentista(int amount) => idFrentista = idFrentista + amount;

  bool hasIdFrentista() => _idFrentista != null;

  // "NOME_FRENTISTA" field.
  String? _nomeFrentista;
  String get nomeFrentista => _nomeFrentista ?? '';
  set nomeFrentista(String? val) => _nomeFrentista = val;

  bool hasNomeFrentista() => _nomeFrentista != null;

  // "NOME_FRENTISTACOMPLETO" field.
  String? _nomeFrentistacompleto;
  String get nomeFrentistacompleto => _nomeFrentistacompleto ?? '';
  set nomeFrentistacompleto(String? val) => _nomeFrentistacompleto = val;

  bool hasNomeFrentistacompleto() => _nomeFrentistacompleto != null;

  // "CPF_FRENTISTA" field.
  String? _cpfFrentista;
  String get cpfFrentista => _cpfFrentista ?? '';
  set cpfFrentista(String? val) => _cpfFrentista = val;

  bool hasCpfFrentista() => _cpfFrentista != null;

  // "LIMITEMAXDESC" field.
  double? _limitemaxdesc;
  double get limitemaxdesc => _limitemaxdesc ?? 0.0;
  set limitemaxdesc(double? val) => _limitemaxdesc = val;

  void incrementLimitemaxdesc(double amount) =>
      limitemaxdesc = limitemaxdesc + amount;

  bool hasLimitemaxdesc() => _limitemaxdesc != null;

  // "PASSWORD" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "ID_CARTAO" field.
  String? _idCartao;
  String get idCartao => _idCartao ?? '';
  set idCartao(String? val) => _idCartao = val;

  bool hasIdCartao() => _idCartao != null;

  // "ID_REFCARTAO" field.
  int? _idRefcartao;
  int get idRefcartao => _idRefcartao ?? 0;
  set idRefcartao(int? val) => _idRefcartao = val;

  void incrementIdRefcartao(int amount) => idRefcartao = idRefcartao + amount;

  bool hasIdRefcartao() => _idRefcartao != null;

  static FrentistasDataTypeStruct fromMap(Map<String, dynamic> data) =>
      FrentistasDataTypeStruct(
        idFrentista: castToType<int>(data['ID_FRENTISTA']),
        nomeFrentista: data['NOME_FRENTISTA'] as String?,
        nomeFrentistacompleto: data['NOME_FRENTISTACOMPLETO'] as String?,
        cpfFrentista: data['CPF_FRENTISTA'] as String?,
        limitemaxdesc: castToType<double>(data['LIMITEMAXDESC']),
        password: data['PASSWORD'] as String?,
        idCartao: data['ID_CARTAO'] as String?,
        idRefcartao: castToType<int>(data['ID_REFCARTAO']),
      );

  static FrentistasDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? FrentistasDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_FRENTISTA': _idFrentista,
        'NOME_FRENTISTA': _nomeFrentista,
        'NOME_FRENTISTACOMPLETO': _nomeFrentistacompleto,
        'CPF_FRENTISTA': _cpfFrentista,
        'LIMITEMAXDESC': _limitemaxdesc,
        'PASSWORD': _password,
        'ID_CARTAO': _idCartao,
        'ID_REFCARTAO': _idRefcartao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_FRENTISTA': serializeParam(
          _idFrentista,
          ParamType.int,
        ),
        'NOME_FRENTISTA': serializeParam(
          _nomeFrentista,
          ParamType.String,
        ),
        'NOME_FRENTISTACOMPLETO': serializeParam(
          _nomeFrentistacompleto,
          ParamType.String,
        ),
        'CPF_FRENTISTA': serializeParam(
          _cpfFrentista,
          ParamType.String,
        ),
        'LIMITEMAXDESC': serializeParam(
          _limitemaxdesc,
          ParamType.double,
        ),
        'PASSWORD': serializeParam(
          _password,
          ParamType.String,
        ),
        'ID_CARTAO': serializeParam(
          _idCartao,
          ParamType.String,
        ),
        'ID_REFCARTAO': serializeParam(
          _idRefcartao,
          ParamType.int,
        ),
      }.withoutNulls;

  static FrentistasDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FrentistasDataTypeStruct(
        idFrentista: deserializeParam(
          data['ID_FRENTISTA'],
          ParamType.int,
          false,
        ),
        nomeFrentista: deserializeParam(
          data['NOME_FRENTISTA'],
          ParamType.String,
          false,
        ),
        nomeFrentistacompleto: deserializeParam(
          data['NOME_FRENTISTACOMPLETO'],
          ParamType.String,
          false,
        ),
        cpfFrentista: deserializeParam(
          data['CPF_FRENTISTA'],
          ParamType.String,
          false,
        ),
        limitemaxdesc: deserializeParam(
          data['LIMITEMAXDESC'],
          ParamType.double,
          false,
        ),
        password: deserializeParam(
          data['PASSWORD'],
          ParamType.String,
          false,
        ),
        idCartao: deserializeParam(
          data['ID_CARTAO'],
          ParamType.String,
          false,
        ),
        idRefcartao: deserializeParam(
          data['ID_REFCARTAO'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FrentistasDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FrentistasDataTypeStruct &&
        idFrentista == other.idFrentista &&
        nomeFrentista == other.nomeFrentista &&
        nomeFrentistacompleto == other.nomeFrentistacompleto &&
        cpfFrentista == other.cpfFrentista &&
        limitemaxdesc == other.limitemaxdesc &&
        password == other.password &&
        idCartao == other.idCartao &&
        idRefcartao == other.idRefcartao;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idFrentista,
        nomeFrentista,
        nomeFrentistacompleto,
        cpfFrentista,
        limitemaxdesc,
        password,
        idCartao,
        idRefcartao
      ]);
}

FrentistasDataTypeStruct createFrentistasDataTypeStruct({
  int? idFrentista,
  String? nomeFrentista,
  String? nomeFrentistacompleto,
  String? cpfFrentista,
  double? limitemaxdesc,
  String? password,
  String? idCartao,
  int? idRefcartao,
}) =>
    FrentistasDataTypeStruct(
      idFrentista: idFrentista,
      nomeFrentista: nomeFrentista,
      nomeFrentistacompleto: nomeFrentistacompleto,
      cpfFrentista: cpfFrentista,
      limitemaxdesc: limitemaxdesc,
      password: password,
      idCartao: idCartao,
      idRefcartao: idRefcartao,
    );
