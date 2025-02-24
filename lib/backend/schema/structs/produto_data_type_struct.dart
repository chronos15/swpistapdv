// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutoDataTypeStruct extends BaseStruct {
  ProdutoDataTypeStruct({
    int? idCodigo,
    String? nRef,
    String? codigogtin,
    String? nompro,
    String? abreviado,
    String? und,
    double? pravista,
    double? praprazo,
    int? prrevenda,
    int? prassistencia,
    double? estoque,
    String? imagemUrl,
    int? codmarca,
    String? marca,
    int? codgru,
    String? nomgru,
    int? codsubgru,
    double? estoqueOrig,
    String? combustivel,
  })  : _idCodigo = idCodigo,
        _nRef = nRef,
        _codigogtin = codigogtin,
        _nompro = nompro,
        _abreviado = abreviado,
        _und = und,
        _pravista = pravista,
        _praprazo = praprazo,
        _prrevenda = prrevenda,
        _prassistencia = prassistencia,
        _estoque = estoque,
        _imagemUrl = imagemUrl,
        _codmarca = codmarca,
        _marca = marca,
        _codgru = codgru,
        _nomgru = nomgru,
        _codsubgru = codsubgru,
        _estoqueOrig = estoqueOrig,
        _combustivel = combustivel;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "N_REF" field.
  String? _nRef;
  String get nRef => _nRef ?? '';
  set nRef(String? val) => _nRef = val;

  bool hasNRef() => _nRef != null;

  // "CODIGOGTIN" field.
  String? _codigogtin;
  String get codigogtin => _codigogtin ?? '';
  set codigogtin(String? val) => _codigogtin = val;

  bool hasCodigogtin() => _codigogtin != null;

  // "NOMPRO" field.
  String? _nompro;
  String get nompro => _nompro ?? '';
  set nompro(String? val) => _nompro = val;

  bool hasNompro() => _nompro != null;

  // "ABREVIADO" field.
  String? _abreviado;
  String get abreviado => _abreviado ?? '';
  set abreviado(String? val) => _abreviado = val;

  bool hasAbreviado() => _abreviado != null;

  // "UND" field.
  String? _und;
  String get und => _und ?? '';
  set und(String? val) => _und = val;

  bool hasUnd() => _und != null;

  // "PRAVISTA" field.
  double? _pravista;
  double get pravista => _pravista ?? 0.0;
  set pravista(double? val) => _pravista = val;

  void incrementPravista(double amount) => pravista = pravista + amount;

  bool hasPravista() => _pravista != null;

  // "PRAPRAZO" field.
  double? _praprazo;
  double get praprazo => _praprazo ?? 0.0;
  set praprazo(double? val) => _praprazo = val;

  void incrementPraprazo(double amount) => praprazo = praprazo + amount;

  bool hasPraprazo() => _praprazo != null;

  // "PRREVENDA" field.
  int? _prrevenda;
  int get prrevenda => _prrevenda ?? 0;
  set prrevenda(int? val) => _prrevenda = val;

  void incrementPrrevenda(int amount) => prrevenda = prrevenda + amount;

  bool hasPrrevenda() => _prrevenda != null;

  // "PRASSISTENCIA" field.
  int? _prassistencia;
  int get prassistencia => _prassistencia ?? 0;
  set prassistencia(int? val) => _prassistencia = val;

  void incrementPrassistencia(int amount) =>
      prassistencia = prassistencia + amount;

  bool hasPrassistencia() => _prassistencia != null;

  // "ESTOQUE" field.
  double? _estoque;
  double get estoque => _estoque ?? 0.0;
  set estoque(double? val) => _estoque = val;

  void incrementEstoque(double amount) => estoque = estoque + amount;

  bool hasEstoque() => _estoque != null;

  // "IMAGEM_URL" field.
  String? _imagemUrl;
  String get imagemUrl => _imagemUrl ?? '';
  set imagemUrl(String? val) => _imagemUrl = val;

  bool hasImagemUrl() => _imagemUrl != null;

  // "CODMARCA" field.
  int? _codmarca;
  int get codmarca => _codmarca ?? 0;
  set codmarca(int? val) => _codmarca = val;

  void incrementCodmarca(int amount) => codmarca = codmarca + amount;

  bool hasCodmarca() => _codmarca != null;

  // "MARCA" field.
  String? _marca;
  String get marca => _marca ?? '';
  set marca(String? val) => _marca = val;

  bool hasMarca() => _marca != null;

  // "CODGRU" field.
  int? _codgru;
  int get codgru => _codgru ?? 0;
  set codgru(int? val) => _codgru = val;

  void incrementCodgru(int amount) => codgru = codgru + amount;

  bool hasCodgru() => _codgru != null;

  // "NOMGRU" field.
  String? _nomgru;
  String get nomgru => _nomgru ?? '';
  set nomgru(String? val) => _nomgru = val;

  bool hasNomgru() => _nomgru != null;

  // "CODSUBGRU" field.
  int? _codsubgru;
  int get codsubgru => _codsubgru ?? 0;
  set codsubgru(int? val) => _codsubgru = val;

  void incrementCodsubgru(int amount) => codsubgru = codsubgru + amount;

  bool hasCodsubgru() => _codsubgru != null;

  // "ESTOQUE_ORIG" field.
  double? _estoqueOrig;
  double get estoqueOrig => _estoqueOrig ?? 0.0;
  set estoqueOrig(double? val) => _estoqueOrig = val;

  void incrementEstoqueOrig(double amount) =>
      estoqueOrig = estoqueOrig + amount;

  bool hasEstoqueOrig() => _estoqueOrig != null;

  // "COMBUSTIVEL" field.
  String? _combustivel;
  String get combustivel => _combustivel ?? '';
  set combustivel(String? val) => _combustivel = val;

  bool hasCombustivel() => _combustivel != null;

  static ProdutoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ProdutoDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        nRef: data['N_REF'] as String?,
        codigogtin: data['CODIGOGTIN'] as String?,
        nompro: data['NOMPRO'] as String?,
        abreviado: data['ABREVIADO'] as String?,
        und: data['UND'] as String?,
        pravista: castToType<double>(data['PRAVISTA']),
        praprazo: castToType<double>(data['PRAPRAZO']),
        prrevenda: castToType<int>(data['PRREVENDA']),
        prassistencia: castToType<int>(data['PRASSISTENCIA']),
        estoque: castToType<double>(data['ESTOQUE']),
        imagemUrl: data['IMAGEM_URL'] as String?,
        codmarca: castToType<int>(data['CODMARCA']),
        marca: data['MARCA'] as String?,
        codgru: castToType<int>(data['CODGRU']),
        nomgru: data['NOMGRU'] as String?,
        codsubgru: castToType<int>(data['CODSUBGRU']),
        estoqueOrig: castToType<double>(data['ESTOQUE_ORIG']),
        combustivel: data['COMBUSTIVEL'] as String?,
      );

  static ProdutoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ProdutoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'N_REF': _nRef,
        'CODIGOGTIN': _codigogtin,
        'NOMPRO': _nompro,
        'ABREVIADO': _abreviado,
        'UND': _und,
        'PRAVISTA': _pravista,
        'PRAPRAZO': _praprazo,
        'PRREVENDA': _prrevenda,
        'PRASSISTENCIA': _prassistencia,
        'ESTOQUE': _estoque,
        'IMAGEM_URL': _imagemUrl,
        'CODMARCA': _codmarca,
        'MARCA': _marca,
        'CODGRU': _codgru,
        'NOMGRU': _nomgru,
        'CODSUBGRU': _codsubgru,
        'ESTOQUE_ORIG': _estoqueOrig,
        'COMBUSTIVEL': _combustivel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'N_REF': serializeParam(
          _nRef,
          ParamType.String,
        ),
        'CODIGOGTIN': serializeParam(
          _codigogtin,
          ParamType.String,
        ),
        'NOMPRO': serializeParam(
          _nompro,
          ParamType.String,
        ),
        'ABREVIADO': serializeParam(
          _abreviado,
          ParamType.String,
        ),
        'UND': serializeParam(
          _und,
          ParamType.String,
        ),
        'PRAVISTA': serializeParam(
          _pravista,
          ParamType.double,
        ),
        'PRAPRAZO': serializeParam(
          _praprazo,
          ParamType.double,
        ),
        'PRREVENDA': serializeParam(
          _prrevenda,
          ParamType.int,
        ),
        'PRASSISTENCIA': serializeParam(
          _prassistencia,
          ParamType.int,
        ),
        'ESTOQUE': serializeParam(
          _estoque,
          ParamType.double,
        ),
        'IMAGEM_URL': serializeParam(
          _imagemUrl,
          ParamType.String,
        ),
        'CODMARCA': serializeParam(
          _codmarca,
          ParamType.int,
        ),
        'MARCA': serializeParam(
          _marca,
          ParamType.String,
        ),
        'CODGRU': serializeParam(
          _codgru,
          ParamType.int,
        ),
        'NOMGRU': serializeParam(
          _nomgru,
          ParamType.String,
        ),
        'CODSUBGRU': serializeParam(
          _codsubgru,
          ParamType.int,
        ),
        'ESTOQUE_ORIG': serializeParam(
          _estoqueOrig,
          ParamType.double,
        ),
        'COMBUSTIVEL': serializeParam(
          _combustivel,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProdutoDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProdutoDataTypeStruct(
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        nRef: deserializeParam(
          data['N_REF'],
          ParamType.String,
          false,
        ),
        codigogtin: deserializeParam(
          data['CODIGOGTIN'],
          ParamType.String,
          false,
        ),
        nompro: deserializeParam(
          data['NOMPRO'],
          ParamType.String,
          false,
        ),
        abreviado: deserializeParam(
          data['ABREVIADO'],
          ParamType.String,
          false,
        ),
        und: deserializeParam(
          data['UND'],
          ParamType.String,
          false,
        ),
        pravista: deserializeParam(
          data['PRAVISTA'],
          ParamType.double,
          false,
        ),
        praprazo: deserializeParam(
          data['PRAPRAZO'],
          ParamType.double,
          false,
        ),
        prrevenda: deserializeParam(
          data['PRREVENDA'],
          ParamType.int,
          false,
        ),
        prassistencia: deserializeParam(
          data['PRASSISTENCIA'],
          ParamType.int,
          false,
        ),
        estoque: deserializeParam(
          data['ESTOQUE'],
          ParamType.double,
          false,
        ),
        imagemUrl: deserializeParam(
          data['IMAGEM_URL'],
          ParamType.String,
          false,
        ),
        codmarca: deserializeParam(
          data['CODMARCA'],
          ParamType.int,
          false,
        ),
        marca: deserializeParam(
          data['MARCA'],
          ParamType.String,
          false,
        ),
        codgru: deserializeParam(
          data['CODGRU'],
          ParamType.int,
          false,
        ),
        nomgru: deserializeParam(
          data['NOMGRU'],
          ParamType.String,
          false,
        ),
        codsubgru: deserializeParam(
          data['CODSUBGRU'],
          ParamType.int,
          false,
        ),
        estoqueOrig: deserializeParam(
          data['ESTOQUE_ORIG'],
          ParamType.double,
          false,
        ),
        combustivel: deserializeParam(
          data['COMBUSTIVEL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProdutoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProdutoDataTypeStruct &&
        idCodigo == other.idCodigo &&
        nRef == other.nRef &&
        codigogtin == other.codigogtin &&
        nompro == other.nompro &&
        abreviado == other.abreviado &&
        und == other.und &&
        pravista == other.pravista &&
        praprazo == other.praprazo &&
        prrevenda == other.prrevenda &&
        prassistencia == other.prassistencia &&
        estoque == other.estoque &&
        imagemUrl == other.imagemUrl &&
        codmarca == other.codmarca &&
        marca == other.marca &&
        codgru == other.codgru &&
        nomgru == other.nomgru &&
        codsubgru == other.codsubgru &&
        estoqueOrig == other.estoqueOrig &&
        combustivel == other.combustivel;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCodigo,
        nRef,
        codigogtin,
        nompro,
        abreviado,
        und,
        pravista,
        praprazo,
        prrevenda,
        prassistencia,
        estoque,
        imagemUrl,
        codmarca,
        marca,
        codgru,
        nomgru,
        codsubgru,
        estoqueOrig,
        combustivel
      ]);
}

ProdutoDataTypeStruct createProdutoDataTypeStruct({
  int? idCodigo,
  String? nRef,
  String? codigogtin,
  String? nompro,
  String? abreviado,
  String? und,
  double? pravista,
  double? praprazo,
  int? prrevenda,
  int? prassistencia,
  double? estoque,
  String? imagemUrl,
  int? codmarca,
  String? marca,
  int? codgru,
  String? nomgru,
  int? codsubgru,
  double? estoqueOrig,
  String? combustivel,
}) =>
    ProdutoDataTypeStruct(
      idCodigo: idCodigo,
      nRef: nRef,
      codigogtin: codigogtin,
      nompro: nompro,
      abreviado: abreviado,
      und: und,
      pravista: pravista,
      praprazo: praprazo,
      prrevenda: prrevenda,
      prassistencia: prassistencia,
      estoque: estoque,
      imagemUrl: imagemUrl,
      codmarca: codmarca,
      marca: marca,
      codgru: codgru,
      nomgru: nomgru,
      codsubgru: codsubgru,
      estoqueOrig: estoqueOrig,
      combustivel: combustivel,
    );
