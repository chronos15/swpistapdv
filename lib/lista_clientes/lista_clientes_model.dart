import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'lista_clientes_widget.dart' show ListaClientesWidget;
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListaClientesModel extends FlutterFlowModel<ListaClientesWidget> {
  ///  Local state fields for this page.

  CidadesDataTypeStruct? cidadeSelected;
  void updateCidadeSelectedStruct(Function(CidadesDataTypeStruct) updateFn) {
    updateFn(cidadeSelected ??= CidadesDataTypeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ccFiltro widget.
  FormFieldController<List<String>>? ccFiltroValueController;
  String? get ccFiltroValue => ccFiltroValueController?.value?.firstOrNull;
  set ccFiltroValue(String? val) =>
      ccFiltroValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Bottom Sheet - SelecionarCidades] action in ccFiltro widget.
  CidadesDataTypeStruct? actReturnCidade;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewPagingController?.dispose();
    sideBarModel.dispose();
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
    return controller..addPageRequestListener(listViewClientesPage);
  }

  void listViewClientesPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewClientesResponse) {
        final pageItems = (ClientesCall.value(
                  listViewClientesResponse.jsonBody,
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
                  lastResponse: listViewClientesResponse,
                )
              : null,
        );
      });
}
