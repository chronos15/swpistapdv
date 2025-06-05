import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historico_page_widget.dart' show HistoricoPageWidget;
import 'package:flutter/material.dart';

class HistoricoPageModel extends FlutterFlowModel<HistoricoPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - datePickerRangerCustom] action in IconButton widget.
  DateTimeRange? actReturnDT;
  // Model for SideBar component.
  late SideBarModel sideBarModel;

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    sideBarModel.dispose();
  }
}
