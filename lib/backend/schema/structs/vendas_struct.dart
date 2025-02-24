// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendasStruct extends BaseStruct {
  VendasStruct({
    int? idCliente,
    String? datavenda,
    String? hora,
    int? idVendedor,
    int? percDesc,
    int? desconto,
    int? entrada,
    int? idFormapgto,
    String? descrtpvenda,
    String? usuario,
    String? numterminal,
    String? situacaoNfe,
    int? modeloDocf,
    String? chaveNfeVinc,
    String? numdocVinc,
    String? mobile,
    List<VendaitemStruct>? vendaitemRem,
    int? numeroitens,
    int? numparcelas,
    int? idVendaMob,
    int? chaveUnextern,
    int? primeiraPar,
    double? totalprodutos,
    double? totalvenda,
    String? nomeCliente,
    String? cpfcnpj,
  })  : _idCliente = idCliente,
        _datavenda = datavenda,
        _hora = hora,
        _idVendedor = idVendedor,
        _percDesc = percDesc,
        _desconto = desconto,
        _entrada = entrada,
        _idFormapgto = idFormapgto,
        _descrtpvenda = descrtpvenda,
        _usuario = usuario,
        _numterminal = numterminal,
        _situacaoNfe = situacaoNfe,
        _modeloDocf = modeloDocf,
        _chaveNfeVinc = chaveNfeVinc,
        _numdocVinc = numdocVinc,
        _mobile = mobile,
        _vendaitemRem = vendaitemRem,
        _numeroitens = numeroitens,
        _numparcelas = numparcelas,
        _idVendaMob = idVendaMob,
        _chaveUnextern = chaveUnextern,
        _primeiraPar = primeiraPar,
        _totalprodutos = totalprodutos,
        _totalvenda = totalvenda,
        _nomeCliente = nomeCliente,
        _cpfcnpj = cpfcnpj;

  // "ID_CLIENTE" field.
  int? _idCliente;
  int get idCliente => _idCliente ?? 0;
  set idCliente(int? val) => _idCliente = val;

  void incrementIdCliente(int amount) => idCliente = idCliente + amount;

  bool hasIdCliente() => _idCliente != null;

  // "DATAVENDA" field.
  String? _datavenda;
  String get datavenda => _datavenda ?? '';
  set datavenda(String? val) => _datavenda = val;

  bool hasDatavenda() => _datavenda != null;

  // "HORA" field.
  String? _hora;
  String get hora => _hora ?? '';
  set hora(String? val) => _hora = val;

  bool hasHora() => _hora != null;

  // "ID_VENDEDOR" field.
  int? _idVendedor;
  int get idVendedor => _idVendedor ?? 0;
  set idVendedor(int? val) => _idVendedor = val;

  void incrementIdVendedor(int amount) => idVendedor = idVendedor + amount;

  bool hasIdVendedor() => _idVendedor != null;

  // "PERC_DESC" field.
  int? _percDesc;
  int get percDesc => _percDesc ?? 0;
  set percDesc(int? val) => _percDesc = val;

  void incrementPercDesc(int amount) => percDesc = percDesc + amount;

  bool hasPercDesc() => _percDesc != null;

  // "DESCONTO" field.
  int? _desconto;
  int get desconto => _desconto ?? 0;
  set desconto(int? val) => _desconto = val;

  void incrementDesconto(int amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  // "ENTRADA" field.
  int? _entrada;
  int get entrada => _entrada ?? 0;
  set entrada(int? val) => _entrada = val;

  void incrementEntrada(int amount) => entrada = entrada + amount;

  bool hasEntrada() => _entrada != null;

  // "ID_FORMAPGTO" field.
  int? _idFormapgto;
  int get idFormapgto => _idFormapgto ?? 0;
  set idFormapgto(int? val) => _idFormapgto = val;

  void incrementIdFormapgto(int amount) => idFormapgto = idFormapgto + amount;

  bool hasIdFormapgto() => _idFormapgto != null;

  // "DESCRTPVENDA" field.
  String? _descrtpvenda;
  String get descrtpvenda => _descrtpvenda ?? '';
  set descrtpvenda(String? val) => _descrtpvenda = val;

  bool hasDescrtpvenda() => _descrtpvenda != null;

  // "USUARIO" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "NUMTERMINAL" field.
  String? _numterminal;
  String get numterminal => _numterminal ?? '';
  set numterminal(String? val) => _numterminal = val;

  bool hasNumterminal() => _numterminal != null;

  // "SITUACAO_NFE" field.
  String? _situacaoNfe;
  String get situacaoNfe => _situacaoNfe ?? '';
  set situacaoNfe(String? val) => _situacaoNfe = val;

  bool hasSituacaoNfe() => _situacaoNfe != null;

  // "MODELO_DOCF" field.
  int? _modeloDocf;
  int get modeloDocf => _modeloDocf ?? 0;
  set modeloDocf(int? val) => _modeloDocf = val;

  void incrementModeloDocf(int amount) => modeloDocf = modeloDocf + amount;

  bool hasModeloDocf() => _modeloDocf != null;

  // "CHAVE_NFE_VINC" field.
  String? _chaveNfeVinc;
  String get chaveNfeVinc => _chaveNfeVinc ?? '';
  set chaveNfeVinc(String? val) => _chaveNfeVinc = val;

  bool hasChaveNfeVinc() => _chaveNfeVinc != null;

  // "NUMDOC_VINC" field.
  String? _numdocVinc;
  String get numdocVinc => _numdocVinc ?? '';
  set numdocVinc(String? val) => _numdocVinc = val;

  bool hasNumdocVinc() => _numdocVinc != null;

  // "MOBILE" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  // "VENDAITEM_REM" field.
  List<VendaitemStruct>? _vendaitemRem;
  List<VendaitemStruct> get vendaitemRem => _vendaitemRem ?? const [];
  set vendaitemRem(List<VendaitemStruct>? val) => _vendaitemRem = val;

  void updateVendaitemRem(Function(List<VendaitemStruct>) updateFn) {
    updateFn(_vendaitemRem ??= []);
  }

  bool hasVendaitemRem() => _vendaitemRem != null;

  // "NUMEROITENS" field.
  int? _numeroitens;
  int get numeroitens => _numeroitens ?? 0;
  set numeroitens(int? val) => _numeroitens = val;

  void incrementNumeroitens(int amount) => numeroitens = numeroitens + amount;

  bool hasNumeroitens() => _numeroitens != null;

  // "NUMPARCELAS" field.
  int? _numparcelas;
  int get numparcelas => _numparcelas ?? 0;
  set numparcelas(int? val) => _numparcelas = val;

  void incrementNumparcelas(int amount) => numparcelas = numparcelas + amount;

  bool hasNumparcelas() => _numparcelas != null;

  // "ID_VENDA_MOB" field.
  int? _idVendaMob;
  int get idVendaMob => _idVendaMob ?? 0;
  set idVendaMob(int? val) => _idVendaMob = val;

  void incrementIdVendaMob(int amount) => idVendaMob = idVendaMob + amount;

  bool hasIdVendaMob() => _idVendaMob != null;

  // "CHAVE_UNEXTERN" field.
  int? _chaveUnextern;
  int get chaveUnextern => _chaveUnextern ?? 0;
  set chaveUnextern(int? val) => _chaveUnextern = val;

  void incrementChaveUnextern(int amount) =>
      chaveUnextern = chaveUnextern + amount;

  bool hasChaveUnextern() => _chaveUnextern != null;

  // "PRIMEIRA_PAR" field.
  int? _primeiraPar;
  int get primeiraPar => _primeiraPar ?? 0;
  set primeiraPar(int? val) => _primeiraPar = val;

  void incrementPrimeiraPar(int amount) => primeiraPar = primeiraPar + amount;

  bool hasPrimeiraPar() => _primeiraPar != null;

  // "TOTALPRODUTOS" field.
  double? _totalprodutos;
  double get totalprodutos => _totalprodutos ?? 0.0;
  set totalprodutos(double? val) => _totalprodutos = val;

  void incrementTotalprodutos(double amount) =>
      totalprodutos = totalprodutos + amount;

  bool hasTotalprodutos() => _totalprodutos != null;

  // "TOTALVENDA" field.
  double? _totalvenda;
  double get totalvenda => _totalvenda ?? 0.0;
  set totalvenda(double? val) => _totalvenda = val;

  void incrementTotalvenda(double amount) => totalvenda = totalvenda + amount;

  bool hasTotalvenda() => _totalvenda != null;

  // "NOME_CLIENTE" field.
  String? _nomeCliente;
  String get nomeCliente => _nomeCliente ?? '';
  set nomeCliente(String? val) => _nomeCliente = val;

  bool hasNomeCliente() => _nomeCliente != null;

  // "CPFCNPJ" field.
  String? _cpfcnpj;
  String get cpfcnpj => _cpfcnpj ?? '';
  set cpfcnpj(String? val) => _cpfcnpj = val;

  bool hasCpfcnpj() => _cpfcnpj != null;

  static VendasStruct fromMap(Map<String, dynamic> data) => VendasStruct(
        idCliente: castToType<int>(data['ID_CLIENTE']),
        datavenda: data['DATAVENDA'] as String?,
        hora: data['HORA'] as String?,
        idVendedor: castToType<int>(data['ID_VENDEDOR']),
        percDesc: castToType<int>(data['PERC_DESC']),
        desconto: castToType<int>(data['DESCONTO']),
        entrada: castToType<int>(data['ENTRADA']),
        idFormapgto: castToType<int>(data['ID_FORMAPGTO']),
        descrtpvenda: data['DESCRTPVENDA'] as String?,
        usuario: data['USUARIO'] as String?,
        numterminal: data['NUMTERMINAL'] as String?,
        situacaoNfe: data['SITUACAO_NFE'] as String?,
        modeloDocf: castToType<int>(data['MODELO_DOCF']),
        chaveNfeVinc: data['CHAVE_NFE_VINC'] as String?,
        numdocVinc: data['NUMDOC_VINC'] as String?,
        mobile: data['MOBILE'] as String?,
        vendaitemRem: getStructList(
          data['VENDAITEM_REM'],
          VendaitemStruct.fromMap,
        ),
        numeroitens: castToType<int>(data['NUMEROITENS']),
        numparcelas: castToType<int>(data['NUMPARCELAS']),
        idVendaMob: castToType<int>(data['ID_VENDA_MOB']),
        chaveUnextern: castToType<int>(data['CHAVE_UNEXTERN']),
        primeiraPar: castToType<int>(data['PRIMEIRA_PAR']),
        totalprodutos: castToType<double>(data['TOTALPRODUTOS']),
        totalvenda: castToType<double>(data['TOTALVENDA']),
        nomeCliente: data['NOME_CLIENTE'] as String?,
        cpfcnpj: data['CPFCNPJ'] as String?,
      );

  static VendasStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ID_CLIENTE': _idCliente,
        'DATAVENDA': _datavenda,
        'HORA': _hora,
        'ID_VENDEDOR': _idVendedor,
        'PERC_DESC': _percDesc,
        'DESCONTO': _desconto,
        'ENTRADA': _entrada,
        'ID_FORMAPGTO': _idFormapgto,
        'DESCRTPVENDA': _descrtpvenda,
        'USUARIO': _usuario,
        'NUMTERMINAL': _numterminal,
        'SITUACAO_NFE': _situacaoNfe,
        'MODELO_DOCF': _modeloDocf,
        'CHAVE_NFE_VINC': _chaveNfeVinc,
        'NUMDOC_VINC': _numdocVinc,
        'MOBILE': _mobile,
        'VENDAITEM_REM': _vendaitemRem?.map((e) => e.toMap()).toList(),
        'NUMEROITENS': _numeroitens,
        'NUMPARCELAS': _numparcelas,
        'ID_VENDA_MOB': _idVendaMob,
        'CHAVE_UNEXTERN': _chaveUnextern,
        'PRIMEIRA_PAR': _primeiraPar,
        'TOTALPRODUTOS': _totalprodutos,
        'TOTALVENDA': _totalvenda,
        'NOME_CLIENTE': _nomeCliente,
        'CPFCNPJ': _cpfcnpj,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CLIENTE': serializeParam(
          _idCliente,
          ParamType.int,
        ),
        'DATAVENDA': serializeParam(
          _datavenda,
          ParamType.String,
        ),
        'HORA': serializeParam(
          _hora,
          ParamType.String,
        ),
        'ID_VENDEDOR': serializeParam(
          _idVendedor,
          ParamType.int,
        ),
        'PERC_DESC': serializeParam(
          _percDesc,
          ParamType.int,
        ),
        'DESCONTO': serializeParam(
          _desconto,
          ParamType.int,
        ),
        'ENTRADA': serializeParam(
          _entrada,
          ParamType.int,
        ),
        'ID_FORMAPGTO': serializeParam(
          _idFormapgto,
          ParamType.int,
        ),
        'DESCRTPVENDA': serializeParam(
          _descrtpvenda,
          ParamType.String,
        ),
        'USUARIO': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'NUMTERMINAL': serializeParam(
          _numterminal,
          ParamType.String,
        ),
        'SITUACAO_NFE': serializeParam(
          _situacaoNfe,
          ParamType.String,
        ),
        'MODELO_DOCF': serializeParam(
          _modeloDocf,
          ParamType.int,
        ),
        'CHAVE_NFE_VINC': serializeParam(
          _chaveNfeVinc,
          ParamType.String,
        ),
        'NUMDOC_VINC': serializeParam(
          _numdocVinc,
          ParamType.String,
        ),
        'MOBILE': serializeParam(
          _mobile,
          ParamType.String,
        ),
        'VENDAITEM_REM': serializeParam(
          _vendaitemRem,
          ParamType.DataStruct,
          isList: true,
        ),
        'NUMEROITENS': serializeParam(
          _numeroitens,
          ParamType.int,
        ),
        'NUMPARCELAS': serializeParam(
          _numparcelas,
          ParamType.int,
        ),
        'ID_VENDA_MOB': serializeParam(
          _idVendaMob,
          ParamType.int,
        ),
        'CHAVE_UNEXTERN': serializeParam(
          _chaveUnextern,
          ParamType.int,
        ),
        'PRIMEIRA_PAR': serializeParam(
          _primeiraPar,
          ParamType.int,
        ),
        'TOTALPRODUTOS': serializeParam(
          _totalprodutos,
          ParamType.double,
        ),
        'TOTALVENDA': serializeParam(
          _totalvenda,
          ParamType.double,
        ),
        'NOME_CLIENTE': serializeParam(
          _nomeCliente,
          ParamType.String,
        ),
        'CPFCNPJ': serializeParam(
          _cpfcnpj,
          ParamType.String,
        ),
      }.withoutNulls;

  static VendasStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendasStruct(
        idCliente: deserializeParam(
          data['ID_CLIENTE'],
          ParamType.int,
          false,
        ),
        datavenda: deserializeParam(
          data['DATAVENDA'],
          ParamType.String,
          false,
        ),
        hora: deserializeParam(
          data['HORA'],
          ParamType.String,
          false,
        ),
        idVendedor: deserializeParam(
          data['ID_VENDEDOR'],
          ParamType.int,
          false,
        ),
        percDesc: deserializeParam(
          data['PERC_DESC'],
          ParamType.int,
          false,
        ),
        desconto: deserializeParam(
          data['DESCONTO'],
          ParamType.int,
          false,
        ),
        entrada: deserializeParam(
          data['ENTRADA'],
          ParamType.int,
          false,
        ),
        idFormapgto: deserializeParam(
          data['ID_FORMAPGTO'],
          ParamType.int,
          false,
        ),
        descrtpvenda: deserializeParam(
          data['DESCRTPVENDA'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['USUARIO'],
          ParamType.String,
          false,
        ),
        numterminal: deserializeParam(
          data['NUMTERMINAL'],
          ParamType.String,
          false,
        ),
        situacaoNfe: deserializeParam(
          data['SITUACAO_NFE'],
          ParamType.String,
          false,
        ),
        modeloDocf: deserializeParam(
          data['MODELO_DOCF'],
          ParamType.int,
          false,
        ),
        chaveNfeVinc: deserializeParam(
          data['CHAVE_NFE_VINC'],
          ParamType.String,
          false,
        ),
        numdocVinc: deserializeParam(
          data['NUMDOC_VINC'],
          ParamType.String,
          false,
        ),
        mobile: deserializeParam(
          data['MOBILE'],
          ParamType.String,
          false,
        ),
        vendaitemRem: deserializeStructParam<VendaitemStruct>(
          data['VENDAITEM_REM'],
          ParamType.DataStruct,
          true,
          structBuilder: VendaitemStruct.fromSerializableMap,
        ),
        numeroitens: deserializeParam(
          data['NUMEROITENS'],
          ParamType.int,
          false,
        ),
        numparcelas: deserializeParam(
          data['NUMPARCELAS'],
          ParamType.int,
          false,
        ),
        idVendaMob: deserializeParam(
          data['ID_VENDA_MOB'],
          ParamType.int,
          false,
        ),
        chaveUnextern: deserializeParam(
          data['CHAVE_UNEXTERN'],
          ParamType.int,
          false,
        ),
        primeiraPar: deserializeParam(
          data['PRIMEIRA_PAR'],
          ParamType.int,
          false,
        ),
        totalprodutos: deserializeParam(
          data['TOTALPRODUTOS'],
          ParamType.double,
          false,
        ),
        totalvenda: deserializeParam(
          data['TOTALVENDA'],
          ParamType.double,
          false,
        ),
        nomeCliente: deserializeParam(
          data['NOME_CLIENTE'],
          ParamType.String,
          false,
        ),
        cpfcnpj: deserializeParam(
          data['CPFCNPJ'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VendasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VendasStruct &&
        idCliente == other.idCliente &&
        datavenda == other.datavenda &&
        hora == other.hora &&
        idVendedor == other.idVendedor &&
        percDesc == other.percDesc &&
        desconto == other.desconto &&
        entrada == other.entrada &&
        idFormapgto == other.idFormapgto &&
        descrtpvenda == other.descrtpvenda &&
        usuario == other.usuario &&
        numterminal == other.numterminal &&
        situacaoNfe == other.situacaoNfe &&
        modeloDocf == other.modeloDocf &&
        chaveNfeVinc == other.chaveNfeVinc &&
        numdocVinc == other.numdocVinc &&
        mobile == other.mobile &&
        listEquality.equals(vendaitemRem, other.vendaitemRem) &&
        numeroitens == other.numeroitens &&
        numparcelas == other.numparcelas &&
        idVendaMob == other.idVendaMob &&
        chaveUnextern == other.chaveUnextern &&
        primeiraPar == other.primeiraPar &&
        totalprodutos == other.totalprodutos &&
        totalvenda == other.totalvenda &&
        nomeCliente == other.nomeCliente &&
        cpfcnpj == other.cpfcnpj;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCliente,
        datavenda,
        hora,
        idVendedor,
        percDesc,
        desconto,
        entrada,
        idFormapgto,
        descrtpvenda,
        usuario,
        numterminal,
        situacaoNfe,
        modeloDocf,
        chaveNfeVinc,
        numdocVinc,
        mobile,
        vendaitemRem,
        numeroitens,
        numparcelas,
        idVendaMob,
        chaveUnextern,
        primeiraPar,
        totalprodutos,
        totalvenda,
        nomeCliente,
        cpfcnpj
      ]);
}

VendasStruct createVendasStruct({
  int? idCliente,
  String? datavenda,
  String? hora,
  int? idVendedor,
  int? percDesc,
  int? desconto,
  int? entrada,
  int? idFormapgto,
  String? descrtpvenda,
  String? usuario,
  String? numterminal,
  String? situacaoNfe,
  int? modeloDocf,
  String? chaveNfeVinc,
  String? numdocVinc,
  String? mobile,
  int? numeroitens,
  int? numparcelas,
  int? idVendaMob,
  int? chaveUnextern,
  int? primeiraPar,
  double? totalprodutos,
  double? totalvenda,
  String? nomeCliente,
  String? cpfcnpj,
}) =>
    VendasStruct(
      idCliente: idCliente,
      datavenda: datavenda,
      hora: hora,
      idVendedor: idVendedor,
      percDesc: percDesc,
      desconto: desconto,
      entrada: entrada,
      idFormapgto: idFormapgto,
      descrtpvenda: descrtpvenda,
      usuario: usuario,
      numterminal: numterminal,
      situacaoNfe: situacaoNfe,
      modeloDocf: modeloDocf,
      chaveNfeVinc: chaveNfeVinc,
      numdocVinc: numdocVinc,
      mobile: mobile,
      numeroitens: numeroitens,
      numparcelas: numparcelas,
      idVendaMob: idVendaMob,
      chaveUnextern: chaveUnextern,
      primeiraPar: primeiraPar,
      totalprodutos: totalprodutos,
      totalvenda: totalvenda,
      nomeCliente: nomeCliente,
      cpfcnpj: cpfcnpj,
    );
