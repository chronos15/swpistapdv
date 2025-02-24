import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'com_autorizacao_widget.dart' show ComAutorizacaoWidget;
import 'package:flutter/material.dart';

class ComAutorizacaoModel extends FlutterFlowModel<ComAutorizacaoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (Frentistas)] action in LogInButton widget.
  ApiCallResponse? resultFrentistaAct;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
  }

  @override
  void dispose() {
    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();
  }
}
