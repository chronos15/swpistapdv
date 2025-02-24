import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  bool finishsucess = false;

  int? idPgto;

  String sDescricaoPgto = '';

  bool pgtoSucess = false;

  bool activeFormCliente = false;

  VendasRemReturnStruct? vendaRemUpdated;
  void updateVendaRemUpdatedStruct(Function(VendasRemReturnStruct) updateFn) {
    updateFn(vendaRemUpdated ??= VendasRemReturnStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Action Block - ConfirmaVenda] action in Finish widget.
  dynamic actReturn;
  // State field(s) for edtNomeCliente widget.
  FocusNode? edtNomeClienteFocusNode;
  TextEditingController? edtNomeClienteTextController;
  String? Function(BuildContext, String?)?
      edtNomeClienteTextControllerValidator;
  // Stores action output result for [Bottom Sheet - SelecionarCliente] action in IconButton widget.
  ClienteListaDataTypeStruct? actClienteReturn;
  // State field(s) for edtCPFCliente widget.
  FocusNode? edtCPFClienteFocusNode;
  TextEditingController? edtCPFClienteTextController;
  String? Function(BuildContext, String?)? edtCPFClienteTextControllerValidator;
  // Stores action output result for [Backend Call - API (ConsultaCNPJ)] action in IconButton widget.
  m_s_framework_flutter_p5iajh_api_calls_util.ApiCallResponse? apiResultj0x;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    edtNomeClienteFocusNode?.dispose();
    edtNomeClienteTextController?.dispose();

    edtCPFClienteFocusNode?.dispose();
    edtCPFClienteTextController?.dispose();
  }

  /// Action blocks.
  Future<dynamic> confirmaVenda(BuildContext context) async {
    ApiCallResponse? apiResult1xu;

    FFAppState().updateVendaStruct(
      (e) => e
        ..idCliente = FFAppState().ClienteSelected.idCodigo
        ..datavenda = dateTimeFormat(
          "yyyy-MM-dd",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        )
        ..hora = dateTimeFormat(
          "HH:mm",
          getCurrentTimestamp,
          locale: FFLocalizations.of(context).languageCode,
        )
        ..idVendedor = currentUserData?.idCodigo
        ..percDesc = 0
        ..desconto = 0
        ..entrada = 0
        ..idFormapgto = idPgto
        ..descrtpvenda = sDescricaoPgto
        ..usuario = currentUserData?.usuario
        ..vendaitemRem = functions
            .listAbastToItensDT(
                FFAppState().AbastecimentosSelecionados.toList(),
                0,
                1,
                currentUserData!.usuario,
                currentUserData!.idCodigo)
            .toList()
        ..mobile = 'S'
        ..numeroitens = FFAppState().AbastecimentosSelecionados.length
        ..totalprodutos = functions.sumListDouble(FFAppState()
            .AbastecimentosSelecionados
            .map((e) => e.vlrtotal)
            .toList()
            .toList())
        ..totalvenda = functions.sumListDouble(FFAppState()
            .AbastecimentosSelecionados
            .map((e) => e.vlrtotal)
            .toList()
            .toList())
        ..nomeCliente = FFAppState().ClienteSelected.nome
        ..cpfcnpj = FFAppState().ClienteSelected.cpfcnpj,
    );
    apiResult1xu = await VendaCall.call(
      ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .host,
      token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      vendajsonJson: FFAppState().venda.toMap(),
    );

    if ((apiResult1xu.succeeded ?? true)) {
      FFAppState().addToHistoricoVendas(FFAppState().venda);
      await Clipboard.setData(
          ClipboardData(text: (apiResult1xu.jsonBody ?? '').toString()));
      FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
      FFAppState().AbastecimentosSelecionados = [];
      pgtoSucess = false;
      vendaRemUpdated = VendasRemReturnStruct.maybeFromMap(getJsonField(
        (apiResult1xu.jsonBody ?? ''),
        r'''$''',
      ));
      return (apiResult1xu.jsonBody ?? '');
    }

    return null;
  }
}
