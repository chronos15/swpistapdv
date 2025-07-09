import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'virtual_keyboard_model.dart';
export 'virtual_keyboard_model.dart';

/// Create a component virtual keyboard number with edit
class VirtualKeyboardWidget extends StatefulWidget {
  const VirtualKeyboardWidget({
    super.key,
    required this.aValue,
    required this.vTotal,
  });

  final double? aValue;
  final double? vTotal;

  @override
  State<VirtualKeyboardWidget> createState() => _VirtualKeyboardWidgetState();
}

class _VirtualKeyboardWidgetState extends State<VirtualKeyboardWidget> {
  late VirtualKeyboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VirtualKeyboardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.sValue =
          functions.realFormatSCifrao(true, widget.aValue?.toString())!;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Text(
              'Digite o valor abaixo...',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.manrope(
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            _model.sValue,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.manrope(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kkswitchHorizontal,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              _model.asPercentage = !_model.asPercentage;
                              safeSetState(() {});
                              _model.sValue = functions.edtTextToCurrency(
                                  _model.sValue, !_model.asPercentage)!;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 1,
                    );
                    safeSetState(() {});
                  },
                  text: '1',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 2,
                    );
                    safeSetState(() {});
                  },
                  text: '2',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 3,
                    );
                    safeSetState(() {});
                  },
                  text: '3',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 4,
                    );
                    safeSetState(() {});
                  },
                  text: '4',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 5,
                    );
                    safeSetState(() {});
                  },
                  text: '5',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 6,
                    );
                    safeSetState(() {});
                  },
                  text: '6',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 7,
                    );
                    safeSetState(() {});
                  },
                  text: '7',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 8,
                    );
                    safeSetState(() {});
                  },
                  text: '8',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 9,
                    );
                    safeSetState(() {});
                  },
                  text: '9',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: -2,
                    );
                    safeSetState(() {});
                  },
                  text: '',
                  icon: Icon(
                    Icons.clear_rounded,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: 0,
                    );
                    safeSetState(() {});
                  },
                  text: '0',
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await _model.addOnEdit(
                      context,
                      iNumb: -1,
                    );
                    safeSetState(() {});
                  },
                  text: '',
                  icon: Icon(
                    Icons.backspace,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: 60.0,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: FlutterFlowTheme.of(context).error,
                    color: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            FFButtonWidget(
              onPressed: () async {
                Navigator.pop(
                    context,
                    _model.asPercentage
                        ? valueOrDefault<double>(
                            ((functions.stringToDouble(_model.sValue)!) *
                                    (widget.vTotal!)) /
                                100,
                            0.0,
                          )
                        : functions.stringToDouble(_model.sValue));
              },
              text: 'Confirmar',
              icon: Icon(
                Icons.check_rounded,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconAlignment: IconAlignment.end,
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconColor: FlutterFlowTheme.of(context).primary,
                color: Colors.transparent,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.manrope(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
          ].divide(SizedBox(height: 12.0)).addToStart(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
