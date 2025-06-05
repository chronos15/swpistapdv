import '/flutter_flow/flutter_flow_util.dart';
import 'altera_produto_widget.dart' show AlteraProdutoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AlteraProdutoModel extends FlutterFlowModel<AlteraProdutoWidget> {
  ///  Local state fields for this component.

  double? aQuant = 1.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
