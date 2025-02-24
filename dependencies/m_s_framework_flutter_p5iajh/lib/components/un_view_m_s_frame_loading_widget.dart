import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_loading_model.dart';
export 'un_view_m_s_frame_loading_model.dart';

class UnViewMSFrameLoadingWidget extends StatefulWidget {
  const UnViewMSFrameLoadingWidget({super.key});

  @override
  State<UnViewMSFrameLoadingWidget> createState() =>
      _UnViewMSFrameLoadingWidgetState();
}

class _UnViewMSFrameLoadingWidgetState
    extends State<UnViewMSFrameLoadingWidget> {
  late UnViewMSFrameLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Lottie.asset(
        'dependencies/m_s_framework_flutter_p5iajh/assets/jsons/Animation_-_1730114846312.json',
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
        animate: true,
      ),
    );
  }
}
