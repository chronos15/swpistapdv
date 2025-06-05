import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'loading_native_model.dart';
export 'loading_native_model.dart';

class LoadingNativeWidget extends StatefulWidget {
  const LoadingNativeWidget({super.key});

  @override
  State<LoadingNativeWidget> createState() => _LoadingNativeWidgetState();
}

class _LoadingNativeWidgetState extends State<LoadingNativeWidget> {
  late LoadingNativeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingNativeModel());
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
      child: Container(
        width: 75.0,
        height: 75.0,
        child: custom_widgets.LoadingWidget(
          width: 75.0,
          height: 75.0,
          colorLoading: FlutterFlowTheme.of(context).primary,
          iStroke: 2.0,
        ),
      ),
    );
  }
}
