// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendaitemStruct extends BaseStruct {
  VendaitemStruct({
    int? idCliente,
    int? idProduto,
    String? nomeProduto,
    int? idVendedor,
    String? numref,
    double? estoqueatual,
    double? qtdTroca,
    double? valorvenda,
    double? valorvendido,
    double? subtotal,
    String? unidademed,
    double? percdesc,
    String? datavenda,
    String? usuario,
    double? valordesc,
    String? mobile,
    int? idAbastecimento,
    String? fotoUrl,
    double? quantidade,
  })  : _idCliente = idCliente,
        _idProduto = idProduto,
        _nomeProduto = nomeProduto,
        _idVendedor = idVendedor,
        _numref = numref,
        _estoqueatual = estoqueatual,
        _qtdTroca = qtdTroca,
        _valorvenda = valorvenda,
        _valorvendido = valorvendido,
        _subtotal = subtotal,
        _unidademed = unidademed,
        _percdesc = percdesc,
        _datavenda = datavenda,
        _usuario = usuario,
        _valordesc = valordesc,
        _mobile = mobile,
        _idAbastecimento = idAbastecimento,
        _fotoUrl = fotoUrl,
        _quantidade = quantidade;

  // "ID_CLIENTE" field.
  int? _idCliente;
  int get idCliente => _idCliente ?? 0;
  set idCliente(int? val) => _idCliente = val;

  void incrementIdCliente(int amount) => idCliente = idCliente + amount;

  bool hasIdCliente() => _idCliente != null;

  // "ID_PRODUTO" field.
  int? _idProduto;
  int get idProduto => _idProduto ?? 0;
  set idProduto(int? val) => _idProduto = val;

  void incrementIdProduto(int amount) => idProduto = idProduto + amount;

  bool hasIdProduto() => _idProduto != null;

  // "NOME_PRODUTO" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;

  bool hasNomeProduto() => _nomeProduto != null;

  // "ID_VENDEDOR" field.
  int? _idVendedor;
  int get idVendedor => _idVendedor ?? 0;
  set idVendedor(int? val) => _idVendedor = val;

  void incrementIdVendedor(int amount) => idVendedor = idVendedor + amount;

  bool hasIdVendedor() => _idVendedor != null;

  // "NUMREF" field.
  String? _numref;
  String get numref => _numref ?? '';
  set numref(String? val) => _numref = val;

  bool hasNumref() => _numref != null;

  // "ESTOQUEATUAL" field.
  double? _estoqueatual;
  double get estoqueatual => _estoqueatual ?? 0.0;
  set estoqueatual(double? val) => _estoqueatual = val;

  void incrementEstoqueatual(double amount) =>
      estoqueatual = estoqueatual + amount;

  bool hasEstoqueatual() => _estoqueatual != null;

  // "QTD_TROCA" field.
  double? _qtdTroca;
  double get qtdTroca => _qtdTroca ?? 0.0;
  set qtdTroca(double? val) => _qtdTroca = val;

  void incrementQtdTroca(double amount) => qtdTroca = qtdTroca + amount;

  bool hasQtdTroca() => _qtdTroca != null;

  // "VALORVENDA" field.
  double? _valorvenda;
  double get valorvenda => _valorvenda ?? 0.0;
  set valorvenda(double? val) => _valorvenda = val;

  void incrementValorvenda(double amount) => valorvenda = valorvenda + amount;

  bool hasValorvenda() => _valorvenda != null;

  // "VALORVENDIDO" field.
  double? _valorvendido;
  double get valorvendido => _valorvendido ?? 0.0;
  set valorvendido(double? val) => _valorvendido = val;

  void incrementValorvendido(double amount) =>
      valorvendido = valorvendido + amount;

  bool hasValorvendido() => _valorvendido != null;

  // "SUBTOTAL" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  set subtotal(double? val) => _subtotal = val;

  void incrementSubtotal(double amount) => subtotal = subtotal + amount;

  bool hasSubtotal() => _subtotal != null;

  // "UNIDADEMED" field.
  String? _unidademed;
  String get unidademed => _unidademed ?? '';
  set unidademed(String? val) => _unidademed = val;

  bool hasUnidademed() => _unidademed != null;

  // "PERCDESC" field.
  double? _percdesc;
  double get percdesc => _percdesc ?? 0.0;
  set percdesc(double? val) => _percdesc = val;

  void incrementPercdesc(double amount) => percdesc = percdesc + amount;

  bool hasPercdesc() => _percdesc != null;

  // "DATAVENDA" field.
  String? _datavenda;
  String get datavenda => _datavenda ?? '';
  set datavenda(String? val) => _datavenda = val;

  bool hasDatavenda() => _datavenda != null;

  // "USUARIO" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "VALORDESC" field.
  double? _valordesc;
  double get valordesc => _valordesc ?? 0.0;
  set valordesc(double? val) => _valordesc = val;

  void incrementValordesc(double amount) => valordesc = valordesc + amount;

  bool hasValordesc() => _valordesc != null;

  // "MOBILE" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  // "ID_ABASTECIMENTO" field.
  int? _idAbastecimento;
  int get idAbastecimento => _idAbastecimento ?? 0;
  set idAbastecimento(int? val) => _idAbastecimento = val;

  void incrementIdAbastecimento(int amount) =>
      idAbastecimento = idAbastecimento + amount;

  bool hasIdAbastecimento() => _idAbastecimento != null;

  // "FOTO_URL" field.
  String? _fotoUrl;
  String get fotoUrl => _fotoUrl ?? '';
  set fotoUrl(String? val) => _fotoUrl = val;

  bool hasFotoUrl() => _fotoUrl != null;

  // "QUANTIDADE" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  set quantidade(double? val) => _quantidade = val;

  void incrementQuantidade(double amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  static VendaitemStruct fromMap(Map<String, dynamic> data) => VendaitemStruct(
        idCliente: castToType<int>(data['ID_CLIENTE']),
        idProduto: castToType<int>(data['ID_PRODUTO']),
        nomeProduto: data['NOME_PRODUTO'] as String?,
        idVendedor: castToType<int>(data['ID_VENDEDOR']),
        numref: data['NUMREF'] as String?,
        estoqueatual: castToType<double>(data['ESTOQUEATUAL']),
        qtdTroca: castToType<double>(data['QTD_TROCA']),
        valorvenda: castToType<double>(data['VALORVENDA']),
        valorvendido: castToType<double>(data['VALORVENDIDO']),
        subtotal: castToType<double>(data['SUBTOTAL']),
        unidademed: data['UNIDADEMED'] as String?,
        percdesc: castToType<double>(data['PERCDESC']),
        datavenda: data['DATAVENDA'] as String?,
        usuario: data['USUARIO'] as String?,
        valordesc: castToType<double>(data['VALORDESC']),
        mobile: data['MOBILE'] as String?,
        idAbastecimento: castToType<int>(data['ID_ABASTECIMENTO']),
        fotoUrl: data['FOTO_URL'] as String?,
        quantidade: castToType<double>(data['QUANTIDADE']),
      );

  static VendaitemStruct? maybeFromMap(dynamic data) => data is Map
      ? VendaitemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CLIENTE': _idCliente,
        'ID_PRODUTO': _idProduto,
        'NOME_PRODUTO': _nomeProduto,
        'ID_VENDEDOR': _idVendedor,
        'NUMREF': _numref,
        'ESTOQUEATUAL': _estoqueatual,
        'QTD_TROCA': _qtdTroca,
        'VALORVENDA': _valorvenda,
        'VALORVENDIDO': _valorvendido,
        'SUBTOTAL': _subtotal,
        'UNIDADEMED': _unidademed,
        'PERCDESC': _percdesc,
        'DATAVENDA': _datavenda,
        'USUARIO': _usuario,
        'VALORDESC': _valordesc,
        'MOBILE': _mobile,
        'ID_ABASTECIMENTO': _idAbastecimento,
        'FOTO_URL': _fotoUrl,
        'QUANTIDADE': _quantidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CLIENTE': serializeParam(
          _idCliente,
          ParamType.int,
        ),
        'ID_PRODUTO': serializeParam(
          _idProduto,
          ParamType.int,
        ),
        'NOME_PRODUTO': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'ID_VENDEDOR': serializeParam(
          _idVendedor,
          ParamType.int,
        ),
        'NUMREF': serializeParam(
          _numref,
          ParamType.String,
        ),
        'ESTOQUEATUAL': serializeParam(
          _estoqueatual,
          ParamType.double,
        ),
        'QTD_TROCA': serializeParam(
          _qtdTroca,
          ParamType.double,
        ),
        'VALORVENDA': serializeParam(
          _valorvenda,
          ParamType.double,
        ),
        'VALORVENDIDO': serializeParam(
          _valorvendido,
          ParamType.double,
        ),
        'SUBTOTAL': serializeParam(
          _subtotal,
          ParamType.double,
        ),
        'UNIDADEMED': serializeParam(
          _unidademed,
          ParamType.String,
        ),
        'PERCDESC': serializeParam(
          _percdesc,
          ParamType.double,
        ),
        'DATAVENDA': serializeParam(
          _datavenda,
          ParamType.String,
        ),
        'USUARIO': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'VALORDESC': serializeParam(
          _valordesc,
          ParamType.double,
        ),
        'MOBILE': serializeParam(
          _mobile,
          ParamType.String,
        ),
        'ID_ABASTECIMENTO': serializeParam(
          _idAbastecimento,
          ParamType.int,
        ),
        'FOTO_URL': serializeParam(
          _fotoUrl,
          ParamType.String,
        ),
        'QUANTIDADE': serializeParam(
          _quantidade,
          ParamType.double,
        ),
      }.withoutNulls;

  static VendaitemStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendaitemStruct(
        idCliente: deserializeParam(
          data['ID_CLIENTE'],
          ParamType.int,
          false,
        ),
        idProduto: deserializeParam(
          data['ID_PRODUTO'],
          ParamType.int,
          false,
        ),
        nomeProduto: deserializeParam(
          data['NOME_PRODUTO'],
          ParamType.String,
          false,
        ),
        idVendedor: deserializeParam(
          data['ID_VENDEDOR'],
          ParamType.int,
          false,
        ),
        numref: deserializeParam(
          data['NUMREF'],
          ParamType.String,
          false,
        ),
        estoqueatual: deserializeParam(
          data['ESTOQUEATUAL'],
          ParamType.double,
          false,
        ),
        qtdTroca: deserializeParam(
          data['QTD_TROCA'],
          ParamType.double,
          false,
        ),
        valorvenda: deserializeParam(
          data['VALORVENDA'],
          ParamType.double,
          false,
        ),
        valorvendido: deserializeParam(
          data['VALORVENDIDO'],
          ParamType.double,
          false,
        ),
        subtotal: deserializeParam(
          data['SUBTOTAL'],
          ParamType.double,
          false,
        ),
        unidademed: deserializeParam(
          data['UNIDADEMED'],
          ParamType.String,
          false,
        ),
        percdesc: deserializeParam(
          data['PERCDESC'],
          ParamType.double,
          false,
        ),
        datavenda: deserializeParam(
          data['DATAVENDA'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['USUARIO'],
          ParamType.String,
          false,
        ),
        valordesc: deserializeParam(
          data['VALORDESC'],
          ParamType.double,
          false,
        ),
        mobile: deserializeParam(
          data['MOBILE'],
          ParamType.String,
          false,
        ),
        idAbastecimento: deserializeParam(
          data['ID_ABASTECIMENTO'],
          ParamType.int,
          false,
        ),
        fotoUrl: deserializeParam(
          data['FOTO_URL'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['QUANTIDADE'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'VendaitemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendaitemStruct &&
        idCliente == other.idCliente &&
        idProduto == other.idProduto &&
        nomeProduto == other.nomeProduto &&
        idVendedor == other.idVendedor &&
        numref == other.numref &&
        estoqueatual == other.estoqueatual &&
        qtdTroca == other.qtdTroca &&
        valorvenda == other.valorvenda &&
        valorvendido == other.valorvendido &&
        subtotal == other.subtotal &&
        unidademed == other.unidademed &&
        percdesc == other.percdesc &&
        datavenda == other.datavenda &&
        usuario == other.usuario &&
        valordesc == other.valordesc &&
        mobile == other.mobile &&
        idAbastecimento == other.idAbastecimento &&
        fotoUrl == other.fotoUrl &&
        quantidade == other.quantidade;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCliente,
        idProduto,
        nomeProduto,
        idVendedor,
        numref,
        estoqueatual,
        qtdTroca,
        valorvenda,
        valorvendido,
        subtotal,
        unidademed,
        percdesc,
        datavenda,
        usuario,
        valordesc,
        mobile,
        idAbastecimento,
        fotoUrl,
        quantidade
      ]);
}

VendaitemStruct createVendaitemStruct({
  int? idCliente,
  int? idProduto,
  String? nomeProduto,
  int? idVendedor,
  String? numref,
  double? estoqueatual,
  double? qtdTroca,
  double? valorvenda,
  double? valorvendido,
  double? subtotal,
  String? unidademed,
  double? percdesc,
  String? datavenda,
  String? usuario,
  double? valordesc,
  String? mobile,
  int? idAbastecimento,
  String? fotoUrl,
  double? quantidade,
}) =>
    VendaitemStruct(
      idCliente: idCliente,
      idProduto: idProduto,
      nomeProduto: nomeProduto,
      idVendedor: idVendedor,
      numref: numref,
      estoqueatual: estoqueatual,
      qtdTroca: qtdTroca,
      valorvenda: valorvenda,
      valorvendido: valorvendido,
      subtotal: subtotal,
      unidademed: unidademed,
      percdesc: percdesc,
      datavenda: datavenda,
      usuario: usuario,
      valordesc: valordesc,
      mobile: mobile,
      idAbastecimento: idAbastecimento,
      fotoUrl: fotoUrl,
      quantidade: quantidade,
    );
