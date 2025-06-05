// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ValeCombustivelDataTypeStruct extends BaseStruct {
  ValeCombustivelDataTypeStruct({
    int? idRequisicao,
    String? data,
    String? tpreg,
    String? tpopreg,
    double? totalreq,
    int? idCliente,
    String? sndisponivel,
    String? condpagto,
    int? tpOrigem,
    int? tppagto,
    String? usuarioReg,
    String? nomeCliente,
  })  : _idRequisicao = idRequisicao,
        _data = data,
        _tpreg = tpreg,
        _tpopreg = tpopreg,
        _totalreq = totalreq,
        _idCliente = idCliente,
        _sndisponivel = sndisponivel,
        _condpagto = condpagto,
        _tpOrigem = tpOrigem,
        _tppagto = tppagto,
        _usuarioReg = usuarioReg,
        _nomeCliente = nomeCliente;

  // "ID_REQUISICAO" field.
  int? _idRequisicao;
  int get idRequisicao => _idRequisicao ?? 0;
  set idRequisicao(int? val) => _idRequisicao = val;

  void incrementIdRequisicao(int amount) =>
      idRequisicao = idRequisicao + amount;

  bool hasIdRequisicao() => _idRequisicao != null;

  // "DATA" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "TPREG" field.
  String? _tpreg;
  String get tpreg => _tpreg ?? '';
  set tpreg(String? val) => _tpreg = val;

  bool hasTpreg() => _tpreg != null;

  // "TPOPREG" field.
  String? _tpopreg;
  String get tpopreg => _tpopreg ?? '';
  set tpopreg(String? val) => _tpopreg = val;

  bool hasTpopreg() => _tpopreg != null;

  // "TOTALREQ" field.
  double? _totalreq;
  double get totalreq => _totalreq ?? 0.0;
  set totalreq(double? val) => _totalreq = val;

  void incrementTotalreq(double amount) => totalreq = totalreq + amount;

  bool hasTotalreq() => _totalreq != null;

  // "ID_CLIENTE" field.
  int? _idCliente;
  int get idCliente => _idCliente ?? 0;
  set idCliente(int? val) => _idCliente = val;

  void incrementIdCliente(int amount) => idCliente = idCliente + amount;

  bool hasIdCliente() => _idCliente != null;

  // "SNDISPONIVEL" field.
  String? _sndisponivel;
  String get sndisponivel => _sndisponivel ?? '';
  set sndisponivel(String? val) => _sndisponivel = val;

  bool hasSndisponivel() => _sndisponivel != null;

  // "CONDPAGTO" field.
  String? _condpagto;
  String get condpagto => _condpagto ?? '';
  set condpagto(String? val) => _condpagto = val;

  bool hasCondpagto() => _condpagto != null;

  // "TP_ORIGEM" field.
  int? _tpOrigem;
  int get tpOrigem => _tpOrigem ?? 0;
  set tpOrigem(int? val) => _tpOrigem = val;

  void incrementTpOrigem(int amount) => tpOrigem = tpOrigem + amount;

  bool hasTpOrigem() => _tpOrigem != null;

  // "TPPAGTO" field.
  int? _tppagto;
  int get tppagto => _tppagto ?? 0;
  set tppagto(int? val) => _tppagto = val;

  void incrementTppagto(int amount) => tppagto = tppagto + amount;

  bool hasTppagto() => _tppagto != null;

  // "USUARIO_REG" field.
  String? _usuarioReg;
  String get usuarioReg => _usuarioReg ?? '';
  set usuarioReg(String? val) => _usuarioReg = val;

  bool hasUsuarioReg() => _usuarioReg != null;

  // "NOME_CLIENTE" field.
  String? _nomeCliente;
  String get nomeCliente => _nomeCliente ?? '';
  set nomeCliente(String? val) => _nomeCliente = val;

  bool hasNomeCliente() => _nomeCliente != null;

  static ValeCombustivelDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ValeCombustivelDataTypeStruct(
        idRequisicao: castToType<int>(data['ID_REQUISICAO']),
        data: data['DATA'] as String?,
        tpreg: data['TPREG'] as String?,
        tpopreg: data['TPOPREG'] as String?,
        totalreq: castToType<double>(data['TOTALREQ']),
        idCliente: castToType<int>(data['ID_CLIENTE']),
        sndisponivel: data['SNDISPONIVEL'] as String?,
        condpagto: data['CONDPAGTO'] as String?,
        tpOrigem: castToType<int>(data['TP_ORIGEM']),
        tppagto: castToType<int>(data['TPPAGTO']),
        usuarioReg: data['USUARIO_REG'] as String?,
        nomeCliente: data['NOME_CLIENTE'] as String?,
      );

  static ValeCombustivelDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ValeCombustivelDataTypeStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'ID_REQUISICAO': _idRequisicao,
        'DATA': _data,
        'TPREG': _tpreg,
        'TPOPREG': _tpopreg,
        'TOTALREQ': _totalreq,
        'ID_CLIENTE': _idCliente,
        'SNDISPONIVEL': _sndisponivel,
        'CONDPAGTO': _condpagto,
        'TP_ORIGEM': _tpOrigem,
        'TPPAGTO': _tppagto,
        'USUARIO_REG': _usuarioReg,
        'NOME_CLIENTE': _nomeCliente,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_REQUISICAO': serializeParam(
          _idRequisicao,
          ParamType.int,
        ),
        'DATA': serializeParam(
          _data,
          ParamType.String,
        ),
        'TPREG': serializeParam(
          _tpreg,
          ParamType.String,
        ),
        'TPOPREG': serializeParam(
          _tpopreg,
          ParamType.String,
        ),
        'TOTALREQ': serializeParam(
          _totalreq,
          ParamType.double,
        ),
        'ID_CLIENTE': serializeParam(
          _idCliente,
          ParamType.int,
        ),
        'SNDISPONIVEL': serializeParam(
          _sndisponivel,
          ParamType.String,
        ),
        'CONDPAGTO': serializeParam(
          _condpagto,
          ParamType.String,
        ),
        'TP_ORIGEM': serializeParam(
          _tpOrigem,
          ParamType.int,
        ),
        'TPPAGTO': serializeParam(
          _tppagto,
          ParamType.int,
        ),
        'USUARIO_REG': serializeParam(
          _usuarioReg,
          ParamType.String,
        ),
        'NOME_CLIENTE': serializeParam(
          _nomeCliente,
          ParamType.String,
        ),
      }.withoutNulls;

  static ValeCombustivelDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ValeCombustivelDataTypeStruct(
        idRequisicao: deserializeParam(
          data['ID_REQUISICAO'],
          ParamType.int,
          false,
        ),
        data: deserializeParam(
          data['DATA'],
          ParamType.String,
          false,
        ),
        tpreg: deserializeParam(
          data['TPREG'],
          ParamType.String,
          false,
        ),
        tpopreg: deserializeParam(
          data['TPOPREG'],
          ParamType.String,
          false,
        ),
        totalreq: deserializeParam(
          data['TOTALREQ'],
          ParamType.double,
          false,
        ),
        idCliente: deserializeParam(
          data['ID_CLIENTE'],
          ParamType.int,
          false,
        ),
        sndisponivel: deserializeParam(
          data['SNDISPONIVEL'],
          ParamType.String,
          false,
        ),
        condpagto: deserializeParam(
          data['CONDPAGTO'],
          ParamType.String,
          false,
        ),
        tpOrigem: deserializeParam(
          data['TP_ORIGEM'],
          ParamType.int,
          false,
        ),
        tppagto: deserializeParam(
          data['TPPAGTO'],
          ParamType.int,
          false,
        ),
        usuarioReg: deserializeParam(
          data['USUARIO_REG'],
          ParamType.String,
          false,
        ),
        nomeCliente: deserializeParam(
          data['NOME_CLIENTE'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ValeCombustivelDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ValeCombustivelDataTypeStruct &&
        idRequisicao == other.idRequisicao &&
        data == other.data &&
        tpreg == other.tpreg &&
        tpopreg == other.tpopreg &&
        totalreq == other.totalreq &&
        idCliente == other.idCliente &&
        sndisponivel == other.sndisponivel &&
        condpagto == other.condpagto &&
        tpOrigem == other.tpOrigem &&
        tppagto == other.tppagto &&
        usuarioReg == other.usuarioReg &&
        nomeCliente == other.nomeCliente;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idRequisicao,
        data,
        tpreg,
        tpopreg,
        totalreq,
        idCliente,
        sndisponivel,
        condpagto,
        tpOrigem,
        tppagto,
        usuarioReg,
        nomeCliente
      ]);
}

ValeCombustivelDataTypeStruct createValeCombustivelDataTypeStruct({
  int? idRequisicao,
  String? data,
  String? tpreg,
  String? tpopreg,
  double? totalreq,
  int? idCliente,
  String? sndisponivel,
  String? condpagto,
  int? tpOrigem,
  int? tppagto,
  String? usuarioReg,
  String? nomeCliente,
}) =>
    ValeCombustivelDataTypeStruct(
      idRequisicao: idRequisicao,
      data: data,
      tpreg: tpreg,
      tpopreg: tpopreg,
      totalreq: totalreq,
      idCliente: idCliente,
      sndisponivel: sndisponivel,
      condpagto: condpagto,
      tpOrigem: tpOrigem,
      tppagto: tppagto,
      usuarioReg: usuarioReg,
      nomeCliente: nomeCliente,
    );
