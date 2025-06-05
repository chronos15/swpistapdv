// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendasStruct extends BaseStruct {
  VendasStruct({
    int? idCodigo,
    int? idCliente,
    String? datavenda,
    String? hora,
    int? idVendedor,
    double? percDesc,
    double? desconto,
    double? entrada,
    String? usuario,
    String? numterminal,
    String? situacaoNfe,
    int? modeloDocf,
    String? chaveNfeVinc,
    int? numdocVinc,
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
    String? endereco,
    String? complemento,
    String? bairro,
    String? cidade,
    String? uf,
    String? cep,
    int? codcid,
    String? codmunibge,
    List<PaymentDataTypeStruct>? pagamentos,
    String? descrtpvenda,
    int? tipovenda,
    int? idFormapgto,
    List<ListaAbastecimentoDataTypeStruct>? abastecimentos,
  })  : _idCodigo = idCodigo,
        _idCliente = idCliente,
        _datavenda = datavenda,
        _hora = hora,
        _idVendedor = idVendedor,
        _percDesc = percDesc,
        _desconto = desconto,
        _entrada = entrada,
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
        _cpfcnpj = cpfcnpj,
        _endereco = endereco,
        _complemento = complemento,
        _bairro = bairro,
        _cidade = cidade,
        _uf = uf,
        _cep = cep,
        _codcid = codcid,
        _codmunibge = codmunibge,
        _pagamentos = pagamentos,
        _descrtpvenda = descrtpvenda,
        _tipovenda = tipovenda,
        _idFormapgto = idFormapgto,
        _abastecimentos = abastecimentos;

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
  double? _percDesc;
  double get percDesc => _percDesc ?? 0.0;
  set percDesc(double? val) => _percDesc = val;

  void incrementPercDesc(double amount) => percDesc = percDesc + amount;

  bool hasPercDesc() => _percDesc != null;

  // "DESCONTO" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  set desconto(double? val) => _desconto = val;

  void incrementDesconto(double amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  // "ENTRADA" field.
  double? _entrada;
  double get entrada => _entrada ?? 0.0;
  set entrada(double? val) => _entrada = val;

  void incrementEntrada(double amount) => entrada = entrada + amount;

  bool hasEntrada() => _entrada != null;

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

  // "BAIRRO" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "CIDADE" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "UF" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  // "CEP" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "CODCID" field.
  int? _codcid;
  int get codcid => _codcid ?? 0;
  set codcid(int? val) => _codcid = val;

  void incrementCodcid(int amount) => codcid = codcid + amount;

  bool hasCodcid() => _codcid != null;

  // "CODMUNIBGE" field.
  String? _codmunibge;
  String get codmunibge => _codmunibge ?? '';
  set codmunibge(String? val) => _codmunibge = val;

  bool hasCodmunibge() => _codmunibge != null;

  // "PAGAMENTOS" field.
  List<PaymentDataTypeStruct>? _pagamentos;
  List<PaymentDataTypeStruct> get pagamentos => _pagamentos ?? const [];
  set pagamentos(List<PaymentDataTypeStruct>? val) => _pagamentos = val;

  void updatePagamentos(Function(List<PaymentDataTypeStruct>) updateFn) {
    updateFn(_pagamentos ??= []);
  }

  bool hasPagamentos() => _pagamentos != null;

  // "DESCRTPVENDA" field.
  String? _descrtpvenda;
  String get descrtpvenda => _descrtpvenda ?? '';
  set descrtpvenda(String? val) => _descrtpvenda = val;

  bool hasDescrtpvenda() => _descrtpvenda != null;

  // "TIPOVENDA" field.
  int? _tipovenda;
  int get tipovenda => _tipovenda ?? 0;
  set tipovenda(int? val) => _tipovenda = val;

  void incrementTipovenda(int amount) => tipovenda = tipovenda + amount;

  bool hasTipovenda() => _tipovenda != null;

  // "ID_FORMAPGTO" field.
  int? _idFormapgto;
  int get idFormapgto => _idFormapgto ?? 0;
  set idFormapgto(int? val) => _idFormapgto = val;

  void incrementIdFormapgto(int amount) => idFormapgto = idFormapgto + amount;

  bool hasIdFormapgto() => _idFormapgto != null;

  // "ABASTECIMENTOS" field.
  List<ListaAbastecimentoDataTypeStruct>? _abastecimentos;
  List<ListaAbastecimentoDataTypeStruct> get abastecimentos =>
      _abastecimentos ?? const [];
  set abastecimentos(List<ListaAbastecimentoDataTypeStruct>? val) =>
      _abastecimentos = val;

  void updateAbastecimentos(
      Function(List<ListaAbastecimentoDataTypeStruct>) updateFn) {
    updateFn(_abastecimentos ??= []);
  }

  bool hasAbastecimentos() => _abastecimentos != null;

  static VendasStruct fromMap(Map<String, dynamic> data) => VendasStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        idCliente: castToType<int>(data['ID_CLIENTE']),
        datavenda: data['DATAVENDA'] as String?,
        hora: data['HORA'] as String?,
        idVendedor: castToType<int>(data['ID_VENDEDOR']),
        percDesc: castToType<double>(data['PERC_DESC']),
        desconto: castToType<double>(data['DESCONTO']),
        entrada: castToType<double>(data['ENTRADA']),
        usuario: data['USUARIO'] as String?,
        numterminal: data['NUMTERMINAL'] as String?,
        situacaoNfe: data['SITUACAO_NFE'] as String?,
        modeloDocf: castToType<int>(data['MODELO_DOCF']),
        chaveNfeVinc: data['CHAVE_NFE_VINC'] as String?,
        numdocVinc: castToType<int>(data['NUMDOC_VINC']),
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
        endereco: data['ENDERECO'] as String?,
        complemento: data['COMPLEMENTO'] as String?,
        bairro: data['BAIRRO'] as String?,
        cidade: data['CIDADE'] as String?,
        uf: data['UF'] as String?,
        cep: data['CEP'] as String?,
        codcid: castToType<int>(data['CODCID']),
        codmunibge: data['CODMUNIBGE'] as String?,
        pagamentos: getStructList(
          data['PAGAMENTOS'],
          PaymentDataTypeStruct.fromMap,
        ),
        descrtpvenda: data['DESCRTPVENDA'] as String?,
        tipovenda: castToType<int>(data['TIPOVENDA']),
        idFormapgto: castToType<int>(data['ID_FORMAPGTO']),
        abastecimentos: getStructList(
          data['ABASTECIMENTOS'],
          ListaAbastecimentoDataTypeStruct.fromMap,
        ),
      );

  static VendasStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'ID_CLIENTE': _idCliente,
        'DATAVENDA': _datavenda,
        'HORA': _hora,
        'ID_VENDEDOR': _idVendedor,
        'PERC_DESC': _percDesc,
        'DESCONTO': _desconto,
        'ENTRADA': _entrada,
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
        'ENDERECO': _endereco,
        'COMPLEMENTO': _complemento,
        'BAIRRO': _bairro,
        'CIDADE': _cidade,
        'UF': _uf,
        'CEP': _cep,
        'CODCID': _codcid,
        'CODMUNIBGE': _codmunibge,
        'PAGAMENTOS': _pagamentos?.map((e) => e.toMap()).toList(),
        'DESCRTPVENDA': _descrtpvenda,
        'TIPOVENDA': _tipovenda,
        'ID_FORMAPGTO': _idFormapgto,
        'ABASTECIMENTOS': _abastecimentos?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
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
          ParamType.double,
        ),
        'DESCONTO': serializeParam(
          _desconto,
          ParamType.double,
        ),
        'ENTRADA': serializeParam(
          _entrada,
          ParamType.double,
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
          ParamType.int,
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
        'ENDERECO': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'COMPLEMENTO': serializeParam(
          _complemento,
          ParamType.String,
        ),
        'BAIRRO': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'CIDADE': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'UF': serializeParam(
          _uf,
          ParamType.String,
        ),
        'CEP': serializeParam(
          _cep,
          ParamType.String,
        ),
        'CODCID': serializeParam(
          _codcid,
          ParamType.int,
        ),
        'CODMUNIBGE': serializeParam(
          _codmunibge,
          ParamType.String,
        ),
        'PAGAMENTOS': serializeParam(
          _pagamentos,
          ParamType.DataStruct,
          isList: true,
        ),
        'DESCRTPVENDA': serializeParam(
          _descrtpvenda,
          ParamType.String,
        ),
        'TIPOVENDA': serializeParam(
          _tipovenda,
          ParamType.int,
        ),
        'ID_FORMAPGTO': serializeParam(
          _idFormapgto,
          ParamType.int,
        ),
        'ABASTECIMENTOS': serializeParam(
          _abastecimentos,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static VendasStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendasStruct(
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
          ParamType.double,
          false,
        ),
        desconto: deserializeParam(
          data['DESCONTO'],
          ParamType.double,
          false,
        ),
        entrada: deserializeParam(
          data['ENTRADA'],
          ParamType.double,
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
          ParamType.int,
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
        bairro: deserializeParam(
          data['BAIRRO'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['CIDADE'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['UF'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['CEP'],
          ParamType.String,
          false,
        ),
        codcid: deserializeParam(
          data['CODCID'],
          ParamType.int,
          false,
        ),
        codmunibge: deserializeParam(
          data['CODMUNIBGE'],
          ParamType.String,
          false,
        ),
        pagamentos: deserializeStructParam<PaymentDataTypeStruct>(
          data['PAGAMENTOS'],
          ParamType.DataStruct,
          true,
          structBuilder: PaymentDataTypeStruct.fromSerializableMap,
        ),
        descrtpvenda: deserializeParam(
          data['DESCRTPVENDA'],
          ParamType.String,
          false,
        ),
        tipovenda: deserializeParam(
          data['TIPOVENDA'],
          ParamType.int,
          false,
        ),
        idFormapgto: deserializeParam(
          data['ID_FORMAPGTO'],
          ParamType.int,
          false,
        ),
        abastecimentos:
            deserializeStructParam<ListaAbastecimentoDataTypeStruct>(
          data['ABASTECIMENTOS'],
          ParamType.DataStruct,
          true,
          structBuilder: ListaAbastecimentoDataTypeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VendasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VendasStruct &&
        idCodigo == other.idCodigo &&
        idCliente == other.idCliente &&
        datavenda == other.datavenda &&
        hora == other.hora &&
        idVendedor == other.idVendedor &&
        percDesc == other.percDesc &&
        desconto == other.desconto &&
        entrada == other.entrada &&
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
        cpfcnpj == other.cpfcnpj &&
        endereco == other.endereco &&
        complemento == other.complemento &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        uf == other.uf &&
        cep == other.cep &&
        codcid == other.codcid &&
        codmunibge == other.codmunibge &&
        listEquality.equals(pagamentos, other.pagamentos) &&
        descrtpvenda == other.descrtpvenda &&
        tipovenda == other.tipovenda &&
        idFormapgto == other.idFormapgto &&
        listEquality.equals(abastecimentos, other.abastecimentos);
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCodigo,
        idCliente,
        datavenda,
        hora,
        idVendedor,
        percDesc,
        desconto,
        entrada,
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
        cpfcnpj,
        endereco,
        complemento,
        bairro,
        cidade,
        uf,
        cep,
        codcid,
        codmunibge,
        pagamentos,
        descrtpvenda,
        tipovenda,
        idFormapgto,
        abastecimentos
      ]);
}

VendasStruct createVendasStruct({
  int? idCodigo,
  int? idCliente,
  String? datavenda,
  String? hora,
  int? idVendedor,
  double? percDesc,
  double? desconto,
  double? entrada,
  String? usuario,
  String? numterminal,
  String? situacaoNfe,
  int? modeloDocf,
  String? chaveNfeVinc,
  int? numdocVinc,
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
  String? endereco,
  String? complemento,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  int? codcid,
  String? codmunibge,
  String? descrtpvenda,
  int? tipovenda,
  int? idFormapgto,
}) =>
    VendasStruct(
      idCodigo: idCodigo,
      idCliente: idCliente,
      datavenda: datavenda,
      hora: hora,
      idVendedor: idVendedor,
      percDesc: percDesc,
      desconto: desconto,
      entrada: entrada,
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
      endereco: endereco,
      complemento: complemento,
      bairro: bairro,
      cidade: cidade,
      uf: uf,
      cep: cep,
      codcid: codcid,
      codmunibge: codmunibge,
      descrtpvenda: descrtpvenda,
      tipovenda: tipovenda,
      idFormapgto: idFormapgto,
    );
