// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AParamCTRegStruct extends BaseStruct {
  AParamCTRegStruct({
    List<int>? idcodigo,
    int? terminal,
    String? nometerminal,
    String? usuario,
    TEOpcao? modo,
  })  : _idcodigo = idcodigo,
        _terminal = terminal,
        _nometerminal = nometerminal,
        _usuario = usuario,
        _modo = modo;

  // "idcodigo" field.
  List<int>? _idcodigo;
  List<int> get idcodigo => _idcodigo ?? const [];
  set idcodigo(List<int>? val) => _idcodigo = val;

  void updateIdcodigo(Function(List<int>) updateFn) {
    updateFn(_idcodigo ??= []);
  }

  bool hasIdcodigo() => _idcodigo != null;

  // "terminal" field.
  int? _terminal;
  int get terminal => _terminal ?? 0;
  set terminal(int? val) => _terminal = val;

  void incrementTerminal(int amount) => terminal = terminal + amount;

  bool hasTerminal() => _terminal != null;

  // "nometerminal" field.
  String? _nometerminal;
  String get nometerminal => _nometerminal ?? '';
  set nometerminal(String? val) => _nometerminal = val;

  bool hasNometerminal() => _nometerminal != null;

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "modo" field.
  TEOpcao? _modo;
  TEOpcao? get modo => _modo;
  set modo(TEOpcao? val) => _modo = val;

  bool hasModo() => _modo != null;

  static AParamCTRegStruct fromMap(Map<String, dynamic> data) =>
      AParamCTRegStruct(
        idcodigo: getDataList(data['idcodigo']),
        terminal: castToType<int>(data['terminal']),
        nometerminal: data['nometerminal'] as String?,
        usuario: data['usuario'] as String?,
        modo: data['modo'] is TEOpcao
            ? data['modo']
            : deserializeEnum<TEOpcao>(data['modo']),
      );

  static AParamCTRegStruct? maybeFromMap(dynamic data) => data is Map
      ? AParamCTRegStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idcodigo': _idcodigo,
        'terminal': _terminal,
        'nometerminal': _nometerminal,
        'usuario': _usuario,
        'modo': _modo?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idcodigo': serializeParam(
          _idcodigo,
          ParamType.int,
          isList: true,
        ),
        'terminal': serializeParam(
          _terminal,
          ParamType.int,
        ),
        'nometerminal': serializeParam(
          _nometerminal,
          ParamType.String,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'modo': serializeParam(
          _modo,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static AParamCTRegStruct fromSerializableMap(Map<String, dynamic> data) =>
      AParamCTRegStruct(
        idcodigo: deserializeParam<int>(
          data['idcodigo'],
          ParamType.int,
          true,
        ),
        terminal: deserializeParam(
          data['terminal'],
          ParamType.int,
          false,
        ),
        nometerminal: deserializeParam(
          data['nometerminal'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.String,
          false,
        ),
        modo: deserializeParam<TEOpcao>(
          data['modo'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'AParamCTRegStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AParamCTRegStruct &&
        listEquality.equals(idcodigo, other.idcodigo) &&
        terminal == other.terminal &&
        nometerminal == other.nometerminal &&
        usuario == other.usuario &&
        modo == other.modo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([idcodigo, terminal, nometerminal, usuario, modo]);
}

AParamCTRegStruct createAParamCTRegStruct({
  int? terminal,
  String? nometerminal,
  String? usuario,
  TEOpcao? modo,
}) =>
    AParamCTRegStruct(
      terminal: terminal,
      nometerminal: nometerminal,
      usuario: usuario,
      modo: modo,
    );
