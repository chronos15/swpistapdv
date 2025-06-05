import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'vale_combustivel_widget.dart' show ValeCombustivelWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class ValeCombustivelModel extends FlutterFlowModel<ValeCombustivelWidget> {
  ///  Local state fields for this component.

  List<ValeCombustivelDataTypeStruct> valesSelected = [];
  void addToValesSelected(ValeCombustivelDataTypeStruct item) =>
      valesSelected.add(item);
  void removeFromValesSelected(ValeCombustivelDataTypeStruct item) =>
      valesSelected.remove(item);
  void removeAtIndexFromValesSelected(int index) =>
      valesSelected.removeAt(index);
  void insertAtIndexInValesSelected(
          int index, ValeCombustivelDataTypeStruct item) =>
      valesSelected.insert(index, item);
  void updateValesSelectedAtIndex(
          int index, Function(ValeCombustivelDataTypeStruct) updateFn) =>
      valesSelected[index] = updateFn(valesSelected[index]);

  bool bValesSelect = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (ValeCombustivelLista)] action in IconButton widget.
  ApiCallResponse? apiResultkf3QR;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ValeCombustivelLista)] action in Button widget.
  ApiCallResponse? apiResultkf3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future addOrRemoveList(
    BuildContext context, {
    required ValeCombustivelDataTypeStruct? valueDT,
  }) async {
    if ((valueDT?.sndisponivel == 'N') || (valueDT!.totalreq <= 0.0)) {
      await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
        context,
        'Atenção',
        'Vale combustível não disponível ou valor igual ou inferior a zero.',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondaryBackground,
        350.0,
        'bottomcenter',
        'frombottom',
        Color(0xFFFFAC00),
        'https://cdn-icons-png.flaticon.com/512/595/595067.png',
      );
    } else {
      if (valesSelected.contains(valueDT)) {
        removeFromValesSelected(valueDT);
        await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
          context,
          'Atenção',
          'Vale combustível removido da listagem!',
          FlutterFlowTheme.of(context).primaryText,
          FlutterFlowTheme.of(context).secondaryBackground,
          350.0,
          'bottomcenter',
          'frombottom',
          FlutterFlowTheme.of(context).error,
          'https://img.icons8.com/fluent-systems-regular/512/FA5252/trash.png',
        );
      } else {
        addToValesSelected(valueDT);
        await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
          context,
          'Adicionado',
          'Vale combustível adicionado com sucesso a listagem!',
          FlutterFlowTheme.of(context).primaryText,
          FlutterFlowTheme.of(context).secondaryBackground,
          350.0,
          'bottomcenter',
          'frombottom',
          FlutterFlowTheme.of(context).success,
          'https://cdn-icons-png.flaticon.com/256/5709/5709755.png',
        );
      }
    }
  }
}
