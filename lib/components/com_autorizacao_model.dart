import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'com_autorizacao_widget.dart' show ComAutorizacaoWidget;
import 'package:flutter/material.dart';

class ComAutorizacaoModel extends FlutterFlowModel<ComAutorizacaoWidget> {
  ///  Local state fields for this component.

  bool bTimeActive = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (Frentistas)] action in LogInButton widget.
  ApiCallResponse? resultFrentistaAct;
  // Stores action output result for [Action Block - BuscaCartaoID] action in LogInButton widget.
  bool? actReturnFrentistaModal;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
