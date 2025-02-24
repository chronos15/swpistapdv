import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'selecionar_cidades_widget.dart' show SelecionarCidadesWidget;
import 'package:flutter/material.dart';

class SelecionarCidadesModel extends FlutterFlowModel<SelecionarCidadesWidget> {
  ///  Local state fields for this component.

  CidadesDataTypeStruct? selected;
  void updateSelectedStruct(Function(CidadesDataTypeStruct) updateFn) {
    updateFn(selected ??= CidadesDataTypeStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
