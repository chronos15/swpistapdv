// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigGlobaisStruct extends BaseStruct {
  ConfigGlobaisStruct({
    int? smtpSelected,
    String? serverHost,
    int? serverPort,
    String? certificateSSL,
    String? username,
    String? password,
  })  : _smtpSelected = smtpSelected,
        _serverHost = serverHost,
        _serverPort = serverPort,
        _certificateSSL = certificateSSL,
        _username = username,
        _password = password;

  // "smtpSelected" field.
  int? _smtpSelected;
  int get smtpSelected => _smtpSelected ?? 0;
  set smtpSelected(int? val) => _smtpSelected = val;

  void incrementSmtpSelected(int amount) =>
      smtpSelected = smtpSelected + amount;

  bool hasSmtpSelected() => _smtpSelected != null;

  // "serverHost" field.
  String? _serverHost;
  String get serverHost => _serverHost ?? '';
  set serverHost(String? val) => _serverHost = val;

  bool hasServerHost() => _serverHost != null;

  // "serverPort" field.
  int? _serverPort;
  int get serverPort => _serverPort ?? 0;
  set serverPort(int? val) => _serverPort = val;

  void incrementServerPort(int amount) => serverPort = serverPort + amount;

  bool hasServerPort() => _serverPort != null;

  // "certificateSSL" field.
  String? _certificateSSL;
  String get certificateSSL => _certificateSSL ?? '';
  set certificateSSL(String? val) => _certificateSSL = val;

  bool hasCertificateSSL() => _certificateSSL != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  static ConfigGlobaisStruct fromMap(Map<String, dynamic> data) =>
      ConfigGlobaisStruct(
        smtpSelected: castToType<int>(data['smtpSelected']),
        serverHost: data['serverHost'] as String?,
        serverPort: castToType<int>(data['serverPort']),
        certificateSSL: data['certificateSSL'] as String?,
        username: data['username'] as String?,
        password: data['password'] as String?,
      );

  static ConfigGlobaisStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigGlobaisStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'smtpSelected': _smtpSelected,
        'serverHost': _serverHost,
        'serverPort': _serverPort,
        'certificateSSL': _certificateSSL,
        'username': _username,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'smtpSelected': serializeParam(
          _smtpSelected,
          ParamType.int,
        ),
        'serverHost': serializeParam(
          _serverHost,
          ParamType.String,
        ),
        'serverPort': serializeParam(
          _serverPort,
          ParamType.int,
        ),
        'certificateSSL': serializeParam(
          _certificateSSL,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConfigGlobaisStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigGlobaisStruct(
        smtpSelected: deserializeParam(
          data['smtpSelected'],
          ParamType.int,
          false,
        ),
        serverHost: deserializeParam(
          data['serverHost'],
          ParamType.String,
          false,
        ),
        serverPort: deserializeParam(
          data['serverPort'],
          ParamType.int,
          false,
        ),
        certificateSSL: deserializeParam(
          data['certificateSSL'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConfigGlobaisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigGlobaisStruct &&
        smtpSelected == other.smtpSelected &&
        serverHost == other.serverHost &&
        serverPort == other.serverPort &&
        certificateSSL == other.certificateSSL &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([
        smtpSelected,
        serverHost,
        serverPort,
        certificateSSL,
        username,
        password
      ]);
}

ConfigGlobaisStruct createConfigGlobaisStruct({
  int? smtpSelected,
  String? serverHost,
  int? serverPort,
  String? certificateSSL,
  String? username,
  String? password,
}) =>
    ConfigGlobaisStruct(
      smtpSelected: smtpSelected,
      serverHost: serverHost,
      serverPort: serverPort,
      certificateSSL: certificateSSL,
      username: username,
      password: password,
    );
