import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_commons/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_ConfigGlobaisServer')) {
        try {
          final serializedData =
              prefs.getString('ff_ConfigGlobaisServer') ?? '{}';
          _ConfigGlobaisServer = ConfigGlobaisServerStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ConfigGlobais')) {
        try {
          final serializedData = prefs.getString('ff_ConfigGlobais') ?? '{}';
          _ConfigGlobais = ConfigGlobaisStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ConfigGlobaisServerStruct _ConfigGlobaisServer = ConfigGlobaisServerStruct();
  ConfigGlobaisServerStruct get ConfigGlobaisServer => _ConfigGlobaisServer;
  set ConfigGlobaisServer(ConfigGlobaisServerStruct value) {
    _ConfigGlobaisServer = value;
    prefs.setString('ff_ConfigGlobaisServer', value.serialize());
  }

  void updateConfigGlobaisServerStruct(
      Function(ConfigGlobaisServerStruct) updateFn) {
    updateFn(_ConfigGlobaisServer);
    prefs.setString('ff_ConfigGlobaisServer', _ConfigGlobaisServer.serialize());
  }

  ConfigGlobaisStruct _ConfigGlobais = ConfigGlobaisStruct();
  ConfigGlobaisStruct get ConfigGlobais => _ConfigGlobais;
  set ConfigGlobais(ConfigGlobaisStruct value) {
    _ConfigGlobais = value;
    prefs.setString('ff_ConfigGlobais', value.serialize());
  }

  void updateConfigGlobaisStruct(Function(ConfigGlobaisStruct) updateFn) {
    updateFn(_ConfigGlobais);
    prefs.setString('ff_ConfigGlobais', _ConfigGlobais.serialize());
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
