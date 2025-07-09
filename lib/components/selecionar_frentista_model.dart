import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'selecionar_frentista_widget.dart' show SelecionarFrentistaWidget;
import 'package:flutter/material.dart';

class SelecionarFrentistaModel
    extends FlutterFlowModel<SelecionarFrentistaWidget> {
  ///  Local state fields for this component.

  FrentistasDataTypeStruct? selectedLocal;
  void updateSelectedLocalStruct(Function(FrentistasDataTypeStruct) updateFn) {
    updateFn(selectedLocal ??= FrentistasDataTypeStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  bool? actFrentistaSelected;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
