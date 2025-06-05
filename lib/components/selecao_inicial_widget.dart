import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
  });

  final Future Function()? onTapedChoice;

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
      'buttonOnPageLoadAnimation': AnimationInfo(
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
          FFAppState().aFiltros.frentista.idFrentista >= 1,
          false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
                FFAppState().updateAFiltrosStruct(
                  (e) => e..frentista = null,
                );
                safeSetState(() {});
                await widget.onTapedChoice?.call();
              },
              text: valueOrDefault<String>(
                FFAppState().aFiltros.frentista.nomeFrentista,
                '--',
              ),
              icon: Icon(
                Icons.close_rounded,
                size: 20.0,
              ),
              options: FFButtonOptions(
                height: 35.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconColor: FlutterFlowTheme.of(context).error,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
          ),
        FlutterFlowChoiceChips(
          options: TPRegistro.values
              .map((e) => e.name)
              .toList()
              .map((label) => ChipData(label))
              .toList(),
          onChanged: (val) async {
            safeSetState(() => _model.choiceChipsValue = val?.firstOrNull);
            FFAppState().updateAFiltrosStruct(
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
            ['Todos'],
          ),
          wrapped: false,
        ),
      ].divide(SizedBox(width: 0.0)).addToEnd(SizedBox(width: 16.0)),
    );
  }
}
