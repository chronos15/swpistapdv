import '/flutter_flow/flutter_flow_util.dart';
import 'leitor_cartao_widget.dart' show LeitorCartaoWidget;
import 'package:flutter/material.dart';

class LeitorCartaoModel extends FlutterFlowModel<LeitorCartaoWidget> {
  ///  Local state fields for this component.

  bool nfcOpen = false;

  String? sIDCartao;

  bool qrOpen = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - BuscaCartaoID] action in Button widget.
  bool? actFromManual;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
