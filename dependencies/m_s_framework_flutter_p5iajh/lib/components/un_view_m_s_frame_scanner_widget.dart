import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_scanner_model.dart';
export 'un_view_m_s_frame_scanner_model.dart';

class UnViewMSFrameScannerWidget extends StatefulWidget {
  const UnViewMSFrameScannerWidget({
    super.key,
    this.actReturnCallBack,
    bool? bActiveClose,
  }) : this.bActiveClose = bActiveClose ?? false;

  final Future Function(String valueReturn)? actReturnCallBack;
  final bool bActiveClose;

  @override
  State<UnViewMSFrameScannerWidget> createState() =>
      _UnViewMSFrameScannerWidgetState();
}

class _UnViewMSFrameScannerWidgetState
    extends State<UnViewMSFrameScannerWidget> {
  late UnViewMSFrameScannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameScannerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.ScannerWidget(
            width: double.infinity,
            height: double.infinity,
            actReturn: (sReturn) async {
              unawaited(
                () async {
                  await widget.actReturnCallBack?.call(
                    sReturn!,
                  );
                }(),
              );
              Navigator.pop(context, sReturn);
            },
          ),
        ),
        if (widget!.bActiveClose)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).error,
                size: 24.0,
              ),
              onPressed: () async {
                unawaited(
                  () async {
                    await widget.actReturnCallBack?.call(
                      '',
                    );
                  }(),
                );
                Navigator.pop(context);
              },
            ),
          ),
      ],
    );
  }
}
