// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatusNFDataTypeStruct extends BaseStruct {
  StatusNFDataTypeStruct({
    String? status,
    String? pdf,
    bool? sucess,
    String? mensagem,
  })  : _status = status,
        _pdf = pdf,
        _sucess = sucess,
        _mensagem = mensagem;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  set pdf(String? val) => _pdf = val;

  bool hasPdf() => _pdf != null;

  // "sucess" field.
  bool? _sucess;
  bool get sucess => _sucess ?? false;
  set sucess(bool? val) => _sucess = val;

  bool hasSucess() => _sucess != null;

  // "mensagem" field.
  String? _mensagem;
  String get mensagem => _mensagem ?? '';
  set mensagem(String? val) => _mensagem = val;

  bool hasMensagem() => _mensagem != null;

  static StatusNFDataTypeStruct fromMap(Map<String, dynamic> data) =>
      StatusNFDataTypeStruct(
        status: data['status'] as String?,
        pdf: data['pdf'] as String?,
        sucess: data['sucess'] as bool?,
        mensagem: data['mensagem'] as String?,
      );

  static StatusNFDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? StatusNFDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'pdf': _pdf,
        'sucess': _sucess,
        'mensagem': _mensagem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'pdf': serializeParam(
          _pdf,
          ParamType.String,
        ),
        'sucess': serializeParam(
          _sucess,
          ParamType.bool,
        ),
        'mensagem': serializeParam(
          _mensagem,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatusNFDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StatusNFDataTypeStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        pdf: deserializeParam(
          data['pdf'],
          ParamType.String,
          false,
        ),
        sucess: deserializeParam(
          data['sucess'],
          ParamType.bool,
          false,
        ),
        mensagem: deserializeParam(
          data['mensagem'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatusNFDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusNFDataTypeStruct &&
        status == other.status &&
        pdf == other.pdf &&
        sucess == other.sucess &&
        mensagem == other.mensagem;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([status, pdf, sucess, mensagem]);
}

StatusNFDataTypeStruct createStatusNFDataTypeStruct({
  String? status,
  String? pdf,
  bool? sucess,
  String? mensagem,
}) =>
    StatusNFDataTypeStruct(
      status: status,
      pdf: pdf,
      sucess: sucess,
      mensagem: mensagem,
    );
