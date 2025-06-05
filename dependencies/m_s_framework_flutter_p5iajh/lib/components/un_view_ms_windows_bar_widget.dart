import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_ms_windows_bar_model.dart';
export 'un_view_ms_windows_bar_model.dart';

class UnViewMsWindowsBarWidget extends StatefulWidget {
  const UnViewMsWindowsBarWidget({super.key});

  @override
  State<UnViewMsWindowsBarWidget> createState() =>
      _UnViewMsWindowsBarWidgetState();
}

class _UnViewMsWindowsBarWidgetState extends State<UnViewMsWindowsBarWidget> {
  late UnViewMsWindowsBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMsWindowsBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        width: 140.0,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.minimize_outlined,
                color: FlutterFlowTheme.of(context).alternate,
                size: 20.0,
              ),
              onPressed: () async {
                await actions.handleWindowAction(
                  1,
                );
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.fullscreen_rounded,
                color: FlutterFlowTheme.of(context).alternate,
                size: 20.0,
              ),
              onPressed: () async {
                await actions.handleWindowAction(
                  2,
                );
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).error,
                size: 20.0,
              ),
              onPressed: () async {
                await actions.handleWindowAction(
                  3,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
