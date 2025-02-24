// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaAbastecimentoDataTypeStruct extends BaseStruct {
  ListaAbastecimentoDataTypeStruct({
    int? codAbastecimento,
    int? idBico,
    String? combustivel,
    String? data,
    String? datahora,
    double? quantidade,
    double? precoUnit,
    double? vlrtotal,
    String? idIdentific,
    int? idFrentista,
    int? idCartao,
    String? frentista,
    int? idProduto,
    String? cor,
    String? cortexto,
    bool? bAsProduct,
    ProdutoDataTypeStruct? produtoDT,
    DateTime? dateDefault,
  })  : _codAbastecimento = codAbastecimento,
        _idBico = idBico,
        _combustivel = combustivel,
        _data = data,
        _datahora = datahora,
        _quantidade = quantidade,
        _precoUnit = precoUnit,
        _vlrtotal = vlrtotal,
        _idIdentific = idIdentific,
        _idFrentista = idFrentista,
        _idCartao = idCartao,
        _frentista = frentista,
        _idProduto = idProduto,
        _cor = cor,
        _cortexto = cortexto,
        _bAsProduct = bAsProduct,
        _produtoDT = produtoDT,
        _dateDefault = dateDefault;

  // "COD_ABASTECIMENTO" field.
  int? _codAbastecimento;
  int get codAbastecimento => _codAbastecimento ?? 0;
  set codAbastecimento(int? val) => _codAbastecimento = val;

  void incrementCodAbastecimento(int amount) =>
      codAbastecimento = codAbastecimento + amount;

  bool hasCodAbastecimento() => _codAbastecimento != null;

  // "ID_BICO" field.
  int? _idBico;
  int get idBico => _idBico ?? 0;
  set idBico(int? val) => _idBico = val;

  void incrementIdBico(int amount) => idBico = idBico + amount;

  bool hasIdBico() => _idBico != null;

  // "COMBUSTIVEL" field.
  String? _combustivel;
  String get combustivel => _combustivel ?? '';
  set combustivel(String? val) => _combustivel = val;

  bool hasCombustivel() => _combustivel != null;

  // "DATA" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "DATAHORA" field.
  String? _datahora;
  String get datahora => _datahora ?? '';
  set datahora(String? val) => _datahora = val;

  bool hasDatahora() => _datahora != null;

  // "QUANTIDADE" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  set quantidade(double? val) => _quantidade = val;

  void incrementQuantidade(double amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "PRECO_UNIT" field.
  double? _precoUnit;
  double get precoUnit => _precoUnit ?? 0.0;
  set precoUnit(double? val) => _precoUnit = val;

  void incrementPrecoUnit(double amount) => precoUnit = precoUnit + amount;

  bool hasPrecoUnit() => _precoUnit != null;

  // "VLRTOTAL" field.
  double? _vlrtotal;
  double get vlrtotal => _vlrtotal ?? 0.0;
  set vlrtotal(double? val) => _vlrtotal = val;

  void incrementVlrtotal(double amount) => vlrtotal = vlrtotal + amount;

  bool hasVlrtotal() => _vlrtotal != null;

  // "ID_IDENTIFIC" field.
  String? _idIdentific;
  String get idIdentific => _idIdentific ?? '';
  set idIdentific(String? val) => _idIdentific = val;

  bool hasIdIdentific() => _idIdentific != null;

  // "ID_FRENTISTA" field.
  int? _idFrentista;
  int get idFrentista => _idFrentista ?? 0;
  set idFrentista(int? val) => _idFrentista = val;

  void incrementIdFrentista(int amount) => idFrentista = idFrentista + amount;

  bool hasIdFrentista() => _idFrentista != null;

  // "ID_CARTAO" field.
  int? _idCartao;
  int get idCartao => _idCartao ?? 0;
  set idCartao(int? val) => _idCartao = val;

  void incrementIdCartao(int amount) => idCartao = idCartao + amount;

  bool hasIdCartao() => _idCartao != null;

  // "FRENTISTA" field.
  String? _frentista;
  String get frentista => _frentista ?? '';
  set frentista(String? val) => _frentista = val;

  bool hasFrentista() => _frentista != null;

  // "ID_PRODUTO" field.
  int? _idProduto;
  int get idProduto => _idProduto ?? 0;
  set idProduto(int? val) => _idProduto = val;

  void incrementIdProduto(int amount) => idProduto = idProduto + amount;

  bool hasIdProduto() => _idProduto != null;

  // "COR" field.
  String? _cor;
  String get cor => _cor ?? '';
  set cor(String? val) => _cor = val;

  bool hasCor() => _cor != null;

  // "CORTEXTO" field.
  String? _cortexto;
  String get cortexto => _cortexto ?? '';
  set cortexto(String? val) => _cortexto = val;

  bool hasCortexto() => _cortexto != null;

  // "bAsProduct" field.
  bool? _bAsProduct;
  bool get bAsProduct => _bAsProduct ?? false;
  set bAsProduct(bool? val) => _bAsProduct = val;

  bool hasBAsProduct() => _bAsProduct != null;

  // "ProdutoDT" field.
  ProdutoDataTypeStruct? _produtoDT;
  ProdutoDataTypeStruct get produtoDT => _produtoDT ?? ProdutoDataTypeStruct();
  set produtoDT(ProdutoDataTypeStruct? val) => _produtoDT = val;

  void updateProdutoDT(Function(ProdutoDataTypeStruct) updateFn) {
    updateFn(_produtoDT ??= ProdutoDataTypeStruct());
  }

  bool hasProdutoDT() => _produtoDT != null;

  // "DateDefault" field.
  DateTime? _dateDefault;
  DateTime? get dateDefault => _dateDefault;
  set dateDefault(DateTime? val) => _dateDefault = val;

  bool hasDateDefault() => _dateDefault != null;

  static ListaAbastecimentoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ListaAbastecimentoDataTypeStruct(
        codAbastecimento: castToType<int>(data['COD_ABASTECIMENTO']),
        idBico: castToType<int>(data['ID_BICO']),
        combustivel: data['COMBUSTIVEL'] as String?,
        data: data['DATA'] as String?,
        datahora: data['DATAHORA'] as String?,
        quantidade: castToType<double>(data['QUANTIDADE']),
        precoUnit: castToType<double>(data['PRECO_UNIT']),
        vlrtotal: castToType<double>(data['VLRTOTAL']),
        idIdentific: data['ID_IDENTIFIC'] as String?,
        idFrentista: castToType<int>(data['ID_FRENTISTA']),
        idCartao: castToType<int>(data['ID_CARTAO']),
        frentista: data['FRENTISTA'] as String?,
        idProduto: castToType<int>(data['ID_PRODUTO']),
        cor: data['COR'] as String?,
        cortexto: data['CORTEXTO'] as String?,
        bAsProduct: data['bAsProduct'] as bool?,
        produtoDT: data['ProdutoDT'] is ProdutoDataTypeStruct
            ? data['ProdutoDT']
            : ProdutoDataTypeStruct.maybeFromMap(data['ProdutoDT']),
        dateDefault: data['DateDefault'] as DateTime?,
      );

  static ListaAbastecimentoDataTypeStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ListaAbastecimentoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'COD_ABASTECIMENTO': _codAbastecimento,
        'ID_BICO': _idBico,
        'COMBUSTIVEL': _combustivel,
        'DATA': _data,
        'DATAHORA': _datahora,
        'QUANTIDADE': _quantidade,
        'PRECO_UNIT': _precoUnit,
        'VLRTOTAL': _vlrtotal,
        'ID_IDENTIFIC': _idIdentific,
        'ID_FRENTISTA': _idFrentista,
        'ID_CARTAO': _idCartao,
        'FRENTISTA': _frentista,
        'ID_PRODUTO': _idProduto,
        'COR': _cor,
        'CORTEXTO': _cortexto,
        'bAsProduct': _bAsProduct,
        'ProdutoDT': _produtoDT?.toMap(),
        'DateDefault': _dateDefault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'COD_ABASTECIMENTO': serializeParam(
          _codAbastecimento,
          ParamType.int,
        ),
        'ID_BICO': serializeParam(
          _idBico,
          ParamType.int,
        ),
        'COMBUSTIVEL': serializeParam(
          _combustivel,
          ParamType.String,
        ),
        'DATA': serializeParam(
          _data,
          ParamType.String,
        ),
        'DATAHORA': serializeParam(
          _datahora,
          ParamType.String,
        ),
        'QUANTIDADE': serializeParam(
          _quantidade,
          ParamType.double,
        ),
        'PRECO_UNIT': serializeParam(
          _precoUnit,
          ParamType.double,
        ),
        'VLRTOTAL': serializeParam(
          _vlrtotal,
          ParamType.double,
        ),
        'ID_IDENTIFIC': serializeParam(
          _idIdentific,
          ParamType.String,
        ),
        'ID_FRENTISTA': serializeParam(
          _idFrentista,
          ParamType.int,
        ),
        'ID_CARTAO': serializeParam(
          _idCartao,
          ParamType.int,
        ),
        'FRENTISTA': serializeParam(
          _frentista,
          ParamType.String,
        ),
        'ID_PRODUTO': serializeParam(
          _idProduto,
          ParamType.int,
        ),
        'COR': serializeParam(
          _cor,
          ParamType.String,
        ),
        'CORTEXTO': serializeParam(
          _cortexto,
          ParamType.String,
        ),
        'bAsProduct': serializeParam(
          _bAsProduct,
          ParamType.bool,
        ),
        'ProdutoDT': serializeParam(
          _produtoDT,
          ParamType.DataStruct,
        ),
        'DateDefault': serializeParam(
          _dateDefault,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ListaAbastecimentoDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListaAbastecimentoDataTypeStruct(
        codAbastecimento: deserializeParam(
          data['COD_ABASTECIMENTO'],
          ParamType.int,
          false,
        ),
        idBico: deserializeParam(
          data['ID_BICO'],
          ParamType.int,
          false,
        ),
        combustivel: deserializeParam(
          data['COMBUSTIVEL'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['DATA'],
          ParamType.String,
          false,
        ),
        datahora: deserializeParam(
          data['DATAHORA'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['QUANTIDADE'],
          ParamType.double,
          false,
        ),
        precoUnit: deserializeParam(
          data['PRECO_UNIT'],
          ParamType.double,
          false,
        ),
        vlrtotal: deserializeParam(
          data['VLRTOTAL'],
          ParamType.double,
          false,
        ),
        idIdentific: deserializeParam(
          data['ID_IDENTIFIC'],
          ParamType.String,
          false,
        ),
        idFrentista: deserializeParam(
          data['ID_FRENTISTA'],
          ParamType.int,
          false,
        ),
        idCartao: deserializeParam(
          data['ID_CARTAO'],
          ParamType.int,
          false,
        ),
        frentista: deserializeParam(
          data['FRENTISTA'],
          ParamType.String,
          false,
        ),
        idProduto: deserializeParam(
          data['ID_PRODUTO'],
          ParamType.int,
          false,
        ),
        cor: deserializeParam(
          data['COR'],
          ParamType.String,
          false,
        ),
        cortexto: deserializeParam(
          data['CORTEXTO'],
          ParamType.String,
          false,
        ),
        bAsProduct: deserializeParam(
          data['bAsProduct'],
          ParamType.bool,
          false,
        ),
        produtoDT: deserializeStructParam(
          data['ProdutoDT'],
          ParamType.DataStruct,
          false,
          structBuilder: ProdutoDataTypeStruct.fromSerializableMap,
        ),
        dateDefault: deserializeParam(
          data['DateDefault'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ListaAbastecimentoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListaAbastecimentoDataTypeStruct &&
        codAbastecimento == other.codAbastecimento &&
        idBico == other.idBico &&
        combustivel == other.combustivel &&
        data == other.data &&
        datahora == other.datahora &&
        quantidade == other.quantidade &&
        precoUnit == other.precoUnit &&
        vlrtotal == other.vlrtotal &&
        idIdentific == other.idIdentific &&
        idFrentista == other.idFrentista &&
        idCartao == other.idCartao &&
        frentista == other.frentista &&
        idProduto == other.idProduto &&
        cor == other.cor &&
        cortexto == other.cortexto &&
        bAsProduct == other.bAsProduct &&
        produtoDT == other.produtoDT &&
        dateDefault == other.dateDefault;
  }

  @override
  int get hashCode => const ListEquality().hash([
        codAbastecimento,
        idBico,
        combustivel,
        data,
        datahora,
        quantidade,
        precoUnit,
        vlrtotal,
        idIdentific,
        idFrentista,
        idCartao,
        frentista,
        idProduto,
        cor,
        cortexto,
        bAsProduct,
        produtoDT,
        dateDefault
      ]);
}

ListaAbastecimentoDataTypeStruct createListaAbastecimentoDataTypeStruct({
  int? codAbastecimento,
  int? idBico,
  String? combustivel,
  String? data,
  String? datahora,
  double? quantidade,
  double? precoUnit,
  double? vlrtotal,
  String? idIdentific,
  int? idFrentista,
  int? idCartao,
  String? frentista,
  int? idProduto,
  String? cor,
  String? cortexto,
  bool? bAsProduct,
  ProdutoDataTypeStruct? produtoDT,
  DateTime? dateDefault,
}) =>
    ListaAbastecimentoDataTypeStruct(
      codAbastecimento: codAbastecimento,
      idBico: idBico,
      combustivel: combustivel,
      data: data,
      datahora: datahora,
      quantidade: quantidade,
      precoUnit: precoUnit,
      vlrtotal: vlrtotal,
      idIdentific: idIdentific,
      idFrentista: idFrentista,
      idCartao: idCartao,
      frentista: frentista,
      idProduto: idProduto,
      cor: cor,
      cortexto: cortexto,
      bAsProduct: bAsProduct,
      produtoDT: produtoDT ?? ProdutoDataTypeStruct(),
      dateDefault: dateDefault,
    );
