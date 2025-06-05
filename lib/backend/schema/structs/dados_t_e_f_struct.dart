// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DadosTEFStruct extends BaseStruct {
  DadosTEFStruct({
    String? administradora,
    String? rede,
    String? operacao,
    int? nsu,
    int? aut,
    int? parc,
    double? valor,
    String? tpparc,
    int? codadm,
    String? cnpjadm,
    int? modoequip,
    int? modoreg,
    PagNumServer? numpag,
    String? jsonretorno,
    String? callerid,
    List<ValeCombustivelDataTypeStruct>? valesprocessados,
    double? desconto,
    int? voucherpg,
  })  : _administradora = administradora,
        _rede = rede,
        _operacao = operacao,
        _nsu = nsu,
        _aut = aut,
        _parc = parc,
        _valor = valor,
        _tpparc = tpparc,
        _codadm = codadm,
        _cnpjadm = cnpjadm,
        _modoequip = modoequip,
        _modoreg = modoreg,
        _numpag = numpag,
        _jsonretorno = jsonretorno,
        _callerid = callerid,
        _valesprocessados = valesprocessados,
        _desconto = desconto,
        _voucherpg = voucherpg;

  // "administradora" field.
  String? _administradora;
  String get administradora => _administradora ?? '';
  set administradora(String? val) => _administradora = val;

  bool hasAdministradora() => _administradora != null;

  // "rede" field.
  String? _rede;
  String get rede => _rede ?? '';
  set rede(String? val) => _rede = val;

  bool hasRede() => _rede != null;

  // "operacao" field.
  String? _operacao;
  String get operacao => _operacao ?? '';
  set operacao(String? val) => _operacao = val;

  bool hasOperacao() => _operacao != null;

  // "nsu" field.
  int? _nsu;
  int get nsu => _nsu ?? 0;
  set nsu(int? val) => _nsu = val;

  void incrementNsu(int amount) => nsu = nsu + amount;

  bool hasNsu() => _nsu != null;

  // "aut" field.
  int? _aut;
  int get aut => _aut ?? 0;
  set aut(int? val) => _aut = val;

  void incrementAut(int amount) => aut = aut + amount;

  bool hasAut() => _aut != null;

  // "parc" field.
  int? _parc;
  int get parc => _parc ?? 0;
  set parc(int? val) => _parc = val;

  void incrementParc(int amount) => parc = parc + amount;

  bool hasParc() => _parc != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "tpparc" field.
  String? _tpparc;
  String get tpparc => _tpparc ?? '';
  set tpparc(String? val) => _tpparc = val;

  bool hasTpparc() => _tpparc != null;

  // "codadm" field.
  int? _codadm;
  int get codadm => _codadm ?? 0;
  set codadm(int? val) => _codadm = val;

  void incrementCodadm(int amount) => codadm = codadm + amount;

  bool hasCodadm() => _codadm != null;

  // "cnpjadm" field.
  String? _cnpjadm;
  String get cnpjadm => _cnpjadm ?? '';
  set cnpjadm(String? val) => _cnpjadm = val;

  bool hasCnpjadm() => _cnpjadm != null;

  // "modoequip" field.
  int? _modoequip;
  int get modoequip => _modoequip ?? 0;
  set modoequip(int? val) => _modoequip = val;

  void incrementModoequip(int amount) => modoequip = modoequip + amount;

  bool hasModoequip() => _modoequip != null;

  // "modoreg" field.
  int? _modoreg;
  int get modoreg => _modoreg ?? 0;
  set modoreg(int? val) => _modoreg = val;

  void incrementModoreg(int amount) => modoreg = modoreg + amount;

  bool hasModoreg() => _modoreg != null;

  // "numpag" field.
  PagNumServer? _numpag;
  PagNumServer? get numpag => _numpag;
  set numpag(PagNumServer? val) => _numpag = val;

  bool hasNumpag() => _numpag != null;

  // "jsonretorno" field.
  String? _jsonretorno;
  String get jsonretorno => _jsonretorno ?? '';
  set jsonretorno(String? val) => _jsonretorno = val;

  bool hasJsonretorno() => _jsonretorno != null;

  // "callerid" field.
  String? _callerid;
  String get callerid => _callerid ?? '';
  set callerid(String? val) => _callerid = val;

  bool hasCallerid() => _callerid != null;

  // "valesprocessados" field.
  List<ValeCombustivelDataTypeStruct>? _valesprocessados;
  List<ValeCombustivelDataTypeStruct> get valesprocessados =>
      _valesprocessados ?? const [];
  set valesprocessados(List<ValeCombustivelDataTypeStruct>? val) =>
      _valesprocessados = val;

  void updateValesprocessados(
      Function(List<ValeCombustivelDataTypeStruct>) updateFn) {
    updateFn(_valesprocessados ??= []);
  }

  bool hasValesprocessados() => _valesprocessados != null;

  // "desconto" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  set desconto(double? val) => _desconto = val;

  void incrementDesconto(double amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  // "voucherpg" field.
  int? _voucherpg;
  int get voucherpg => _voucherpg ?? 0;
  set voucherpg(int? val) => _voucherpg = val;

  void incrementVoucherpg(int amount) => voucherpg = voucherpg + amount;

  bool hasVoucherpg() => _voucherpg != null;

  static DadosTEFStruct fromMap(Map<String, dynamic> data) => DadosTEFStruct(
        administradora: data['administradora'] as String?,
        rede: data['rede'] as String?,
        operacao: data['operacao'] as String?,
        nsu: castToType<int>(data['nsu']),
        aut: castToType<int>(data['aut']),
        parc: castToType<int>(data['parc']),
        valor: castToType<double>(data['valor']),
        tpparc: data['tpparc'] as String?,
        codadm: castToType<int>(data['codadm']),
        cnpjadm: data['cnpjadm'] as String?,
        modoequip: castToType<int>(data['modoequip']),
        modoreg: castToType<int>(data['modoreg']),
        numpag: data['numpag'] is PagNumServer
            ? data['numpag']
            : deserializeEnum<PagNumServer>(data['numpag']),
        jsonretorno: data['jsonretorno'] as String?,
        callerid: data['callerid'] as String?,
        valesprocessados: getStructList(
          data['valesprocessados'],
          ValeCombustivelDataTypeStruct.fromMap,
        ),
        desconto: castToType<double>(data['desconto']),
        voucherpg: castToType<int>(data['voucherpg']),
      );

  static DadosTEFStruct? maybeFromMap(dynamic data) =>
      data is Map ? DadosTEFStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'administradora': _administradora,
        'rede': _rede,
        'operacao': _operacao,
        'nsu': _nsu,
        'aut': _aut,
        'parc': _parc,
        'valor': _valor,
        'tpparc': _tpparc,
        'codadm': _codadm,
        'cnpjadm': _cnpjadm,
        'modoequip': _modoequip,
        'modoreg': _modoreg,
        'numpag': _numpag?.serialize(),
        'jsonretorno': _jsonretorno,
        'callerid': _callerid,
        'valesprocessados': _valesprocessados?.map((e) => e.toMap()).toList(),
        'desconto': _desconto,
        'voucherpg': _voucherpg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'administradora': serializeParam(
          _administradora,
          ParamType.String,
        ),
        'rede': serializeParam(
          _rede,
          ParamType.String,
        ),
        'operacao': serializeParam(
          _operacao,
          ParamType.String,
        ),
        'nsu': serializeParam(
          _nsu,
          ParamType.int,
        ),
        'aut': serializeParam(
          _aut,
          ParamType.int,
        ),
        'parc': serializeParam(
          _parc,
          ParamType.int,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'tpparc': serializeParam(
          _tpparc,
          ParamType.String,
        ),
        'codadm': serializeParam(
          _codadm,
          ParamType.int,
        ),
        'cnpjadm': serializeParam(
          _cnpjadm,
          ParamType.String,
        ),
        'modoequip': serializeParam(
          _modoequip,
          ParamType.int,
        ),
        'modoreg': serializeParam(
          _modoreg,
          ParamType.int,
        ),
        'numpag': serializeParam(
          _numpag,
          ParamType.Enum,
        ),
        'jsonretorno': serializeParam(
          _jsonretorno,
          ParamType.String,
        ),
        'callerid': serializeParam(
          _callerid,
          ParamType.String,
        ),
        'valesprocessados': serializeParam(
          _valesprocessados,
          ParamType.DataStruct,
          isList: true,
        ),
        'desconto': serializeParam(
          _desconto,
          ParamType.double,
        ),
        'voucherpg': serializeParam(
          _voucherpg,
          ParamType.int,
        ),
      }.withoutNulls;

  static DadosTEFStruct fromSerializableMap(Map<String, dynamic> data) =>
      DadosTEFStruct(
        administradora: deserializeParam(
          data['administradora'],
          ParamType.String,
          false,
        ),
        rede: deserializeParam(
          data['rede'],
          ParamType.String,
          false,
        ),
        operacao: deserializeParam(
          data['operacao'],
          ParamType.String,
          false,
        ),
        nsu: deserializeParam(
          data['nsu'],
          ParamType.int,
          false,
        ),
        aut: deserializeParam(
          data['aut'],
          ParamType.int,
          false,
        ),
        parc: deserializeParam(
          data['parc'],
          ParamType.int,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        tpparc: deserializeParam(
          data['tpparc'],
          ParamType.String,
          false,
        ),
        codadm: deserializeParam(
          data['codadm'],
          ParamType.int,
          false,
        ),
        cnpjadm: deserializeParam(
          data['cnpjadm'],
          ParamType.String,
          false,
        ),
        modoequip: deserializeParam(
          data['modoequip'],
          ParamType.int,
          false,
        ),
        modoreg: deserializeParam(
          data['modoreg'],
          ParamType.int,
          false,
        ),
        numpag: deserializeParam<PagNumServer>(
          data['numpag'],
          ParamType.Enum,
          false,
        ),
        jsonretorno: deserializeParam(
          data['jsonretorno'],
          ParamType.String,
          false,
        ),
        callerid: deserializeParam(
          data['callerid'],
          ParamType.String,
          false,
        ),
        valesprocessados: deserializeStructParam<ValeCombustivelDataTypeStruct>(
          data['valesprocessados'],
          ParamType.DataStruct,
          true,
          structBuilder: ValeCombustivelDataTypeStruct.fromSerializableMap,
        ),
        desconto: deserializeParam(
          data['desconto'],
          ParamType.double,
          false,
        ),
        voucherpg: deserializeParam(
          data['voucherpg'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DadosTEFStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DadosTEFStruct &&
        administradora == other.administradora &&
        rede == other.rede &&
        operacao == other.operacao &&
        nsu == other.nsu &&
        aut == other.aut &&
        parc == other.parc &&
        valor == other.valor &&
        tpparc == other.tpparc &&
        codadm == other.codadm &&
        cnpjadm == other.cnpjadm &&
        modoequip == other.modoequip &&
        modoreg == other.modoreg &&
        numpag == other.numpag &&
        jsonretorno == other.jsonretorno &&
        callerid == other.callerid &&
        listEquality.equals(valesprocessados, other.valesprocessados) &&
        desconto == other.desconto &&
        voucherpg == other.voucherpg;
  }

  @override
  int get hashCode => const ListEquality().hash([
        administradora,
        rede,
        operacao,
        nsu,
        aut,
        parc,
        valor,
        tpparc,
        codadm,
        cnpjadm,
        modoequip,
        modoreg,
        numpag,
        jsonretorno,
        callerid,
        valesprocessados,
        desconto,
        voucherpg
      ]);
}

DadosTEFStruct createDadosTEFStruct({
  String? administradora,
  String? rede,
  String? operacao,
  int? nsu,
  int? aut,
  int? parc,
  double? valor,
  String? tpparc,
  int? codadm,
  String? cnpjadm,
  int? modoequip,
  int? modoreg,
  PagNumServer? numpag,
  String? jsonretorno,
  String? callerid,
  double? desconto,
  int? voucherpg,
}) =>
    DadosTEFStruct(
      administradora: administradora,
      rede: rede,
      operacao: operacao,
      nsu: nsu,
      aut: aut,
      parc: parc,
      valor: valor,
      tpparc: tpparc,
      codadm: codadm,
      cnpjadm: cnpjadm,
      modoequip: modoequip,
      modoreg: modoreg,
      numpag: numpag,
      jsonretorno: jsonretorno,
      callerid: callerid,
      desconto: desconto,
      voucherpg: voucherpg,
    );
