import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'filtros_widget.dart' show FiltrosWidget;
import 'package:flutter/material.dart';

class FiltrosModel extends FlutterFlowModel<FiltrosWidget> {
  ///  Local state fields for this component.

  FiltrosAbastecimentoStruct? aFiltros;
  void updateAFiltrosStruct(Function(FiltrosAbastecimentoStruct) updateFn) {
    updateFn(aFiltros ??= FiltrosAbastecimentoStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - SelecionarFrentista] action in Container widget.
  FrentistasDataTypeStruct? actFrentistaSelected;
  // Stores action output result for [Custom Action - datePickerRangerCustom] action in Container widget.
  DateTimeRange? actDateReturn;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
