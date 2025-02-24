import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
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
      if (prefs.containsKey('ff_venda')) {
        try {
          final serializedData = prefs.getString('ff_venda') ?? '{}';
          _venda = VendasStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _vendaitens = prefs
              .getStringList('ff_vendaitens')
              ?.map((x) {
                try {
                  return VendaitemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _vendaitens;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ConfigLocais')) {
        try {
          final serializedData = prefs.getString('ff_ConfigLocais') ?? '{}';
          _ConfigLocais = ConfigLocaisStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Empresa')) {
        try {
          final serializedData = prefs.getString('ff_Empresa') ?? '{}';
          _Empresa = EmpresaDataTypeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _AbastecimentosSelecionados = prefs
              .getStringList('ff_AbastecimentosSelecionados')
              ?.map((x) {
                try {
                  return ListaAbastecimentoDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _AbastecimentosSelecionados;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ConfigRemota')) {
        try {
          final serializedData = prefs.getString('ff_ConfigRemota') ?? '{}';
          _ConfigRemota = ConfiguracaoDataTypeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _HistoricoVendas = prefs
              .getStringList('ff_HistoricoVendas')
              ?.map((x) {
                try {
                  return VendasStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _HistoricoVendas;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ClienteSelected')) {
        try {
          final serializedData = prefs.getString('ff_ClienteSelected') ?? '{}';
          _ClienteSelected = ClienteListaDataTypeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Favoritos = prefs
              .getStringList('ff_Favoritos')
              ?.map((x) {
                try {
                  return ProdutoDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Favoritos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  VendasStruct _venda = VendasStruct();
  VendasStruct get venda => _venda;
  set venda(VendasStruct value) {
    _venda = value;
    prefs.setString('ff_venda', value.serialize());
  }

  void updateVendaStruct(Function(VendasStruct) updateFn) {
    updateFn(_venda);
    prefs.setString('ff_venda', _venda.serialize());
  }

  List<VendaitemStruct> _vendaitens = [];
  List<VendaitemStruct> get vendaitens => _vendaitens;
  set vendaitens(List<VendaitemStruct> value) {
    _vendaitens = value;
    prefs.setStringList(
        'ff_vendaitens', value.map((x) => x.serialize()).toList());
  }

  void addToVendaitens(VendaitemStruct value) {
    vendaitens.add(value);
    prefs.setStringList(
        'ff_vendaitens', _vendaitens.map((x) => x.serialize()).toList());
  }

  void removeFromVendaitens(VendaitemStruct value) {
    vendaitens.remove(value);
    prefs.setStringList(
        'ff_vendaitens', _vendaitens.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromVendaitens(int index) {
    vendaitens.removeAt(index);
    prefs.setStringList(
        'ff_vendaitens', _vendaitens.map((x) => x.serialize()).toList());
  }

  void updateVendaitensAtIndex(
    int index,
    VendaitemStruct Function(VendaitemStruct) updateFn,
  ) {
    vendaitens[index] = updateFn(_vendaitens[index]);
    prefs.setStringList(
        'ff_vendaitens', _vendaitens.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInVendaitens(int index, VendaitemStruct value) {
    vendaitens.insert(index, value);
    prefs.setStringList(
        'ff_vendaitens', _vendaitens.map((x) => x.serialize()).toList());
  }

  ConfigLocaisStruct _ConfigLocais = ConfigLocaisStruct();
  ConfigLocaisStruct get ConfigLocais => _ConfigLocais;
  set ConfigLocais(ConfigLocaisStruct value) {
    _ConfigLocais = value;
    prefs.setString('ff_ConfigLocais', value.serialize());
  }

  void updateConfigLocaisStruct(Function(ConfigLocaisStruct) updateFn) {
    updateFn(_ConfigLocais);
    prefs.setString('ff_ConfigLocais', _ConfigLocais.serialize());
  }

  EmpresaDataTypeStruct _Empresa = EmpresaDataTypeStruct();
  EmpresaDataTypeStruct get Empresa => _Empresa;
  set Empresa(EmpresaDataTypeStruct value) {
    _Empresa = value;
    prefs.setString('ff_Empresa', value.serialize());
  }

  void updateEmpresaStruct(Function(EmpresaDataTypeStruct) updateFn) {
    updateFn(_Empresa);
    prefs.setString('ff_Empresa', _Empresa.serialize());
  }

  List<ListaAbastecimentoDataTypeStruct> _AbastecimentosSelecionados = [];
  List<ListaAbastecimentoDataTypeStruct> get AbastecimentosSelecionados =>
      _AbastecimentosSelecionados;
  set AbastecimentosSelecionados(List<ListaAbastecimentoDataTypeStruct> value) {
    _AbastecimentosSelecionados = value;
    prefs.setStringList('ff_AbastecimentosSelecionados',
        value.map((x) => x.serialize()).toList());
  }

  void addToAbastecimentosSelecionados(ListaAbastecimentoDataTypeStruct value) {
    AbastecimentosSelecionados.add(value);
    prefs.setStringList('ff_AbastecimentosSelecionados',
        _AbastecimentosSelecionados.map((x) => x.serialize()).toList());
  }

  void removeFromAbastecimentosSelecionados(
      ListaAbastecimentoDataTypeStruct value) {
    AbastecimentosSelecionados.remove(value);
    prefs.setStringList('ff_AbastecimentosSelecionados',
        _AbastecimentosSelecionados.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromAbastecimentosSelecionados(int index) {
    AbastecimentosSelecionados.removeAt(index);
    prefs.setStringList('ff_AbastecimentosSelecionados',
        _AbastecimentosSelecionados.map((x) => x.serialize()).toList());
  }

  void updateAbastecimentosSelecionadosAtIndex(
    int index,
    ListaAbastecimentoDataTypeStruct Function(ListaAbastecimentoDataTypeStruct)
        updateFn,
  ) {
    AbastecimentosSelecionados[index] =
        updateFn(_AbastecimentosSelecionados[index]);
    prefs.setStringList('ff_AbastecimentosSelecionados',
        _AbastecimentosSelecionados.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInAbastecimentosSelecionados(
      int index, ListaAbastecimentoDataTypeStruct value) {
    AbastecimentosSelecionados.insert(index, value);
    prefs.setStringList('ff_AbastecimentosSelecionados',
        _AbastecimentosSelecionados.map((x) => x.serialize()).toList());
  }

  FrentistasDataTypeStruct _FrentistaSelecionado = FrentistasDataTypeStruct();
  FrentistasDataTypeStruct get FrentistaSelecionado => _FrentistaSelecionado;
  set FrentistaSelecionado(FrentistasDataTypeStruct value) {
    _FrentistaSelecionado = value;
  }

  void updateFrentistaSelecionadoStruct(
      Function(FrentistasDataTypeStruct) updateFn) {
    updateFn(_FrentistaSelecionado);
  }

  ConfiguracaoDataTypeStruct _ConfigRemota = ConfiguracaoDataTypeStruct();
  ConfiguracaoDataTypeStruct get ConfigRemota => _ConfigRemota;
  set ConfigRemota(ConfiguracaoDataTypeStruct value) {
    _ConfigRemota = value;
    prefs.setString('ff_ConfigRemota', value.serialize());
  }

  void updateConfigRemotaStruct(Function(ConfiguracaoDataTypeStruct) updateFn) {
    updateFn(_ConfigRemota);
    prefs.setString('ff_ConfigRemota', _ConfigRemota.serialize());
  }

  List<VendasStruct> _HistoricoVendas = [];
  List<VendasStruct> get HistoricoVendas => _HistoricoVendas;
  set HistoricoVendas(List<VendasStruct> value) {
    _HistoricoVendas = value;
    prefs.setStringList(
        'ff_HistoricoVendas', value.map((x) => x.serialize()).toList());
  }

  void addToHistoricoVendas(VendasStruct value) {
    HistoricoVendas.add(value);
    prefs.setStringList('ff_HistoricoVendas',
        _HistoricoVendas.map((x) => x.serialize()).toList());
  }

  void removeFromHistoricoVendas(VendasStruct value) {
    HistoricoVendas.remove(value);
    prefs.setStringList('ff_HistoricoVendas',
        _HistoricoVendas.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHistoricoVendas(int index) {
    HistoricoVendas.removeAt(index);
    prefs.setStringList('ff_HistoricoVendas',
        _HistoricoVendas.map((x) => x.serialize()).toList());
  }

  void updateHistoricoVendasAtIndex(
    int index,
    VendasStruct Function(VendasStruct) updateFn,
  ) {
    HistoricoVendas[index] = updateFn(_HistoricoVendas[index]);
    prefs.setStringList('ff_HistoricoVendas',
        _HistoricoVendas.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHistoricoVendas(int index, VendasStruct value) {
    HistoricoVendas.insert(index, value);
    prefs.setStringList('ff_HistoricoVendas',
        _HistoricoVendas.map((x) => x.serialize()).toList());
  }

  ClienteListaDataTypeStruct _ClienteSelected = ClienteListaDataTypeStruct();
  ClienteListaDataTypeStruct get ClienteSelected => _ClienteSelected;
  set ClienteSelected(ClienteListaDataTypeStruct value) {
    _ClienteSelected = value;
    prefs.setString('ff_ClienteSelected', value.serialize());
  }

  void updateClienteSelectedStruct(
      Function(ClienteListaDataTypeStruct) updateFn) {
    updateFn(_ClienteSelected);
    prefs.setString('ff_ClienteSelected', _ClienteSelected.serialize());
  }

  List<ProdutoDataTypeStruct> _Favoritos = [];
  List<ProdutoDataTypeStruct> get Favoritos => _Favoritos;
  set Favoritos(List<ProdutoDataTypeStruct> value) {
    _Favoritos = value;
    prefs.setStringList(
        'ff_Favoritos', value.map((x) => x.serialize()).toList());
  }

  void addToFavoritos(ProdutoDataTypeStruct value) {
    Favoritos.add(value);
    prefs.setStringList(
        'ff_Favoritos', _Favoritos.map((x) => x.serialize()).toList());
  }

  void removeFromFavoritos(ProdutoDataTypeStruct value) {
    Favoritos.remove(value);
    prefs.setStringList(
        'ff_Favoritos', _Favoritos.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFavoritos(int index) {
    Favoritos.removeAt(index);
    prefs.setStringList(
        'ff_Favoritos', _Favoritos.map((x) => x.serialize()).toList());
  }

  void updateFavoritosAtIndex(
    int index,
    ProdutoDataTypeStruct Function(ProdutoDataTypeStruct) updateFn,
  ) {
    Favoritos[index] = updateFn(_Favoritos[index]);
    prefs.setStringList(
        'ff_Favoritos', _Favoritos.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFavoritos(int index, ProdutoDataTypeStruct value) {
    Favoritos.insert(index, value);
    prefs.setStringList(
        'ff_Favoritos', _Favoritos.map((x) => x.serialize()).toList());
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
