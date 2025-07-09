import '/backend/schema/structs/index.dart';
import '/components/selecionar_frentista_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'filtros_model.dart';
export 'filtros_model.dart';

/// monte um bottom sheet de filtro
class FiltrosWidget extends StatefulWidget {
  const FiltrosWidget({
    super.key,
    this.aFiltroSubmite,
    this.combustiveisValues,
  });

  final FiltrosAbastecimentoStruct? aFiltroSubmite;
  final List<CombustiveisDataTypeStruct>? combustiveisValues;

  @override
  State<FiltrosWidget> createState() => _FiltrosWidgetState();
}

class _FiltrosWidgetState extends State<FiltrosWidget> {
  late FiltrosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltrosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.frentistaSelected = widget.aFiltroSubmite?.frentista;
      _model.dataInicial = widget.aFiltroSubmite?.dateInitial;
      _model.dataFinal = widget.aFiltroSubmite?.dateFinal;
      _model.combustivelSelected = widget.aFiltroSubmite?.combustivelSelected;
      safeSetState(() {});
      if (widget.aFiltroSubmite?.combustivelSelected == null) {
        _model.combustivelSelected = CombustiveisDataTypeStruct(
          idProduto: 0,
          nome: 'TODOS',
        );
        safeSetState(() {});
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    constraints: BoxConstraints(
                      maxHeight: 450.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                                PointerDeviceKind.stylus,
                                PointerDeviceKind.unknown,
                              },
                            ),
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      40.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Filtros',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 12.0),
                                      child: Builder(
                                        builder: (context) {
                                          final listCombs = functions
                                                  .addTodosOnCombustiveis(
                                                      widget.combustiveisValues
                                                          ?.toList())
                                                  ?.toList() ??
                                              [];

                                          return Wrap(
                                            spacing: 5.0,
                                            runSpacing: 5.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children:
                                                List.generate(listCombs.length,
                                                    (listCombsIndex) {
                                              final listCombsItem =
                                                  listCombs[listCombsIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.combustivelSelected =
                                                      listCombsItem;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: 250.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: _model
                                                                .combustivelSelected ==
                                                            listCombsItem
                                                        ? valueOrDefault<Color>(
                                                            functions
                                                                .transcColor(
                                                                    listCombsItem
                                                                        .cor),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          )
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    7.0,
                                                                    12.0,
                                                                    7.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listCombsItem.nome,
                                                            '--',
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.combustivelSelected ==
                                                                          listCombsItem
                                                                      ? valueOrDefault<
                                                                          Color>(
                                                                          functions
                                                                              .transcColor(listCombsItem.cortexto),
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        )
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child:
                                                          SelecionarFrentistaWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(
                                                  () => _model
                                                          .actFrentistaSelected =
                                                      value));

                                              if (_model.actFrentistaSelected !=
                                                  null) {
                                                _model.frentistaSelected =
                                                    _model.actFrentistaSelected;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 200.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    FFIcons.kkusers,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: AutoSizeText(
                                                          functions.intNotNull(_model
                                                                      .frentistaSelected
                                                                      ?.idFrentista) >=
                                                                  1
                                                              ? 'Frentista: ${_model.frentistaSelected?.nomeFrentista}'
                                                              : 'Selecionar Frentista',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (functions.intNotNull(
                                                          _model
                                                              .frentistaSelected
                                                              ?.idFrentista) >=
                                                      1)
                                                    FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 35.0,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      icon: Icon(
                                                        Icons.clear_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        _model.frentistaSelected =
                                                            null;
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        SizedBox(width: 12.0))
                                                    .addToEnd(
                                                        SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 5.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var _shouldSetState = false;
                                          _model.actDateReturn = await actions
                                              .datePickerRangerCustom(
                                            context,
                                            320.0,
                                            280.0,
                                            false,
                                            'EEE',
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            functions.dataTimeToTimeStamp(
                                                m_s_framework_flutter_p5iajh_functions
                                                    .dateNullFormate(
                                                        _model.dataInicial),
                                                m_s_framework_flutter_p5iajh_functions
                                                    .dateNullFormate(
                                                        _model.dataFinal)),
                                          );
                                          _shouldSetState = true;
                                          if (_model.actDateReturn != null) {
                                            _model.dataInicial =
                                                _model.actDateReturn?.start;
                                            _model.dataFinal =
                                                _model.actDateReturn?.end;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.kkcalendarDue,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: dateTimeFormat(
                                                            "dd/MM/yyyy",
                                                            m_s_framework_flutter_p5iajh_functions
                                                                .dateNullFormate(
                                                                    _model
                                                                        .dataInicial),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: ' - ',
                                                          style: TextStyle(),
                                                        ),
                                                        TextSpan(
                                                          text: dateTimeFormat(
                                                            "dd/MM/yyyy",
                                                            m_s_framework_flutter_p5iajh_functions
                                                                .dateNullFormate(
                                                                    _model
                                                                        .dataFinal),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: TextStyle(),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.dataInicial != null)
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 35.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.clear_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.dataInicial = null;
                                                    _model.dataFinal = null;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .addToStart(
                                                    SizedBox(width: 12.0))
                                                .addToEnd(
                                                    SizedBox(width: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.combustivelSelected?.idProduto ==
                                    0) {
                                  _model.combustivelSelected = null;
                                  safeSetState(() {});
                                }
                                Navigator.pop(
                                    context,
                                    FiltrosAbastecimentoStruct(
                                      dateInitial: _model.dataInicial,
                                      dateFinal: _model.dataFinal,
                                      frentista: _model.frentistaSelected,
                                      combustivelSelected:
                                          _model.combustivelSelected,
                                      bico: widget.aFiltroSubmite?.bico,
                                      tPRegistro:
                                          widget.aFiltroSubmite?.tPRegistro,
                                    ));
                              },
                              text: 'Aplicar Filtros',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
