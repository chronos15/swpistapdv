import '/backend/schema/structs/index.dart';
import '/components/un_view_m_s_frame_scanner_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'un_view_m_s_configuracao_widget.dart' show UnViewMSConfiguracaoWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class UnViewMSConfiguracaoModel
    extends FlutterFlowModel<UnViewMSConfiguracaoWidget> {
  ///  Local state fields for this component.

  bool advancedMode = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tbSettings widget.
  TabController? tbSettingsController;
  int get tbSettingsCurrentIndex =>
      tbSettingsController != null ? tbSettingsController!.index : 0;

  // Stores action output result for [Bottom Sheet - unViewMSFrameScanner] action in IconButton widget.
  String? actReturnQrcode;
  // Stores action output result for [Custom Action - getClipboardText] action in IconButton widget.
  String? actReturnPast;
  // Stores action output result for [Custom Action - loadIniFileFromPicker] action in IconButton widget.
  List<String>? returnByFilePicker;
  // State field(s) for chaveAcesso widget.
  FocusNode? chaveAcessoFocusNode;
  TextEditingController? chaveAcessoTextController;
  String? Function(BuildContext, String?)? chaveAcessoTextControllerValidator;
  // State field(s) for edtPath widget.
  FocusNode? edtPathFocusNode;
  TextEditingController? edtPathTextController;
  String? Function(BuildContext, String?)? edtPathTextControllerValidator;
  String? _edtPathTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, informe o Path do Servidor';
    }

    return null;
  }

  // State field(s) for edtCNPJ widget.
  FocusNode? edtCNPJFocusNode;
  TextEditingController? edtCNPJTextController;
  final edtCNPJMask = MaskTextInputFormatter(mask: '##.###.###/####-##');
  String? Function(BuildContext, String?)? edtCNPJTextControllerValidator;
  String? _edtCNPJTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o CNPJ';
    }

    return null;
  }

  // State field(s) for edtHost1 widget.
  FocusNode? edtHost1FocusNode;
  TextEditingController? edtHost1TextController;
  String? Function(BuildContext, String?)? edtHost1TextControllerValidator;
  String? _edtHost1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o IP primário do Server';
    }

    return null;
  }

  // State field(s) for edtHost2 widget.
  FocusNode? edtHost2FocusNode;
  TextEditingController? edtHost2TextController;
  String? Function(BuildContext, String?)? edtHost2TextControllerValidator;
  // State field(s) for edtHost3 widget.
  FocusNode? edtHost3FocusNode;
  TextEditingController? edtHost3TextController;
  String? Function(BuildContext, String?)? edtHost3TextControllerValidator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode1;
  TextEditingController? emailAddressFieldTextController1;
  String? Function(BuildContext, String?)?
      emailAddressFieldTextController1Validator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode2;
  TextEditingController? emailAddressFieldTextController2;
  String? Function(BuildContext, String?)?
      emailAddressFieldTextController2Validator;
  // State field(s) for ckbEasyHttp widget.
  bool? ckbEasyHttpValue;
  // State field(s) for ckbEasyHttps widget.
  bool? ckbEasyHttpsValue;
  // Stores action output result for [Custom Action - decryptAES256] action in LogInButton widget.
  String? chaveDecriptada;

  @override
  void initState(BuildContext context) {
    edtPathTextControllerValidator = _edtPathTextControllerValidator;
    edtCNPJTextControllerValidator = _edtCNPJTextControllerValidator;
    edtHost1TextControllerValidator = _edtHost1TextControllerValidator;
  }

  @override
  void dispose() {
    tbSettingsController?.dispose();
    chaveAcessoFocusNode?.dispose();
    chaveAcessoTextController?.dispose();

    edtPathFocusNode?.dispose();
    edtPathTextController?.dispose();

    edtCNPJFocusNode?.dispose();
    edtCNPJTextController?.dispose();

    edtHost1FocusNode?.dispose();
    edtHost1TextController?.dispose();

    edtHost2FocusNode?.dispose();
    edtHost2TextController?.dispose();

    edtHost3FocusNode?.dispose();
    edtHost3TextController?.dispose();

    emailAddressFieldFocusNode1?.dispose();
    emailAddressFieldTextController1?.dispose();

    emailAddressFieldFocusNode2?.dispose();
    emailAddressFieldTextController2?.dispose();
  }
}
