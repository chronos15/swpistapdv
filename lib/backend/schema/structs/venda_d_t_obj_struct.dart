// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendaDTObjStruct extends BaseStruct {
  VendaDTObjStruct({
    int? idcliente,
    String? nomecliente,
    String? cpfcnpj,
    int? idvendedor,
    double? totalprodutos,
    int? perdesc,
    double? desconto,
    String? usuario,
    String? numterminal,
    int? chaveunica,
    String? endereco,
    String? complemento,
    String? bairro,
    String? cidade,
    String? uf,
    String? cep,
    int? codcid,
    String? codibge,
    List<ListaAddAbastecimentoDataTypeStruct>? abastecimentos,
    List<DadosTEFStruct>? pagamentos,
    int? idvendamob,
  })  : _idcliente = idcliente,
        _nomecliente = nomecliente,
        _cpfcnpj = cpfcnpj,
        _idvendedor = idvendedor,
        _totalprodutos = totalprodutos,
        _perdesc = perdesc,
        _desconto = desconto,
        _usuario = usuario,
        _numterminal = numterminal,
        _chaveunica = chaveunica,
        _endereco = endereco,
        _complemento = complemento,
        _bairro = bairro,
        _cidade = cidade,
        _uf = uf,
        _cep = cep,
        _codcid = codcid,
        _codibge = codibge,
        _abastecimentos = abastecimentos,
        _pagamentos = pagamentos,
        _idvendamob = idvendamob;

  // "idcliente" field.
  int? _idcliente;
  int get idcliente => _idcliente ?? 0;
  set idcliente(int? val) => _idcliente = val;

  void incrementIdcliente(int amount) => idcliente = idcliente + amount;

  bool hasIdcliente() => _idcliente != null;

  // "nomecliente" field.
  String? _nomecliente;
  String get nomecliente => _nomecliente ?? '';
  set nomecliente(String? val) => _nomecliente = val;

  bool hasNomecliente() => _nomecliente != null;

  // "cpfcnpj" field.
  String? _cpfcnpj;
  String get cpfcnpj => _cpfcnpj ?? '';
  set cpfcnpj(String? val) => _cpfcnpj = val;

  bool hasCpfcnpj() => _cpfcnpj != null;

  // "idvendedor" field.
  int? _idvendedor;
  int get idvendedor => _idvendedor ?? 0;
  set idvendedor(int? val) => _idvendedor = val;

  void incrementIdvendedor(int amount) => idvendedor = idvendedor + amount;

  bool hasIdvendedor() => _idvendedor != null;

  // "totalprodutos" field.
  double? _totalprodutos;
  double get totalprodutos => _totalprodutos ?? 0.0;
  set totalprodutos(double? val) => _totalprodutos = val;

  void incrementTotalprodutos(double amount) =>
      totalprodutos = totalprodutos + amount;

  bool hasTotalprodutos() => _totalprodutos != null;

  // "perdesc" field.
  int? _perdesc;
  int get perdesc => _perdesc ?? 0;
  set perdesc(int? val) => _perdesc = val;

  void incrementPerdesc(int amount) => perdesc = perdesc + amount;

  bool hasPerdesc() => _perdesc != null;

  // "desconto" field.
  double? _desconto;
  double get desconto => _desconto ?? 0.0;
  set desconto(double? val) => _desconto = val;

  void incrementDesconto(double amount) => desconto = desconto + amount;

  bool hasDesconto() => _desconto != null;

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "numterminal" field.
  String? _numterminal;
  String get numterminal => _numterminal ?? '';
  set numterminal(String? val) => _numterminal = val;

  bool hasNumterminal() => _numterminal != null;

  // "chaveunica" field.
  int? _chaveunica;
  int get chaveunica => _chaveunica ?? 0;
  set chaveunica(int? val) => _chaveunica = val;

  void incrementChaveunica(int amount) => chaveunica = chaveunica + amount;

  bool hasChaveunica() => _chaveunica != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "complemento" field.
  String? _complemento;
  String get complemento => _complemento ?? '';
  set complemento(String? val) => _complemento = val;

  bool hasComplemento() => _complemento != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "codcid" field.
  int? _codcid;
  int get codcid => _codcid ?? 0;
  set codcid(int? val) => _codcid = val;

  void incrementCodcid(int amount) => codcid = codcid + amount;

  bool hasCodcid() => _codcid != null;

  // "codibge" field.
  String? _codibge;
  String get codibge => _codibge ?? '';
  set codibge(String? val) => _codibge = val;

  bool hasCodibge() => _codibge != null;

  // "abastecimentos" field.
  List<ListaAddAbastecimentoDataTypeStruct>? _abastecimentos;
  List<ListaAddAbastecimentoDataTypeStruct> get abastecimentos =>
      _abastecimentos ?? const [];
  set abastecimentos(List<ListaAddAbastecimentoDataTypeStruct>? val) =>
      _abastecimentos = val;

  void updateAbastecimentos(
      Function(List<ListaAddAbastecimentoDataTypeStruct>) updateFn) {
    updateFn(_abastecimentos ??= []);
  }

  bool hasAbastecimentos() => _abastecimentos != null;

  // "pagamentos" field.
  List<DadosTEFStruct>? _pagamentos;
  List<DadosTEFStruct> get pagamentos => _pagamentos ?? const [];
  set pagamentos(List<DadosTEFStruct>? val) => _pagamentos = val;

  void updatePagamentos(Function(List<DadosTEFStruct>) updateFn) {
    updateFn(_pagamentos ??= []);
  }

  bool hasPagamentos() => _pagamentos != null;

  // "idvendamob" field.
  int? _idvendamob;
  int get idvendamob => _idvendamob ?? 0;
  set idvendamob(int? val) => _idvendamob = val;

  void incrementIdvendamob(int amount) => idvendamob = idvendamob + amount;

  bool hasIdvendamob() => _idvendamob != null;

  static VendaDTObjStruct fromMap(Map<String, dynamic> data) =>
      VendaDTObjStruct(
        idcliente: castToType<int>(data['idcliente']),
        nomecliente: data['nomecliente'] as String?,
        cpfcnpj: data['cpfcnpj'] as String?,
        idvendedor: castToType<int>(data['idvendedor']),
        totalprodutos: castToType<double>(data['totalprodutos']),
        perdesc: castToType<int>(data['perdesc']),
        desconto: castToType<double>(data['desconto']),
        usuario: data['usuario'] as String?,
        numterminal: data['numterminal'] as String?,
        chaveunica: castToType<int>(data['chaveunica']),
        endereco: data['endereco'] as String?,
        complemento: data['complemento'] as String?,
        bairro: data['bairro'] as String?,
        cidade: data['cidade'] as String?,
        uf: data['uf'] as String?,
        cep: data['cep'] as String?,
        codcid: castToType<int>(data['codcid']),
        codibge: data['codibge'] as String?,
        abastecimentos: getStructList(
          data['abastecimentos'],
          ListaAddAbastecimentoDataTypeStruct.fromMap,
        ),
        pagamentos: getStructList(
          data['pagamentos'],
          DadosTEFStruct.fromMap,
        ),
        idvendamob: castToType<int>(data['idvendamob']),
      );

  static VendaDTObjStruct? maybeFromMap(dynamic data) => data is Map
      ? VendaDTObjStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idcliente': _idcliente,
        'nomecliente': _nomecliente,
        'cpfcnpj': _cpfcnpj,
        'idvendedor': _idvendedor,
        'totalprodutos': _totalprodutos,
        'perdesc': _perdesc,
        'desconto': _desconto,
        'usuario': _usuario,
        'numterminal': _numterminal,
        'chaveunica': _chaveunica,
        'endereco': _endereco,
        'complemento': _complemento,
        'bairro': _bairro,
        'cidade': _cidade,
        'uf': _uf,
        'cep': _cep,
        'codcid': _codcid,
        'codibge': _codibge,
        'abastecimentos': _abastecimentos?.map((e) => e.toMap()).toList(),
        'pagamentos': _pagamentos?.map((e) => e.toMap()).toList(),
        'idvendamob': _idvendamob,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idcliente': serializeParam(
          _idcliente,
          ParamType.int,
        ),
        'nomecliente': serializeParam(
          _nomecliente,
          ParamType.String,
        ),
        'cpfcnpj': serializeParam(
          _cpfcnpj,
          ParamType.String,
        ),
        'idvendedor': serializeParam(
          _idvendedor,
          ParamType.int,
        ),
        'totalprodutos': serializeParam(
          _totalprodutos,
          ParamType.double,
        ),
        'perdesc': serializeParam(
          _perdesc,
          ParamType.int,
        ),
        'desconto': serializeParam(
          _desconto,
          ParamType.double,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'numterminal': serializeParam(
          _numterminal,
          ParamType.String,
        ),
        'chaveunica': serializeParam(
          _chaveunica,
          ParamType.int,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'complemento': serializeParam(
          _complemento,
          ParamType.String,
        ),
        'bairro': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'uf': serializeParam(
          _uf,
          ParamType.String,
        ),
        'cep': serializeParam(
          _cep,
          ParamType.String,
        ),
        'codcid': serializeParam(
          _codcid,
          ParamType.int,
        ),
        'codibge': serializeParam(
          _codibge,
          ParamType.String,
        ),
        'abastecimentos': serializeParam(
          _abastecimentos,
          ParamType.DataStruct,
          isList: true,
        ),
        'pagamentos': serializeParam(
          _pagamentos,
          ParamType.DataStruct,
          isList: true,
        ),
        'idvendamob': serializeParam(
          _idvendamob,
          ParamType.int,
        ),
      }.withoutNulls;

  static VendaDTObjStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendaDTObjStruct(
        idcliente: deserializeParam(
          data['idcliente'],
          ParamType.int,
          false,
        ),
        nomecliente: deserializeParam(
          data['nomecliente'],
          ParamType.String,
          false,
        ),
        cpfcnpj: deserializeParam(
          data['cpfcnpj'],
          ParamType.String,
          false,
        ),
        idvendedor: deserializeParam(
          data['idvendedor'],
          ParamType.int,
          false,
        ),
        totalprodutos: deserializeParam(
          data['totalprodutos'],
          ParamType.double,
          false,
        ),
        perdesc: deserializeParam(
          data['perdesc'],
          ParamType.int,
          false,
        ),
        desconto: deserializeParam(
          data['desconto'],
          ParamType.double,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.String,
          false,
        ),
        numterminal: deserializeParam(
          data['numterminal'],
          ParamType.String,
          false,
        ),
        chaveunica: deserializeParam(
          data['chaveunica'],
          ParamType.int,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        complemento: deserializeParam(
          data['complemento'],
          ParamType.String,
          false,
        ),
        bairro: deserializeParam(
          data['bairro'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['uf'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['cep'],
          ParamType.String,
          false,
        ),
        codcid: deserializeParam(
          data['codcid'],
          ParamType.int,
          false,
        ),
        codibge: deserializeParam(
          data['codibge'],
          ParamType.String,
          false,
        ),
        abastecimentos:
            deserializeStructParam<ListaAddAbastecimentoDataTypeStruct>(
          data['abastecimentos'],
          ParamType.DataStruct,
          true,
          structBuilder:
              ListaAddAbastecimentoDataTypeStruct.fromSerializableMap,
        ),
        pagamentos: deserializeStructParam<DadosTEFStruct>(
          data['pagamentos'],
          ParamType.DataStruct,
          true,
          structBuilder: DadosTEFStruct.fromSerializableMap,
        ),
        idvendamob: deserializeParam(
          data['idvendamob'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VendaDTObjStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VendaDTObjStruct &&
        idcliente == other.idcliente &&
        nomecliente == other.nomecliente &&
        cpfcnpj == other.cpfcnpj &&
        idvendedor == other.idvendedor &&
        totalprodutos == other.totalprodutos &&
        perdesc == other.perdesc &&
        desconto == other.desconto &&
        usuario == other.usuario &&
        numterminal == other.numterminal &&
        chaveunica == other.chaveunica &&
        endereco == other.endereco &&
        complemento == other.complemento &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        uf == other.uf &&
        cep == other.cep &&
        codcid == other.codcid &&
        codibge == other.codibge &&
        listEquality.equals(abastecimentos, other.abastecimentos) &&
        listEquality.equals(pagamentos, other.pagamentos) &&
        idvendamob == other.idvendamob;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idcliente,
        nomecliente,
        cpfcnpj,
        idvendedor,
        totalprodutos,
        perdesc,
        desconto,
        usuario,
        numterminal,
        chaveunica,
        endereco,
        complemento,
        bairro,
        cidade,
        uf,
        cep,
        codcid,
        codibge,
        abastecimentos,
        pagamentos,
        idvendamob
      ]);
}

VendaDTObjStruct createVendaDTObjStruct({
  int? idcliente,
  String? nomecliente,
  String? cpfcnpj,
  int? idvendedor,
  double? totalprodutos,
  int? perdesc,
  double? desconto,
  String? usuario,
  String? numterminal,
  int? chaveunica,
  String? endereco,
  String? complemento,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  int? codcid,
  String? codibge,
  int? idvendamob,
}) =>
    VendaDTObjStruct(
      idcliente: idcliente,
      nomecliente: nomecliente,
      cpfcnpj: cpfcnpj,
      idvendedor: idvendedor,
      totalprodutos: totalprodutos,
      perdesc: perdesc,
      desconto: desconto,
      usuario: usuario,
      numterminal: numterminal,
      chaveunica: chaveunica,
      endereco: endereco,
      complemento: complemento,
      bairro: bairro,
      cidade: cidade,
      uf: uf,
      cep: cep,
      codcid: codcid,
      codibge: codibge,
      idvendamob: idvendamob,
    );
