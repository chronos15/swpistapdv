import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'tela_inicial_widget.dart' show TelaInicialWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TelaInicialModel extends FlutterFlowModel<TelaInicialWidget> {
  ///  Local state fields for this page.
  /// 0
  CombustiveisDataTypeStruct? combustivelSelected;
  void updateCombustivelSelectedStruct(
      Function(CombustiveisDataTypeStruct) updateFn) {
    updateFn(combustivelSelected ??= CombustiveisDataTypeStruct());
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

  bool btnVisible = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetToken)] action in TelaInicial widget.
  m_s_framework_flutter_p5iajh_api_calls_util.ApiCallResponse? getToken;
  // Stores action output result for [Action Block - VerificaTerminal] action in TelaInicial widget.
  bool? actReturnTerminal;
  // Stores action output result for [Backend Call - API (Combustiveis)] action in TelaInicial widget.
  ApiCallResponse? apiListaCombustivel;
  // Stores action output result for [Bottom Sheet - Filtros] action in IconButton widget.
  FiltrosAbastecimentoStruct? vFiltrosReturn;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // State field(s) for lvAbastecimentos widget.

  PagingController<ApiPagingParams, dynamic>? lvAbastecimentosPagingController;
  Function(ApiPagingParams nextPageMarker)? lvAbastecimentosApiCall;

  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (Combustiveis)] action in FloatingActionButton widget.
  ApiCallResponse? apiListaCombustivelRelolad;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    lvAbastecimentosPagingController?.dispose();
    sideBarModel.dispose();
    headerModel.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForLvAbastecimentos({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (lvAbastecimentosPagingController?.nextPageKey?.nextPageNumber ?? 0) >
              0;
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

  PagingController<ApiPagingParams, dynamic> setLvAbastecimentosController(
    Function(ApiPagingParams) apiCall,
  ) {
    lvAbastecimentosApiCall = apiCall;
    return lvAbastecimentosPagingController ??=
        _createLvAbastecimentosController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createLvAbastecimentosController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(lvAbastecimentosListaAbastecimentosPage);
  }

  void lvAbastecimentosListaAbastecimentosPage(
          ApiPagingParams nextPageMarker) =>
      lvAbastecimentosApiCall!(nextPageMarker)
          .then((lvAbastecimentosListaAbastecimentosResponse) {
        final pageItems = (ListaAbastecimentosCall.abastecimentos(
                  lvAbastecimentosListaAbastecimentosResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        lvAbastecimentosPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: lvAbastecimentosListaAbastecimentosResponse,
                )
              : null,
        );
      });
}
