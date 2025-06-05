import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'un_view_ms_senha_widget.dart' show UnViewMsSenhaWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnViewMsSenhaModel extends FlutterFlowModel<UnViewMsSenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for edtPath widget.
  FocusNode? edtPathFocusNode;
  TextEditingController? edtPathTextController;
  String? Function(BuildContext, String?)? edtPathTextControllerValidator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    edtPathFocusNode?.dispose();
    edtPathTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
