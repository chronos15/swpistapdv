import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'virtual_keyboard_widget.dart' show VirtualKeyboardWidget;
import 'package:flutter/material.dart';

class VirtualKeyboardModel extends FlutterFlowModel<VirtualKeyboardWidget> {
  ///  Local state fields for this component.

  String sValue = 'R\$ 0,00';

  bool asPercentage = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future addOnEdit(
    BuildContext context, {
    required int? iNumb,
  }) async {
    sValue = functions.edtTextToCurrency(
        functions.atualizaStringDigitado(iNumb, sValue), !asPercentage)!;
  }
}
