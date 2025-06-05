// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CondPagamentoDataTypeStruct extends BaseStruct {
  CondPagamentoDataTypeStruct({
    int? idCodigo,
    String? descricao,
    int? numeroPar,
    String? tipoPagamento,
    String? status,
    int? codempresa,
    int? ordvisualizacao,
    String? snvendaext,
  })  : _idCodigo = idCodigo,
        _descricao = descricao,
        _numeroPar = numeroPar,
        _tipoPagamento = tipoPagamento,
        _status = status,
        _codempresa = codempresa,
        _ordvisualizacao = ordvisualizacao,
        _snvendaext = snvendaext;

  // "ID_CODIGO" field.
  int? _idCodigo;
  int get idCodigo => _idCodigo ?? 0;
  set idCodigo(int? val) => _idCodigo = val;

  void incrementIdCodigo(int amount) => idCodigo = idCodigo + amount;

  bool hasIdCodigo() => _idCodigo != null;

  // "DESCRICAO" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "NUMERO_PAR" field.
  int? _numeroPar;
  int get numeroPar => _numeroPar ?? 0;
  set numeroPar(int? val) => _numeroPar = val;

  void incrementNumeroPar(int amount) => numeroPar = numeroPar + amount;

  bool hasNumeroPar() => _numeroPar != null;

  // "TIPO_PAGAMENTO" field.
  String? _tipoPagamento;
  String get tipoPagamento => _tipoPagamento ?? '';
  set tipoPagamento(String? val) => _tipoPagamento = val;

  bool hasTipoPagamento() => _tipoPagamento != null;

  // "STATUS" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "CODEMPRESA" field.
  int? _codempresa;
  int get codempresa => _codempresa ?? 0;
  set codempresa(int? val) => _codempresa = val;

  void incrementCodempresa(int amount) => codempresa = codempresa + amount;

  bool hasCodempresa() => _codempresa != null;

  // "ORDVISUALIZACAO" field.
  int? _ordvisualizacao;
  int get ordvisualizacao => _ordvisualizacao ?? 0;
  set ordvisualizacao(int? val) => _ordvisualizacao = val;

  void incrementOrdvisualizacao(int amount) =>
      ordvisualizacao = ordvisualizacao + amount;

  bool hasOrdvisualizacao() => _ordvisualizacao != null;

  // "SNVENDAEXT" field.
  String? _snvendaext;
  String get snvendaext => _snvendaext ?? '';
  set snvendaext(String? val) => _snvendaext = val;

  bool hasSnvendaext() => _snvendaext != null;

  static CondPagamentoDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CondPagamentoDataTypeStruct(
        idCodigo: castToType<int>(data['ID_CODIGO']),
        descricao: data['DESCRICAO'] as String?,
        numeroPar: castToType<int>(data['NUMERO_PAR']),
        tipoPagamento: data['TIPO_PAGAMENTO'] as String?,
        status: data['STATUS'] as String?,
        codempresa: castToType<int>(data['CODEMPRESA']),
        ordvisualizacao: castToType<int>(data['ORDVISUALIZACAO']),
        snvendaext: data['SNVENDAEXT'] as String?,
      );

  static CondPagamentoDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CondPagamentoDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID_CODIGO': _idCodigo,
        'DESCRICAO': _descricao,
        'NUMERO_PAR': _numeroPar,
        'TIPO_PAGAMENTO': _tipoPagamento,
        'STATUS': _status,
        'CODEMPRESA': _codempresa,
        'ORDVISUALIZACAO': _ordvisualizacao,
        'SNVENDAEXT': _snvendaext,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID_CODIGO': serializeParam(
          _idCodigo,
          ParamType.int,
        ),
        'DESCRICAO': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'NUMERO_PAR': serializeParam(
          _numeroPar,
          ParamType.int,
        ),
        'TIPO_PAGAMENTO': serializeParam(
          _tipoPagamento,
          ParamType.String,
        ),
        'STATUS': serializeParam(
          _status,
          ParamType.String,
        ),
        'CODEMPRESA': serializeParam(
          _codempresa,
          ParamType.int,
        ),
        'ORDVISUALIZACAO': serializeParam(
          _ordvisualizacao,
          ParamType.int,
        ),
        'SNVENDAEXT': serializeParam(
          _snvendaext,
          ParamType.String,
        ),
      }.withoutNulls;

  static CondPagamentoDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CondPagamentoDataTypeStruct(
        idCodigo: deserializeParam(
          data['ID_CODIGO'],
          ParamType.int,
          false,
        ),
        descricao: deserializeParam(
          data['DESCRICAO'],
          ParamType.String,
          false,
        ),
        numeroPar: deserializeParam(
          data['NUMERO_PAR'],
          ParamType.int,
          false,
        ),
        tipoPagamento: deserializeParam(
          data['TIPO_PAGAMENTO'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['STATUS'],
          ParamType.String,
          false,
        ),
        codempresa: deserializeParam(
          data['CODEMPRESA'],
          ParamType.int,
          false,
        ),
        ordvisualizacao: deserializeParam(
          data['ORDVISUALIZACAO'],
          ParamType.int,
          false,
        ),
        snvendaext: deserializeParam(
          data['SNVENDAEXT'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CondPagamentoDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CondPagamentoDataTypeStruct &&
        idCodigo == other.idCodigo &&
        descricao == other.descricao &&
        numeroPar == other.numeroPar &&
        tipoPagamento == other.tipoPagamento &&
        status == other.status &&
        codempresa == other.codempresa &&
        ordvisualizacao == other.ordvisualizacao &&
        snvendaext == other.snvendaext;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idCodigo,
        descricao,
        numeroPar,
        tipoPagamento,
        status,
        codempresa,
        ordvisualizacao,
        snvendaext
      ]);
}

CondPagamentoDataTypeStruct createCondPagamentoDataTypeStruct({
  int? idCodigo,
  String? descricao,
  int? numeroPar,
  String? tipoPagamento,
  String? status,
  int? codempresa,
  int? ordvisualizacao,
  String? snvendaext,
}) =>
    CondPagamentoDataTypeStruct(
      idCodigo: idCodigo,
      descricao: descricao,
      numeroPar: numeroPar,
      tipoPagamento: tipoPagamento,
      status: status,
      codempresa: codempresa,
      ordvisualizacao: ordvisualizacao,
      snvendaext: snvendaext,
    );
