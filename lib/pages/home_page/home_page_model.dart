import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<Color> listPrimary = [
    Color(4278215917),
    Color(4293805124),
    Color(4294925568),
    Color(4280790610),
    Color(4294743629)
  ];
  void addToListPrimary(Color item) => listPrimary.add(item);
  void removeFromListPrimary(Color item) => listPrimary.remove(item);
  void removeAtIndexFromListPrimary(int index) => listPrimary.removeAt(index);
  void insertAtIndexInListPrimary(int index, Color item) =>
      listPrimary.insert(index, item);
  void updateListPrimaryAtIndex(int index, Function(Color) updateFn) =>
      listPrimary[index] = updateFn(listPrimary[index]);

  List<Color> listSecundary = [
    Color(4279078143),
    Color(4294743629),
    Color(4294921549),
    Color(4278234727),
    Color(4294941184)
  ];
  void addToListSecundary(Color item) => listSecundary.add(item);
  void removeFromListSecundary(Color item) => listSecundary.remove(item);
  void removeAtIndexFromListSecundary(int index) =>
      listSecundary.removeAt(index);
  void insertAtIndexInListSecundary(int index, Color item) =>
      listSecundary.insert(index, item);
  void updateListSecundaryAtIndex(int index, Function(Color) updateFn) =>
      listSecundary[index] = updateFn(listSecundary[index]);

  /// 0
  CombustiveisDataTypeStruct? combustivelSelected;
  void updateCombustivelSelectedStruct(
      Function(CombustiveisDataTypeStruct) updateFn) {
    updateFn(combustivelSelected ??= CombustiveisDataTypeStruct());
  }

  FiltrosAbastecimentoStruct? aFiltros;
  void updateAFiltrosStruct(Function(FiltrosAbastecimentoStruct) updateFn) {
    updateFn(aFiltros ??= FiltrosAbastecimentoStruct());
  }

  bool bListaAtiva = true;

  List<CombustiveisDataTypeStruct> valuesCombustiveis = [];
  void addToValuesCombustiveis(CombustiveisDataTypeStruct item) =>
      valuesCombustiveis.add(item);
  void removeFromValuesCombustiveis(CombustiveisDataTypeStruct item) =>
      valuesCombustiveis.remove(item);
  void removeAtIndexFromValuesCombustiveis(int index) =>
      valuesCombustiveis.removeAt(index);
  void insertAtIndexInValuesCombustiveis(
          int index, CombustiveisDataTypeStruct item) =>
      valuesCombustiveis.insert(index, item);
  void updateValuesCombustiveisAtIndex(
          int index, Function(CombustiveisDataTypeStruct) updateFn) =>
      valuesCombustiveis[index] = updateFn(valuesCombustiveis[index]);

  int? idBicoSelected = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Combustiveis)] action in HomePage widget.
  ApiCallResponse? apiListaCombustivel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Bottom Sheet - Filtros] action in IconButton widget.
  FiltrosAbastecimentoStruct? vFiltrosReturn;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewListaAbastecimentosPage);
  }

  void listViewListaAbastecimentosPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker)
          .then((listViewListaAbastecimentosResponse) {
        final pageItems = (ListaAbastecimentosCall.abastecimentos(
                  listViewListaAbastecimentosResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewListaAbastecimentosResponse,
                )
              : null,
        );
      });
}
