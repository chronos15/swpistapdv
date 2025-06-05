import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
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
      if (prefs.containsKey('ff_FrentistaSelecionado')) {
        try {
          final serializedData =
              prefs.getString('ff_FrentistaSelecionado') ?? '{}';
          _FrentistaSelecionado = FrentistasDataTypeStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
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
    _safeInit(() {
      _CondPagamentoList = prefs
              .getStringList('ff_CondPagamentoList')
              ?.map((x) {
                try {
                  return CondPagamentoDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _CondPagamentoList;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_VendaObj')) {
        try {
          final serializedData = prefs.getString('ff_VendaObj') ?? '{}';
          _VendaObj =
              VendaDTObjStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _paymmentsConfirmed = prefs
              .getStringList('ff_paymmentsConfirmed')
              ?.map((x) {
                try {
                  return PaymentDataTypeStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _paymmentsConfirmed;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ConfigLocaisStruct _ConfigLocais = ConfigLocaisStruct.fromSerializableMap(
      jsonDecode('{\"GatewayPgto\":\"Cielo\"}'));
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
    prefs.setString('ff_FrentistaSelecionado', value.serialize());
  }

  void updateFrentistaSelecionadoStruct(
      Function(FrentistasDataTypeStruct) updateFn) {
    updateFn(_FrentistaSelecionado);
    prefs.setString(
        'ff_FrentistaSelecionado', _FrentistaSelecionado.serialize());
  }

  ConfiguracaoDataTypeStruct _ConfigRemota =
      ConfiguracaoDataTypeStruct.fromSerializableMap(
          jsonDecode('{\"VLRPARC_MIN\":\"5.0\"}'));
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

  ClienteListaDataTypeStruct _ClienteSelected =
      ClienteListaDataTypeStruct.fromSerializableMap(jsonDecode(
          '{\"ID_CODIGO\":\"1\",\"NOME\":\"CONSUMIDOR\",\"DENOME\":\"CONSUMIDOR\"}'));
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

  List<ListaAddAbastecimentoDataTypeStruct> _ListaLancamentoDiversos = [];
  List<ListaAddAbastecimentoDataTypeStruct> get ListaLancamentoDiversos =>
      _ListaLancamentoDiversos;
  set ListaLancamentoDiversos(List<ListaAddAbastecimentoDataTypeStruct> value) {
    _ListaLancamentoDiversos = value;
  }

  void addToListaLancamentoDiversos(ListaAddAbastecimentoDataTypeStruct value) {
    ListaLancamentoDiversos.add(value);
  }

  void removeFromListaLancamentoDiversos(
      ListaAddAbastecimentoDataTypeStruct value) {
    ListaLancamentoDiversos.remove(value);
  }

  void removeAtIndexFromListaLancamentoDiversos(int index) {
    ListaLancamentoDiversos.removeAt(index);
  }

  void updateListaLancamentoDiversosAtIndex(
    int index,
    ListaAddAbastecimentoDataTypeStruct Function(
            ListaAddAbastecimentoDataTypeStruct)
        updateFn,
  ) {
    ListaLancamentoDiversos[index] = updateFn(_ListaLancamentoDiversos[index]);
  }

  void insertAtIndexInListaLancamentoDiversos(
      int index, ListaAddAbastecimentoDataTypeStruct value) {
    ListaLancamentoDiversos.insert(index, value);
  }

  List<CondPagamentoDataTypeStruct> _CondPagamentoList = [];
  List<CondPagamentoDataTypeStruct> get CondPagamentoList => _CondPagamentoList;
  set CondPagamentoList(List<CondPagamentoDataTypeStruct> value) {
    _CondPagamentoList = value;
    prefs.setStringList(
        'ff_CondPagamentoList', value.map((x) => x.serialize()).toList());
  }

  void addToCondPagamentoList(CondPagamentoDataTypeStruct value) {
    CondPagamentoList.add(value);
    prefs.setStringList('ff_CondPagamentoList',
        _CondPagamentoList.map((x) => x.serialize()).toList());
  }

  void removeFromCondPagamentoList(CondPagamentoDataTypeStruct value) {
    CondPagamentoList.remove(value);
    prefs.setStringList('ff_CondPagamentoList',
        _CondPagamentoList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCondPagamentoList(int index) {
    CondPagamentoList.removeAt(index);
    prefs.setStringList('ff_CondPagamentoList',
        _CondPagamentoList.map((x) => x.serialize()).toList());
  }

  void updateCondPagamentoListAtIndex(
    int index,
    CondPagamentoDataTypeStruct Function(CondPagamentoDataTypeStruct) updateFn,
  ) {
    CondPagamentoList[index] = updateFn(_CondPagamentoList[index]);
    prefs.setStringList('ff_CondPagamentoList',
        _CondPagamentoList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCondPagamentoList(
      int index, CondPagamentoDataTypeStruct value) {
    CondPagamentoList.insert(index, value);
    prefs.setStringList('ff_CondPagamentoList',
        _CondPagamentoList.map((x) => x.serialize()).toList());
  }

  FiltrosAbastecimentoStruct _aFiltros = FiltrosAbastecimentoStruct();
  FiltrosAbastecimentoStruct get aFiltros => _aFiltros;
  set aFiltros(FiltrosAbastecimentoStruct value) {
    _aFiltros = value;
  }

  void updateAFiltrosStruct(Function(FiltrosAbastecimentoStruct) updateFn) {
    updateFn(_aFiltros);
  }

  VendaDTObjStruct _VendaObj = VendaDTObjStruct();
  VendaDTObjStruct get VendaObj => _VendaObj;
  set VendaObj(VendaDTObjStruct value) {
    _VendaObj = value;
    prefs.setString('ff_VendaObj', value.serialize());
  }

  void updateVendaObjStruct(Function(VendaDTObjStruct) updateFn) {
    updateFn(_VendaObj);
    prefs.setString('ff_VendaObj', _VendaObj.serialize());
  }

  List<PaymentDataTypeStruct> _paymmentsConfirmed = [];
  List<PaymentDataTypeStruct> get paymmentsConfirmed => _paymmentsConfirmed;
  set paymmentsConfirmed(List<PaymentDataTypeStruct> value) {
    _paymmentsConfirmed = value;
    prefs.setStringList(
        'ff_paymmentsConfirmed', value.map((x) => x.serialize()).toList());
  }

  void addToPaymmentsConfirmed(PaymentDataTypeStruct value) {
    paymmentsConfirmed.add(value);
    prefs.setStringList('ff_paymmentsConfirmed',
        _paymmentsConfirmed.map((x) => x.serialize()).toList());
  }

  void removeFromPaymmentsConfirmed(PaymentDataTypeStruct value) {
    paymmentsConfirmed.remove(value);
    prefs.setStringList('ff_paymmentsConfirmed',
        _paymmentsConfirmed.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPaymmentsConfirmed(int index) {
    paymmentsConfirmed.removeAt(index);
    prefs.setStringList('ff_paymmentsConfirmed',
        _paymmentsConfirmed.map((x) => x.serialize()).toList());
  }

  void updatePaymmentsConfirmedAtIndex(
    int index,
    PaymentDataTypeStruct Function(PaymentDataTypeStruct) updateFn,
  ) {
    paymmentsConfirmed[index] = updateFn(_paymmentsConfirmed[index]);
    prefs.setStringList('ff_paymmentsConfirmed',
        _paymmentsConfirmed.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPaymmentsConfirmed(
      int index, PaymentDataTypeStruct value) {
    paymmentsConfirmed.insert(index, value);
    prefs.setStringList('ff_paymmentsConfirmed',
        _paymmentsConfirmed.map((x) => x.serialize()).toList());
  }

  bool _AsConnectPersisted = false;
  bool get AsConnectPersisted => _AsConnectPersisted;
  set AsConnectPersisted(bool value) {
    _AsConnectPersisted = value;
  }

  final _grupoDataManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> grupoData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _grupoDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGrupoDataCache() => _grupoDataManager.clear();
  void clearGrupoDataCacheKey(String? uniqueKey) =>
      _grupoDataManager.clearRequest(uniqueKey);
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
