import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'informa_valor_widget.dart' show InformaValorWidget;
import 'package:flutter/material.dart';

class InformaValorModel extends FlutterFlowModel<InformaValorWidget> {
  ///  Local state fields for this component.

  bool bHasInitialized = true;

  DTRetornoValorStruct? dtRetornoValor;
  void updateDtRetornoValorStruct(Function(DTRetornoValorStruct) updateFn) {
    updateFn(dtRetornoValor ??= DTRetornoValorStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for edtValueDefined widget.
  FocusNode? edtValueDefinedFocusNode;
  TextEditingController? edtValueDefinedTextController;
  String? Function(BuildContext, String?)?
      edtValueDefinedTextControllerValidator;
  // State field(s) for edtRecebidoTotal widget.
  FocusNode? edtRecebidoTotalFocusNode;
  TextEditingController? edtRecebidoTotalTextController;
  String? Function(BuildContext, String?)?
      edtRecebidoTotalTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    edtValueDefinedFocusNode?.dispose();
    edtValueDefinedTextController?.dispose();

    edtRecebidoTotalFocusNode?.dispose();
    edtRecebidoTotalTextController?.dispose();
  }
}
