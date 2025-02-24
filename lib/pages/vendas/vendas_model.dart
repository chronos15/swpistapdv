import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'vendas_widget.dart' show VendasWidget;
import 'package:flutter/material.dart';

class VendasModel extends FlutterFlowModel<VendasWidget> {
  ///  Local state fields for this page.

  List<String> choiceSelected = [];
  void addToChoiceSelected(String item) => choiceSelected.add(item);
  void removeFromChoiceSelected(String item) => choiceSelected.remove(item);
  void removeAtIndexFromChoiceSelected(int index) =>
      choiceSelected.removeAt(index);
  void insertAtIndexInChoiceSelected(int index, String item) =>
      choiceSelected.insert(index, item);
  void updateChoiceSelectedAtIndex(int index, Function(String) updateFn) =>
      choiceSelected[index] = updateFn(choiceSelected[index]);

  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
