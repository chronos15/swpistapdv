import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/com_autorizacao_widget.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'produtos_widget.dart' show ProdutosWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProdutosModel extends FlutterFlowModel<ProdutosWidget> {
  ///  Local state fields for this page.

  bool bListGrid = false;

  bool bFavorite = false;

  bool bLoadActive = false;

  int? iLoopAdd = 0;

  bool bResultLoop = true;

  List<ListaAbastecimentoDataTypeStruct> produtosabastecimentos = [];
  void addToProdutosabastecimentos(ListaAbastecimentoDataTypeStruct item) =>
      produtosabastecimentos.add(item);
  void removeFromProdutosabastecimentos(
          ListaAbastecimentoDataTypeStruct item) =>
      produtosabastecimentos.remove(item);
  void removeAtIndexFromProdutosabastecimentos(int index) =>
      produtosabastecimentos.removeAt(index);
  void insertAtIndexInProdutosabastecimentos(
          int index, ListaAbastecimentoDataTypeStruct item) =>
      produtosabastecimentos.insert(index, item);
  void updateProdutosabastecimentosAtIndex(
          int index, Function(ListaAbastecimentoDataTypeStruct) updateFn) =>
      produtosabastecimentos[index] = updateFn(produtosabastecimentos[index]);

  GrupoDataTypeStruct? aGrupoSearch;
  void updateAGrupoSearchStruct(Function(GrupoDataTypeStruct) updateFn) {
    updateFn(aGrupoSearch ??= GrupoDataTypeStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for pesquisa widget.
  FocusNode? pesquisaFocusNode;
  TextEditingController? pesquisaTextController;
  String? Function(BuildContext, String?)? pesquisaTextControllerValidator;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for StaggeredView widget.
  ScrollController? staggeredViewController;

  PagingController<ApiPagingParams, dynamic>? staggeredViewPagingController;
  Function(ApiPagingParams nextPageMarker)? staggeredViewApiCall;

  // Stores action output result for [Bottom Sheet - AlteraProduto] action in Container widget.
  double? actReturnAltProduto;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? returnFrentista;
  // Stores action output result for [Custom Action - updateDTListaAdd] action in Button widget.
  List<ListaAddAbastecimentoDataTypeStruct>? actUpdateDTLista;
  // Stores action output result for [Action Block - LancamentoDiversos] action in Button widget.
  bool? lancReturn;
  // Stores action output result for [Custom Action - addListToDTLancmento] action in Button widget.
  List<ListaAddAbastecimentoDataTypeStruct>? actReturnToREgister;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    staggeredViewController = ScrollController();
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    pesquisaFocusNode?.dispose();
    pesquisaTextController?.dispose();

    listViewController?.dispose();
    staggeredViewController?.dispose();
    staggeredViewPagingController?.dispose();
    sideBarModel.dispose();
  }

  /// Action blocks.
  Future lancamentoDiversosOnly(
    BuildContext context, {
    required List<ListaAddAbastecimentoDataTypeStruct>? listRegister,
  }) async {
    ApiCallResponse? apiResultAddOnly;

    iLoopAdd = 0;
    while (iLoopAdd! < listRegister!.length) {
      apiResultAddOnly = await AddAbastecimentoCall.call(
        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
            .ConfigGlobaisServer
            .host,
        token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
        listaAbastecimentoJson:
            (listRegister.elementAtOrNull(iLoopAdd!))?.toMap(),
      );

      if ((apiResultAddOnly.succeeded ?? true)) {
        if (AddAbastecimentoCall.returnID(
              (apiResultAddOnly.jsonBody ?? ''),
            )! >=
            1) {
          updateProdutosabastecimentosAtIndex(
            valueOrDefault<int>(
              iLoopAdd,
              0,
            ),
            (e) => e
              ..codAbastecimento = AddAbastecimentoCall.returnID(
                (apiResultAddOnly?.jsonBody ?? ''),
              ),
          );
          FFAppState().addToAbastecimentosSelecionados(
              produtosabastecimentos.elementAtOrNull(iLoopAdd!)!);
          bResultLoop = true;
          iLoopAdd = iLoopAdd! + 1;
        } else {
          bResultLoop = false;
          iLoopAdd = 200;
          await actions.loggerRegister(
            'Sem retorno de código abastecimento, verifique suas view e servidor! ${(apiResultAddOnly.jsonBody ?? '').toString()}',
            getCurrentRoute(context),
            4,
          );
          break;
        }
      } else {
        bResultLoop = false;
        iLoopAdd = 200;
        await actions.loggerRegister(
          'Falha ao comunicar com servidor ${(apiResultAddOnly.jsonBody ?? '').toString()}',
          getCurrentRoute(context),
          4,
        );
        break;
      }
    }
  }

  Future addProdutoOnList(
    BuildContext context, {
    required ProdutoDataTypeStruct? dtProduto,
    required double? iQuant,
  }) async {
    bool? returnFrentistaCopy;
    List<ListaAbastecimentoDataTypeStruct>? actreutnAdd;
    List<ListaAbastecimentoDataTypeStruct>? actreutnAddDefault;

    if (dtProduto?.combustivel != 'S') {
      if (FFAppState().FrentistaSelecionado.idFrentista <= 0) {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  width: 350.0,
                  child: ComAutorizacaoWidget(
                    cancelAction: () async {},
                    confirmAction: () async {},
                  ),
                ),
              ),
            );
          },
        ).then((value) => returnFrentistaCopy = value);

        if (returnFrentistaCopy!) {
          actreutnAdd = await actions.produtoDTUpdateCart(
            produtosabastecimentos.toList(),
            dtProduto,
            iQuant!,
          );
          produtosabastecimentos =
              actreutnAdd.toList().cast<ListaAbastecimentoDataTypeStruct>();
          return;
        } else {
          return;
        }
      } else {
        actreutnAddDefault = await actions.produtoDTUpdateCart(
          produtosabastecimentos.toList(),
          dtProduto,
          iQuant!,
        );
        produtosabastecimentos = actreutnAddDefault
            .toList()
            .cast<ListaAbastecimentoDataTypeStruct>();
        return;
      }
    }
  }

  /// Additional helper methods.
  Future waitForOnePageForStaggeredView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (staggeredViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setStaggeredViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    staggeredViewApiCall = apiCall;
    return staggeredViewPagingController ??=
        _createStaggeredViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createStaggeredViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(staggeredViewProdutosPage);
  }

  void staggeredViewProdutosPage(ApiPagingParams nextPageMarker) =>
      staggeredViewApiCall!(nextPageMarker)
          .then((staggeredViewProdutosResponse) {
        final pageItems = (ProdutosCall.value(
                  staggeredViewProdutosResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        staggeredViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: staggeredViewProdutosResponse,
                )
              : null,
        );
      });
}
