import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selecao_inicial_model.dart';
export 'selecao_inicial_model.dart';

class SelecaoInicialWidget extends StatefulWidget {
  const SelecaoInicialWidget({
    super.key,
    this.onTapedChoice,
    bool? frentistaUpdated,
  }) : this.frentistaUpdated = frentistaUpdated ?? false;

  final Future Function()? onTapedChoice;
  final bool frentistaUpdated;

  @override
  State<SelecaoInicialWidget> createState() => _SelecaoInicialWidgetState();
}

class _SelecaoInicialWidgetState extends State<SelecaoInicialWidget>
    with TickerProviderStateMixin {
  late SelecaoInicialModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelecaoInicialModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 330.0.ms,
            duration: 600.0.ms,
            color: Color(0x7F0064ED),
            begin: 1.0,
            end: 0.0,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 110.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            color: Color(0x7F0064ED),
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'choiceChipsOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 270.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 270.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
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
    context.watch<FFAppState>();
    context.watch<m_s_framework_flutter_p5iajh_app_state.FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (valueOrDefault<bool>(
          FFAppState().aFiltrosAbastecimento.frentista.idFrentista >= 1,
          false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
                FFAppState().updateAFiltrosAbastecimentoStruct(
                  (e) => e..frentista = null,
                );
                safeSetState(() {});
                await widget.onTapedChoice?.call();
              },
              child: Container(
                height: 32.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).error,
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  children: [
                    Opacity(
                      opacity: 0.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).error,
                              size: 18.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState()
                                    .aFiltrosAbastecimento
                                    .frentista
                                    .nomeFrentista,
                                '--',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!widget.frentistaUpdated)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.close_rounded,
                              color: FlutterFlowTheme.of(context).error,
                              size: 18.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState()
                                    .aFiltrosAbastecimento
                                    .frentista
                                    .nomeFrentista,
                                '--',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                  ],
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        FlutterFlowChoiceChips(
          options: [
            ChipData('Todos   '),
            ChipData('Abastecimentos   '),
            ChipData('Diversos   ')
          ],
          onChanged: (val) async {
            safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
            FFAppState().updateAFiltrosAbastecimentoStruct(
              (e) => e
                ..tPRegistro =
                    functions.enumStringTPToEnum(_model.choiceChipsValue),
            );
            safeSetState(() {});
            await widget.onTapedChoice?.call();
          },
          selectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            iconColor: FlutterFlowTheme.of(context).info,
            iconSize: 10.0,
            labelPadding: EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(50.0),
          ),
          unselectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.manrope(
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryBackground,
            iconSize: 13.0,
            labelPadding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            elevation: 0.0,
            borderColor: FlutterFlowTheme.of(context).alternate,
            borderRadius: BorderRadius.circular(50.0),
          ),
          chipSpacing: 5.0,
          rowSpacing: 8.0,
          multiselect: false,
          initialized: _model.choiceChipsValue != null,
          alignment: WrapAlignment.start,
          controller: _model.choiceChipsValueController ??=
              FormFieldController<List<String>>(
            ['Todos   '],
          ),
          wrapped: false,
        ).animateOnPageLoad(animationsMap['choiceChipsOnPageLoadAnimation']!),
      ].divide(SizedBox(width: 0.0)).addToEnd(SizedBox(width: 0.0)),
    );
  }
}
