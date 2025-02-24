// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendasRemReturnStruct extends BaseStruct {
  VendasRemReturnStruct({
    int? id,
    int? idCodigo,
    int? idCliente,
    String? nomeCliente,
    String? cpfcnpj,
    String? datavenda,
    String? hora,
    int? idVendedor,
    int? totalprodutos,
    int? numeroitens,
    int? percDesc,
    int? desconto,
    int? entrada,
    int? totalvenda,
    int? idFormapgto,
    String? descrtpvenda,
    int? numparcelas,
    String? usuario,
    int? numterminal,
    String? situacaoNfe,
    String? modeloDocf,
    String? chaveNfeVinc,
    int? numdocVinc,
    String? mobile,
    int? idVendaMob,
    String? chaveUnextern,
  })  : _id = id,
        _idCodigo = idCodigo,
        _idCliente = idCliente,
        _nomeCliente = nomeCliente,
        _cpfcnpj = cpfcnpj,
        _datavenda = datavenda,
        _hora = hora,
        _idVendedor = idVendedor,
        _totalprodutos = totalprodutos,
        _numeroitens = numeroitens,
        _percDesc = percDesc,
        _desconto = desconto,
        _entrada = entrada,
        _totalvenda = totalvenda,
        _idFormapgto = idFormapgto,
        _descrtpvenda = descrtpvenda,
        _numparcelas = numparcelas,
        _usuario = usuario,
        _numterminal = numterminal,
        _situacaoNfe = situacaoNfe,
        _modeloDocf = modeloDocf,
        _chaveNfeVinc = chaveNfeVinc,
        _numdocVinc = numdocVinc,
        _mobile = mobile,
        _idVendaMob = idVendaMob,
        _chaveUnextern = chaveUnextern;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "ID_CLIENTE" field.
  int? _idCliente;
  int get idCliente => _idCliente ?? 0;
  set idCliente(int? val) => _idCliente = val;

  void incrementIdCliente(int amount) => idCliente = idCliente + amount;

  bool hasIdCliente() => _idCliente != null;

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

  // "TOTALPRODUTOS" field.
  int? _totalprodutos;
  int get totalprodutos => _totalprodutos ?? 0;
  set totalprodutos(int? val) => _totalprodutos = val;

  void incrementTotalprodutos(int amount) =>
      totalprodutos = totalprodutos + amount;

  bool hasTotalprodutos() => _totalprodutos != null;

  // "NUMEROITENS" field.
  int? _numeroitens;
  int get numeroitens => _numeroitens ?? 0;
  set numeroitens(int? val) => _numeroitens = val;

  void incrementNumeroitens(int amount) => numeroitens = numeroitens + amount;

  bool hasNumeroitens() => _numeroitens != null;

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

  // "TOTALVENDA" field.
  int? _totalvenda;
  int get totalvenda => _totalvenda ?? 0;
  set totalvenda(int? val) => _totalvenda = val;

  void incrementTotalvenda(int amount) => totalvenda = totalvenda + amount;

  bool hasTotalvenda() => _totalvenda != null;

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

  // "NUMPARCELAS" field.
  int? _numparcelas;
  int get numparcelas => _numparcelas ?? 0;
  set numparcelas(int? val) => _numparcelas = val;

  void incrementNumparcelas(int amount) => numparcelas = numparcelas + amount;

  bool hasNumparcelas() => _numparcelas != null;

  // "USUARIO" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "NUMTERMINAL" field.
  int? _numterminal;
  int get numterminal => _numterminal ?? 0;
  set numterminal(int? val) => _numterminal = val;

  void incrementNumterminal(int amount) => numterminal = numterminal + amount;

  bool hasNumterminal() => _numterminal != null;

  // "SITUACAO_NFE" field.
  String? _situacaoNfe;
  String get situacaoNfe => _situacaoNfe ?? '';
  set situacaoNfe(String? val) => _situacaoNfe = val;

  bool hasSituacaoNfe() => _situacaoNfe != null;

  // "MODELO_DOCF" field.
  String? _modeloDocf;
  String get modeloDocf => _modeloDocf ?? '';
  set modeloDocf(String? val) => _modeloDocf = val;

  bool hasModeloDocf() => _modeloDocf != null;

  // "CHAVE_NFE_VINC" field.
  String? _chaveNfeVinc;
  String get chaveNfeVinc => _chaveNfeVinc ?? '';
  set chaveNfeVinc(String? val) => _chaveNfeVinc = val;

  bool hasChaveNfeVinc() => _chaveNfeVinc != null;

  // "NUMDOC_VINC" field.
  int? _numdocVinc;
  int get numdocVinc => _numdocVinc ?? 0;
  set numdocVinc(int? val) => _numdocVinc = val;

  void incrementNumdocVinc(int amount) => numdocVinc = numdocVinc + amount;

  bool hasNumdocVinc() => _numdocVinc != null;

  // "MOBILE" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  // "ID_VENDA_MOB" field.
  int? _idVendaMob;
  int get idVendaMob => _idVendaMob ?? 0;
  set idVendaMob(int? val) => _idVendaMob = val;

  void incrementIdVendaMob(int amount) => idVendaMob = idVendaMob + amount;

  bool hasIdVendaMob() => _idVendaMob != null;

  // "CHAVE_UNEXTERN" field.
  String? _chaveUnextern;
  String get chaveUnextern => _chaveUnextern ?? '';
  set chaveUnextern(String? val) => _chaveUnextern = val;

  bool hasChaveUnextern() => _chaveUnextern != null;

  static VendasRemReturnStruct fromMap(Map<String, dynamic> data) =>
      VendasRemReturnStruct(
        id: castToType<int>(data['id']),
        idCodigo: castToType<int>(data['ID_CODIGO']),
        idCliente: castToType<int>(data['ID_CLIENTE']),
        nomeCliente: data['NOME_CLIENTE'] as String?,
        cpfcnpj: data['CPFCNPJ'] as String?,
        datavenda: data['DATAVENDA'] as String?,
        hora: data['HORA'] as String?,
        idVendedor: castToType<int>(data['ID_VENDEDOR']),
        totalprodutos: castToType<int>(data['TOTALPRODUTOS']),
        numeroitens: castToType<int>(data['NUMEROITENS']),
        percDesc: castToType<int>(data['PERC_DESC']),
        desconto: castToType<int>(data['DESCONTO']),
        entrada: castToType<int>(data['ENTRADA']),
        totalvenda: castToType<int>(data['TOTALVENDA']),
        idFormapgto: castToType<int>(data['ID_FORMAPGTO']),
        descrtpvenda: data['DESCRTPVENDA'] as String?,
        numparcelas: castToType<int>(data['NUMPARCELAS']),
        usuario: data['USUARIO'] as String?,
        numterminal: castToType<int>(data['NUMTERMINAL']),
        situacaoNfe: data['SITUACAO_NFE'] as String?,
        modeloDocf: data['MODELO_DOCF'] as String?,
        chaveNfeVinc: data['CHAVE_NFE_VINC'] as String?,
        numdocVinc: castToType<int>(data['NUMDOC_VINC']),
        mobile: data['MOBILE'] as String?,
        idVendaMob: castToType<int>(data['ID_VENDA_MOB']),
        chaveUnextern: data['CHAVE_UNEXTERN'] as String?,
      );

  static VendasRemReturnStruct? maybeFromMap(dynamic data) => data is Map
      ? VendasRemReturnStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'ID_CODIGO': _idCodigo,
        'ID_CLIENTE': _idCliente,
        'NOME_CLIENTE': _nomeCliente,
        'CPFCNPJ': _cpfcnpj,
        'DATAVENDA': _datavenda,
        'HORA': _hora,
        'ID_VENDEDOR': _idVendedor,
        'TOTALPRODUTOS': _totalprodutos,
        'NUMEROITENS': _numeroitens,
        'PERC_DESC': _percDesc,
        'DESCONTO': _desconto,
        'ENTRADA': _entrada,
        'TOTALVENDA': _totalvenda,
        'ID_FORMAPGTO': _idFormapgto,
        'DESCRTPVENDA': _descrtpvenda,
        'NUMPARCELAS': _numparcelas,
        'USUARIO': _usuario,
        'NUMTERMINAL': _numterminal,
        'SITUACAO_NFE': _situacaoNfe,
        'MODELO_DOCF': _modeloDocf,
        'CHAVE_NFE_VINC': _chaveNfeVinc,
        'NUMDOC_VINC': _numdocVinc,
        'MOBILE': _mobile,
        'ID_VENDA_MOB': _idVendaMob,
        'CHAVE_UNEXTERN': _chaveUnextern,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'ID_CLIENTE': serializeParam(
          _idCliente,
          ParamType.int,
        ),
        'NOME_CLIENTE': serializeParam(
          _nomeCliente,
          ParamType.String,
        ),
        'CPFCNPJ': serializeParam(
          _cpfcnpj,
          ParamType.String,
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
        'TOTALPRODUTOS': serializeParam(
          _totalprodutos,
          ParamType.int,
        ),
        'NUMEROITENS': serializeParam(
          _numeroitens,
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
        'TOTALVENDA': serializeParam(
          _totalvenda,
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
        'NUMPARCELAS': serializeParam(
          _numparcelas,
          ParamType.int,
        ),
        'USUARIO': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'NUMTERMINAL': serializeParam(
          _numterminal,
          ParamType.int,
        ),
        'SITUACAO_NFE': serializeParam(
          _situacaoNfe,
          ParamType.String,
        ),
        'MODELO_DOCF': serializeParam(
          _modeloDocf,
          ParamType.String,
        ),
        'CHAVE_NFE_VINC': serializeParam(
          _chaveNfeVinc,
          ParamType.String,
        ),
        'NUMDOC_VINC': serializeParam(
          _numdocVinc,
          ParamType.int,
        ),
        'MOBILE': serializeParam(
          _mobile,
          ParamType.String,
        ),
        'ID_VENDA_MOB': serializeParam(
          _idVendaMob,
          ParamType.int,
        ),
        'CHAVE_UNEXTERN': serializeParam(
          _chaveUnextern,
          ParamType.String,
        ),
      }.withoutNulls;

  static VendasRemReturnStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendasRemReturnStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        idCliente: deserializeParam(
          data['ID_CLIENTE'],
          ParamType.int,
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
        totalprodutos: deserializeParam(
          data['TOTALPRODUTOS'],
          ParamType.int,
          false,
        ),
        numeroitens: deserializeParam(
          data['NUMEROITENS'],
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
        totalvenda: deserializeParam(
          data['TOTALVENDA'],
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
        numparcelas: deserializeParam(
          data['NUMPARCELAS'],
          ParamType.int,
          false,
        ),
        usuario: deserializeParam(
          data['USUARIO'],
          ParamType.String,
          false,
        ),
        numterminal: deserializeParam(
          data['NUMTERMINAL'],
          ParamType.int,
          false,
        ),
        situacaoNfe: deserializeParam(
          data['SITUACAO_NFE'],
          ParamType.String,
          false,
        ),
        modeloDocf: deserializeParam(
          data['MODELO_DOCF'],
          ParamType.String,
          false,
        ),
        chaveNfeVinc: deserializeParam(
          data['CHAVE_NFE_VINC'],
          ParamType.String,
          false,
        ),
        numdocVinc: deserializeParam(
          data['NUMDOC_VINC'],
          ParamType.int,
          false,
        ),
        mobile: deserializeParam(
          data['MOBILE'],
          ParamType.String,
          false,
        ),
        idVendaMob: deserializeParam(
          data['ID_VENDA_MOB'],
          ParamType.int,
          false,
        ),
        chaveUnextern: deserializeParam(
          data['CHAVE_UNEXTERN'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VendasRemReturnStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendasRemReturnStruct &&
        id == other.id &&
        idCodigo == other.idCodigo &&
        idCliente == other.idCliente &&
        nomeCliente == other.nomeCliente &&
        cpfcnpj == other.cpfcnpj &&
        datavenda == other.datavenda &&
        hora == other.hora &&
        idVendedor == other.idVendedor &&
        totalprodutos == other.totalprodutos &&
        numeroitens == other.numeroitens &&
        percDesc == other.percDesc &&
        desconto == other.desconto &&
        entrada == other.entrada &&
        totalvenda == other.totalvenda &&
        idFormapgto == other.idFormapgto &&
        descrtpvenda == other.descrtpvenda &&
        numparcelas == other.numparcelas &&
        usuario == other.usuario &&
        numterminal == other.numterminal &&
        situacaoNfe == other.situacaoNfe &&
        modeloDocf == other.modeloDocf &&
        chaveNfeVinc == other.chaveNfeVinc &&
        numdocVinc == other.numdocVinc &&
        mobile == other.mobile &&
        idVendaMob == other.idVendaMob &&
        chaveUnextern == other.chaveUnextern;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        idCodigo,
        idCliente,
        nomeCliente,
        cpfcnpj,
        datavenda,
        hora,
        idVendedor,
        totalprodutos,
        numeroitens,
        percDesc,
        desconto,
        entrada,
        totalvenda,
        idFormapgto,
        descrtpvenda,
        numparcelas,
        usuario,
        numterminal,
        situacaoNfe,
        modeloDocf,
        chaveNfeVinc,
        numdocVinc,
        mobile,
        idVendaMob,
        chaveUnextern
      ]);
}

VendasRemReturnStruct createVendasRemReturnStruct({
  int? id,
  int? idCodigo,
  int? idCliente,
  String? nomeCliente,
  String? cpfcnpj,
  String? datavenda,
  String? hora,
  int? idVendedor,
  int? totalprodutos,
  int? numeroitens,
  int? percDesc,
  int? desconto,
  int? entrada,
  int? totalvenda,
  int? idFormapgto,
  String? descrtpvenda,
  int? numparcelas,
  String? usuario,
  int? numterminal,
  String? situacaoNfe,
  String? modeloDocf,
  String? chaveNfeVinc,
  int? numdocVinc,
  String? mobile,
  int? idVendaMob,
  String? chaveUnextern,
}) =>
    VendasRemReturnStruct(
      id: id,
      idCodigo: idCodigo,
      idCliente: idCliente,
      nomeCliente: nomeCliente,
      cpfcnpj: cpfcnpj,
      datavenda: datavenda,
      hora: hora,
      idVendedor: idVendedor,
      totalprodutos: totalprodutos,
      numeroitens: numeroitens,
      percDesc: percDesc,
      desconto: desconto,
      entrada: entrada,
      totalvenda: totalvenda,
      idFormapgto: idFormapgto,
      descrtpvenda: descrtpvenda,
      numparcelas: numparcelas,
      usuario: usuario,
      numterminal: numterminal,
      situacaoNfe: situacaoNfe,
      modeloDocf: modeloDocf,
      chaveNfeVinc: chaveNfeVinc,
      numdocVinc: numdocVinc,
      mobile: mobile,
      idVendaMob: idVendaMob,
      chaveUnextern: chaveUnextern,
    );
