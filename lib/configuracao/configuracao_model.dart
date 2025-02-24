import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'configuracao_widget.dart' show ConfiguracaoWidget;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_configuracao_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/flutter_flow_util.dart'
    as m_s_framework_flutter_p5iajh_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:flutter/material.dart';

class ConfiguracaoModel extends FlutterFlowModel<ConfiguracaoWidget> {
  ///  Local state fields for this page.

  bool advancedMode = false;

  ///  State fields for stateful widgets in this page.

  // Model for unViewMSConfiguracao component.
  late m_s_framework_flutter_p5iajh.UnViewMSConfiguracaoModel
      unViewMSConfiguracaoModel;

  @override
  void initState(BuildContext context) {
    unViewMSConfiguracaoModel = m_s_framework_flutter_p5iajh_util.createModel(
        context,
        () => m_s_framework_flutter_p5iajh.UnViewMSConfiguracaoModel());
  }

  @override
  void dispose() {
    unViewMSConfiguracaoModel.dispose();
  }
}
