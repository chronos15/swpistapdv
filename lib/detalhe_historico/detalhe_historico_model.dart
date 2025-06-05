import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'detalhe_historico_widget.dart' show DetalheHistoricoWidget;
import 'package:flutter/material.dart';

class DetalheHistoricoModel extends FlutterFlowModel<DetalheHistoricoWidget> {
  ///  Local state fields for this page.

  VendasStruct? dtHistorico;
  void updateDtHistoricoStruct(Function(VendasStruct) updateFn) {
    updateFn(dtHistorico ??= VendasStruct());
  }

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<VendaitemStruct>();
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
    paginatedDataTableController.dispose();
  }
}
