import '/flutter_flow/flutter_flow_util.dart';
import 'info_senha_dia_widget.dart' show InfoSenhaDiaWidget;
import 'package:flutter/material.dart';

class InfoSenhaDiaModel extends FlutterFlowModel<InfoSenhaDiaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

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
