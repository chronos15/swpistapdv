import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bicos_model.dart';
export 'bicos_model.dart';

/// quero criar uma tela de seleção de bicos, dividido em cards entre 2
/// colunas
class BicosWidget extends StatefulWidget {
  const BicosWidget({
    super.key,
    required this.aSelected,
  });

  final BicosDataTypeStruct? aSelected;

  @override
  State<BicosWidget> createState() => _BicosWidgetState();
}

class _BicosWidgetState extends State<BicosWidget> {
  late BicosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BicosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.bicoSelected = widget.aSelected;
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
    context.watch<FFAppState>();
    context.watch<m_s_framework_flutter_p5iajh_app_state.FFAppState>();

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              'Selecionar Bico',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 7.0, 0.0, 0.0),
            child: FutureBuilder<ApiCallResponse>(
              future: CombustiveisCall.call(
                ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                    .ConfigGlobaisServer
                    .host,
                token:
                    m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 70.0,
                      height: 70.0,
                      child: SpinKitRipple(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 70.0,
                      ),
                    ),
                  );
                }
                final choiceChipsCombustiveisResponse = snapshot.data!;

                return FlutterFlowChoiceChips(
                  options: functions
                      .addOnList(CombustiveisCall.nome(
                        choiceChipsCombustiveisResponse.jsonBody,
                      )?.toList())!
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) async {
                    safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull);
                    _model.prodSelect = _model.choiceChipsValue != 'TODOS'
                        ? valueOrDefault<int>(
                            functions
                                .filterCombustiveisDT(
                                    _model.choiceChipsValue,
                                    CombustiveisCall.combustiveis(
                                      choiceChipsCombustiveisResponse.jsonBody,
                                    )?.toList())
                                ?.idProduto,
                            0,
                          )
                        : 0;
                    safeSetState(() {});
                    safeSetState(() => _model.apiRequestCompleter = null);
                    await _model.waitForApiRequestCompleted(maxWait: 1500);
                  },
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryBackground,
                    iconSize: 15.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 15.0, 0.0),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    labelPadding:
                        EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 10.0, 0.0),
                    elevation: 1.0,
                    borderWidth: 0.0,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  chipSpacing: 5.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.center,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['TODOS'],
                  ),
                  wrapped: true,
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
              child: FutureBuilder<ApiCallResponse>(
                future: (_model
                        .apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(BicosCall.call(
                        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                            .ConfigGlobaisServer
                            .host,
                        token:
                            m_s_framework_flutter_p5iajh_app_state.FFAppState()
                                .Token,
                        filtro: _model.prodSelect != 0
                            ? '\$filter=(ID_PRODUTO eq \'${_model.prodSelect?.toString()}\')'
                            : '',
                      )))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 70.0,
                        ),
                      ),
                    );
                  }
                  final staggeredViewBicosResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final bicos = BicosCall.bicos(
                            staggeredViewBicosResponse.jsonBody,
                          )?.toList() ??
                          [];

                      return RefreshIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        strokeWidth: 1.0,
                        onRefresh: () async {
                          safeSetState(() => _model.apiRequestCompleter = null);
                          await _model.waitForApiRequestCompleted();
                        },
                        child: MasonryGridView.builder(
                          gridDelegate:
                              SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          itemCount: bicos.length,
                          itemBuilder: (context, bicosIndex) {
                            final bicosItem = bicos[bicosIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (bicosItem == _model.bicoSelected) {
                                  _model.bicoSelected = null;
                                  safeSetState(() {});
                                } else {
                                  _model.bicoSelected = bicosItem;
                                  safeSetState(() {});
                                }
                              },
                              child: Container(
                                height: 145.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: _model.bicoSelected == bicosItem
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      7.0, 0.0, 7.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              functions
                                                  .transcColor(bicosItem.cor),
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.local_gas_station_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 32.0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Bico ${bicosItem.idBico.toString()}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          bicosItem.combustivel,
                                          '--',
                                        ),
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
                                                      .secondaryText,
                                              fontSize: 14.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
                onPressed: () async {
                  Navigator.pop(context, _model.bicoSelected);
                },
                text: 'Selecionar',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45.0,
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
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ].addToStart(SizedBox(height: 12.0)),
      ),
    );
  }
}
