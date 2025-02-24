import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_message_box_model.dart';
export 'un_view_m_s_frame_message_box_model.dart';

class UnViewMSFrameMessageBoxWidget extends StatefulWidget {
  const UnViewMSFrameMessageBoxWidget({
    super.key,
    this.actConfirm,
    this.actCancel,
    required this.sTitulo,
    required this.sText,
    required this.colorConfirm,
    required this.colorCancel,
    bool? enableCancel,
    String? sTextoConfirm,
    String? sTextoCancel,
    Color? colorTextButtonConfirm,
    this.colorTextButtonCancel,
  })  : this.enableCancel = enableCancel ?? false,
        this.sTextoConfirm = sTextoConfirm ?? 'Confirma',
        this.sTextoCancel = sTextoCancel ?? 'Cancelar',
        this.colorTextButtonConfirm = colorTextButtonConfirm ?? Colors.white;

  final Future Function()? actConfirm;
  final Future Function()? actCancel;
  final String? sTitulo;
  final String? sText;
  final Color? colorConfirm;
  final Color? colorCancel;
  final bool enableCancel;
  final String sTextoConfirm;
  final String sTextoCancel;
  final Color colorTextButtonConfirm;
  final Color? colorTextButtonCancel;

  @override
  State<UnViewMSFrameMessageBoxWidget> createState() =>
      _UnViewMSFrameMessageBoxWidgetState();
}

class _UnViewMSFrameMessageBoxWidgetState
    extends State<UnViewMSFrameMessageBoxWidget> with TickerProviderStateMixin {
  late UnViewMSFrameMessageBoxModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameMessageBoxModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).error,
            begin: 0.12,
            end: 1.0,
          ),
        ],
      ),
    });
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
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          minHeight: 180.0,
          maxHeight: 260.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AnimatedDefaultTextStyle(
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                          child: Text(
                            valueOrDefault<String>(
                              widget!.sTitulo,
                              'Atenção',
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget!.sText,
                            '-',
                          ),
                          maxLines: 3,
                          minFontSize: 12.0,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Outfit',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 1.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget.actConfirm?.call();
                                Navigator.pop(context);
                              },
                              text: widget!.sTextoConfirm,
                              options: FFButtonOptions(
                                width: 140.0,
                                height: 45.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: widget!.colorConfirm,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: valueOrDefault<Color>(
                                        widget!.colorTextButtonConfirm,
                                        FlutterFlowTheme.of(context).info,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          ),
                          if (widget!.enableCancel)
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await widget.actCancel?.call();
                                },
                                text: widget!.sTextoCancel,
                                options: FFButtonOptions(
                                  width: 140.0,
                                  height: 45.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: widget!.colorCancel,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: valueOrDefault<Color>(
                                          widget!.colorTextButtonCancel,
                                          FlutterFlowTheme.of(context).error,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToEnd(SizedBox(width: 0.0)),
                      ),
                    ),
                  ),
                ]
                    .addToStart(SizedBox(height: 15.0))
                    .addToEnd(SizedBox(height: 10.0)),
              ),
            ),
            if (!widget!.enableCancel)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                  child: FlutterFlowIconButton(
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
                      Navigator.pop(context);
                    },
                  ).animateOnPageLoad(
                      animationsMap['iconButtonOnPageLoadAnimation']!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
