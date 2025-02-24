import '/components/un_view_ms_windows_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'un_view_m_s_frame_header_widget.dart' show UnViewMSFrameHeaderWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UnViewMSFrameHeaderModel
    extends FlutterFlowModel<UnViewMSFrameHeaderWidget> {
  ///  Local state fields for this component.

  bool openSearch = false;

  bool drawerIsAnimated = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered1 = false;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered2 = false;
  // State field(s) for pesquisa widget.
  FocusNode? pesquisaFocusNode;
  TextEditingController? pesquisaTextController;
  String? Function(BuildContext, String?)? pesquisaTextControllerValidator;
  // Model for unViewMsWindowsBar component.
  late UnViewMsWindowsBarModel unViewMsWindowsBarModel;

  @override
  void initState(BuildContext context) {
    unViewMsWindowsBarModel =
        createModel(context, () => UnViewMsWindowsBarModel());
  }

  @override
  void dispose() {
    pesquisaFocusNode?.dispose();
    pesquisaTextController?.dispose();

    unViewMsWindowsBarModel.dispose();
  }
}
