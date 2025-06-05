import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'parcelamento_model.dart';
export 'parcelamento_model.dart';

class ParcelamentoWidget extends StatefulWidget {
  const ParcelamentoWidget({
    super.key,
    required this.condPagDt,
    required this.valorTotal,
  });

  final CondPagamentoDataTypeStruct? condPagDt;
  final double? valorTotal;

  @override
  State<ParcelamentoWidget> createState() => _ParcelamentoWidgetState();
}

class _ParcelamentoWidgetState extends State<ParcelamentoWidget> {
  late ParcelamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParcelamentoModel());
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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  Color(0xFF9B3EFF)
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(7.0),
                topRight: Radius.circular(7.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.chevron_left_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Parcelamento',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                            Text(
                              'Escolha a quantidade de parcelas para seu pagamento',
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
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        FFIcons.kkcreditCard,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                    ].divide(SizedBox(width: 5.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0x7663A6FF),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions.realFormatSCifrao(
                                  true, widget.valorTotal?.toString()),
                              'R\$ 0,00',
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(height: 7.0))
                  .addToStart(SizedBox(height: 7.0))
                  .addToEnd(SizedBox(height: 7.0)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Builder(
                builder: (context) {
                  final quantParcelamento = functions
                          .geraParcelas(
                              widget.valorTotal?.toString(),
                              valueOrDefault<int>(
                                widget.condPagDt?.numeroPar,
                                1,
                              ))
                          ?.toList() ??
                      [];

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: quantParcelamento.length,
                    separatorBuilder: (_, __) => SizedBox(height: 5.0),
                    itemBuilder: (context, quantParcelamentoIndex) {
                      final quantParcelamentoItem =
                          quantParcelamento[quantParcelamentoIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if ((functions.stringToDouble(getJsonField(
                                    quantParcelamentoItem,
                                    r'''$..valor''',
                                  ).toString())! <
                                  FFAppState().ConfigRemota.vlrparcMin) &&
                              (functions.strToInt(getJsonField(
                                    quantParcelamentoItem,
                                    r'''$..parcela''',
                                  ).toString()) >=
                                  2)) {
                            await m_s_framework_flutter_p5iajh_actions
                                .elegantNotificationCustom(
                              context,
                              'Atenção',
                              'Valor mínimo para parcelamento deve ser maior que ${valueOrDefault<String>(
                                functions.realFormatSCifrao(
                                    true,
                                    valueOrDefault<String>(
                                      FFAppState()
                                          .ConfigRemota
                                          .vlrparcMin
                                          .toString(),
                                      '0',
                                    )),
                                'R\$ 0,00',
                              )}',
                              Colors.white,
                              Color(0xFFFFBA00),
                              340.0,
                              'bottomcenter',
                              'frombottom',
                              FlutterFlowTheme.of(context).customPrimary,
                              'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                            );
                          } else {
                            _model.iParcelas = getJsonField(
                              quantParcelamentoItem,
                              r'''$..parcela''',
                            );
                            safeSetState(() {});
                          }
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                () {
                                  if ((functions.stringToDouble(getJsonField(
                                            quantParcelamentoItem,
                                            r'''$..valor''',
                                          ).toString())! <
                                          FFAppState()
                                              .ConfigRemota
                                              .vlrparcMin) &&
                                      (functions.strToInt(getJsonField(
                                            quantParcelamentoItem,
                                            r'''$..parcela''',
                                          ).toString()) >=
                                          2)) {
                                    return Color(0x8DE0E3E7);
                                  } else if (_model.iParcelas ==
                                      getJsonField(
                                        quantParcelamentoItem,
                                        r'''$..parcela''',
                                      )) {
                                    return Color(0x4BA0C8FF);
                                  } else {
                                    return FlutterFlowTheme.of(context)
                                        .secondaryBackground;
                                  }
                                }(),
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  _model.iParcelas ==
                                          getJsonField(
                                            quantParcelamentoItem,
                                            r'''$..parcela''',
                                          )
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).alternate,
                                  FlutterFlowTheme.of(context).alternate,
                                ),
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 16.0, 16.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if ((_model.iParcelas !=
                                                getJsonField(
                                                  quantParcelamentoItem,
                                                  r'''$..parcela''',
                                                )) &&
                                            (functions.stringToDouble(
                                                    getJsonField(
                                                  quantParcelamentoItem,
                                                  r'''$..valor''',
                                                ).toString())! >=
                                                valueOrDefault<double>(
                                                  FFAppState()
                                                      .ConfigRemota
                                                      .vlrparcMin,
                                                  5.0,
                                                )))
                                          Icon(
                                            Icons.radio_button_off_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        if ((functions.stringToDouble(
                                                    getJsonField(
                                                  quantParcelamentoItem,
                                                  r'''$..valor''',
                                                ).toString())! <
                                                valueOrDefault<double>(
                                                  FFAppState()
                                                      .ConfigRemota
                                                      .vlrparcMin,
                                                  5.0,
                                                )) &&
                                            (functions.strToInt(getJsonField(
                                                  quantParcelamentoItem,
                                                  r'''$..parcela''',
                                                ).toString()) >=
                                                2))
                                          Icon(
                                            FFIcons.kkcircleX,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                        if (_model.iParcelas ==
                                            getJsonField(
                                              quantParcelamentoItem,
                                              r'''$..parcela''',
                                            ))
                                          Icon(
                                            Icons.radio_button_checked_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        Text(
                                          '${getJsonField(
                                            quantParcelamentoItem,
                                            r'''$..parcela''',
                                          ).toString()}x',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.realFormatSCifrao(
                                                true,
                                                getJsonField(
                                                  quantParcelamentoItem,
                                                  r'''$..valor''',
                                                ).toString()),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x4BA0C8FF),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Text(
                                        'sem juros',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
              child: FFButtonWidget(
                onPressed: (_model.iParcelas! <= 0)
                    ? null
                    : () async {
                        Navigator.pop(context, _model.iParcelas);
                      },
                text: 'Confirmar pagamento',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(7.0),
                  disabledColor: FlutterFlowTheme.of(context).alternate,
                  disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
            ),
          ),
        ].divide(SizedBox(height: 24.0)),
      ),
    );
  }
}
