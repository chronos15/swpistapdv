// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListaAddAbastecimentoDataTypeStruct extends BaseStruct {
  ListaAddAbastecimentoDataTypeStruct({
    int? idCodigo,
    String? dataenvio,
    String? horaenvio,
    String? numid,
    String? datetime,
    int? numseqitem,
    String? modo,
    String? regtipo,
    int? idloja,
    String? idfrentista,
    String? cartao,
    double? quantidade,
    double? valor,
    double? total,
    int? idvenda,
  })  : _idCodigo = idCodigo,
        _dataenvio = dataenvio,
        _horaenvio = horaenvio,
        _numid = numid,
        _datetime = datetime,
        _numseqitem = numseqitem,
        _modo = modo,
        _regtipo = regtipo,
        _idloja = idloja,
        _idfrentista = idfrentista,
        _cartao = cartao,
        _quantidade = quantidade,
        _valor = valor,
        _total = total,
        _idvenda = idvenda;

  // "id_codigo" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "dataenvio" field.
  String? _dataenvio;
  String get dataenvio => _dataenvio ?? '';
  set dataenvio(String? val) => _dataenvio = val;

  bool hasDataenvio() => _dataenvio != null;

  // "horaenvio" field.
  String? _horaenvio;
  String get horaenvio => _horaenvio ?? '';
  set horaenvio(String? val) => _horaenvio = val;

  bool hasHoraenvio() => _horaenvio != null;

  // "numid" field.
  String? _numid;
  String get numid => _numid ?? '';
  set numid(String? val) => _numid = val;

  bool hasNumid() => _numid != null;

  // "datetime" field.
  String? _datetime;
  String get datetime => _datetime ?? '';
  set datetime(String? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  // "numseqitem" field.
  int? _numseqitem;
  int get numseqitem => _numseqitem ?? 0;
  set numseqitem(int? val) => _numseqitem = val;

  void incrementNumseqitem(int amount) => numseqitem = numseqitem + amount;

  bool hasNumseqitem() => _numseqitem != null;

  // "modo" field.
  String? _modo;
  String get modo => _modo ?? '';
  set modo(String? val) => _modo = val;

  bool hasModo() => _modo != null;

  // "regtipo" field.
  String? _regtipo;
  String get regtipo => _regtipo ?? '';
  set regtipo(String? val) => _regtipo = val;

  bool hasRegtipo() => _regtipo != null;

  // "idloja" field.
  int? _idloja;
  int get idloja => _idloja ?? 0;
  set idloja(int? val) => _idloja = val;

  void incrementIdloja(int amount) => idloja = idloja + amount;

  bool hasIdloja() => _idloja != null;

  // "idfrentista" field.
  String? _idfrentista;
  String get idfrentista => _idfrentista ?? '';
  set idfrentista(String? val) => _idfrentista = val;

  bool hasIdfrentista() => _idfrentista != null;

  // "cartao" field.
  String? _cartao;
  String get cartao => _cartao ?? '';
  set cartao(String? val) => _cartao = val;

  bool hasCartao() => _cartao != null;

  // "quantidade" field.
  double? _quantidade;
  double get quantidade => _quantidade ?? 0.0;
  set quantidade(double? val) => _quantidade = val;

  void incrementQuantidade(double amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "idvenda" field.
  int? _idvenda;
  int get idvenda => _idvenda ?? 0;
  set idvenda(int? val) => _idvenda = val;

  void incrementIdvenda(int amount) => idvenda = idvenda + amount;

  bool hasIdvenda() => _idvenda != null;

  static ListaAddAbastecimentoDataTypeStruct fromMap(
          Map<String, dynamic> data) =>
      ListaAddAbastecimentoDataTypeStruct(
        idCodigo: castToType<int>(data['id_codigo']),
        dataenvio: data['dataenvio'] as String?,
        horaenvio: data['horaenvio'] as String?,
        numid: data['numid'] as String?,
        datetime: data['datetime'] as String?,
        numseqitem: castToType<int>(data['numseqitem']),
        modo: data['modo'] as String?,
        regtipo: data['regtipo'] as String?,
        idloja: castToType<int>(data['idloja']),
        idfrentista: data['idfrentista'] as String?,
        cartao: data['cartao'] as String?,
        quantidade: castToType<double>(data['quantidade']),
        valor: castToType<double>(data['valor']),
        total: castToType<double>(data['total']),
        idvenda: castToType<int>(data['idvenda']),
      );

  static ListaAddAbastecimentoDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ListaAddAbastecimentoDataTypeStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'id_codigo': _idCodigo,
        'dataenvio': _dataenvio,
        'horaenvio': _horaenvio,
        'numid': _numid,
        'datetime': _datetime,
        'numseqitem': _numseqitem,
        'modo': _modo,
        'regtipo': _regtipo,
        'idloja': _idloja,
        'idfrentista': _idfrentista,
        'cartao': _cartao,
        'quantidade': _quantidade,
        'valor': _valor,
        'total': _total,
        'idvenda': _idvenda,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_codigo': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'dataenvio': serializeParam(
          _dataenvio,
          ParamType.String,
        ),
        'horaenvio': serializeParam(
          _horaenvio,
          ParamType.String,
        ),
        'numid': serializeParam(
          _numid,
          ParamType.String,
        ),
        'datetime': serializeParam(
          _datetime,
          ParamType.String,
        ),
        'numseqitem': serializeParam(
          _numseqitem,
          ParamType.int,
        ),
        'modo': serializeParam(
          _modo,
          ParamType.String,
        ),
        'regtipo': serializeParam(
          _regtipo,
          ParamType.String,
        ),
        'idloja': serializeParam(
          _idloja,
          ParamType.int,
        ),
        'idfrentista': serializeParam(
          _idfrentista,
          ParamType.String,
        ),
        'cartao': serializeParam(
          _cartao,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.double,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'idvenda': serializeParam(
          _idvenda,
          ParamType.int,
        ),
      }.withoutNulls;

  static ListaAddAbastecimentoDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListaAddAbastecimentoDataTypeStruct(
        idCodigo: deserializeParam(
          data['id_codigo'],
          ParamType.int,
          false,
        ),
        dataenvio: deserializeParam(
          data['dataenvio'],
          ParamType.String,
          false,
        ),
        horaenvio: deserializeParam(
          data['horaenvio'],
          ParamType.String,
          false,
        ),
        numid: deserializeParam(
          data['numid'],
          ParamType.String,
          false,
        ),
        datetime: deserializeParam(
          data['datetime'],
          ParamType.String,
          false,
        ),
        numseqitem: deserializeParam(
          data['numseqitem'],
          ParamType.int,
          false,
        ),
        modo: deserializeParam(
          data['modo'],
          ParamType.String,
          false,
        ),
        regtipo: deserializeParam(
          data['regtipo'],
          ParamType.String,
          false,
        ),
        idloja: deserializeParam(
          data['idloja'],
          ParamType.int,
          false,
        ),
        idfrentista: deserializeParam(
          data['idfrentista'],
          ParamType.String,
          false,
        ),
        cartao: deserializeParam(
          data['cartao'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.double,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        idvenda: deserializeParam(
          data['idvenda'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ListaAddAbastecimentoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListaAddAbastecimentoDataTypeStruct &&
        idCodigo == other.idCodigo &&
        dataenvio == other.dataenvio &&
        horaenvio == other.horaenvio &&
        numid == other.numid &&
        datetime == other.datetime &&
        numseqitem == other.numseqitem &&
        modo == other.modo &&
        regtipo == other.regtipo &&
        idloja == other.idloja &&
        idfrentista == other.idfrentista &&
        cartao == other.cartao &&
        quantidade == other.quantidade &&
        valor == other.valor &&
        total == other.total &&
        idvenda == other.idvenda;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCodigo,
        dataenvio,
        horaenvio,
        numid,
        datetime,
        numseqitem,
        modo,
        regtipo,
        idloja,
        idfrentista,
        cartao,
        quantidade,
        valor,
        total,
        idvenda
      ]);
}

ListaAddAbastecimentoDataTypeStruct createListaAddAbastecimentoDataTypeStruct({
  int? idCodigo,
  String? dataenvio,
  String? horaenvio,
  String? numid,
  String? datetime,
  int? numseqitem,
  String? modo,
  String? regtipo,
  int? idloja,
  String? idfrentista,
  String? cartao,
  double? quantidade,
  double? valor,
  double? total,
  int? idvenda,
}) =>
    ListaAddAbastecimentoDataTypeStruct(
      idCodigo: idCodigo,
      dataenvio: dataenvio,
      horaenvio: horaenvio,
      numid: numid,
      datetime: datetime,
      numseqitem: numseqitem,
      modo: modo,
      regtipo: regtipo,
      idloja: idloja,
      idfrentista: idfrentista,
      cartao: cartao,
      quantidade: quantidade,
      valor: valor,
      total: total,
      idvenda: idvenda,
    );
