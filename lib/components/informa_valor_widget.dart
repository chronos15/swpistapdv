import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'informa_valor_model.dart';
export 'informa_valor_model.dart';

class InformaValorWidget extends StatefulWidget {
  const InformaValorWidget({
    super.key,
    required this.vTotal,
    required this.vRestante,
    required this.enumTap,
    required this.vDefined,
  });

  final double? vTotal;
  final double? vRestante;
  final TpPagamento? enumTap;
  final double? vDefined;

  @override
  State<InformaValorWidget> createState() => _InformaValorWidgetState();
}

class _InformaValorWidgetState extends State<InformaValorWidget> {
  late InformaValorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InformaValorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.bHasInitialized = true;
      safeSetState(() {});
      safeSetState(() {
        _model.edtRecebidoTotalTextController?.text = valueOrDefault<String>(
          functions.realFormatSCifrao(true, '0'),
          '0',
        );
      });
      if (widget.vDefined! > 0.0) {
        safeSetState(() {
          _model.edtValueDefinedTextController?.text =
              functions.realFormatSCifrao(false, widget.vDefined?.toString())!;
        });
      }
    });

    _model.edtValueDefinedTextController ??= TextEditingController();
    _model.edtValueDefinedFocusNode ??= FocusNode();
    _model.edtValueDefinedFocusNode!.addListener(() => safeSetState(() {}));
    _model.edtRecebidoTotalTextController ??= TextEditingController();
    _model.edtRecebidoTotalFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.edtValueDefinedTextController?.text = 'R\$ 0,00';
          _model.edtRecebidoTotalTextController?.text = 'R\$ 0,00';
        }));
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 100.0),
                        child: Container(
                          width: double.infinity,
                          height: valueOrDefault<double>(
                            widget.enumTap == TpPagamento.DINHEIRO
                                ? 300.0
                                : 200.0,
                            260.0,
                          ),
                          constraints: BoxConstraints(
                            maxHeight: valueOrDefault<double>(
                              widget.enumTap == TpPagamento.DINHEIRO
                                  ? 300.0
                                  : 200.0,
                              200.0,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Informe de Valores',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .sDescEnumPag(
                                                                      widget
                                                                          .enumTap),
                                                              'PAGAMENTO',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 7.0))
                                                .addToStart(
                                                    SizedBox(height: 7.0))
                                                .addToEnd(
                                                    SizedBox(height: 7.0)),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF63A6FF),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Valor Total',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .realFormatSCifrao(
                                                                  true,
                                                                  widget.vTotal
                                                                      ?.toString()),
                                                          'R\$ 0,00',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                safeSetState(() {
                                                  _model.edtValueDefinedTextController
                                                          ?.text =
                                                      valueOrDefault<String>(
                                                    functions.realFormatSCifrao(
                                                        true,
                                                        widget.vDefined
                                                            ?.toString()),
                                                    'R\$ 0,00',
                                                  );
                                                  _model
                                                      .edtValueDefinedFocusNode
                                                      ?.requestFocus();
                                                  WidgetsBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) {
                                                    _model.edtValueDefinedTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                      offset: _model
                                                          .edtValueDefinedTextController!
                                                          .text
                                                          .length,
                                                    );
                                                  });
                                                });
                                              },
                                              child: Container(
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xC4FF974C),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Valor Restante',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.realFormatSCifrao(
                                                                    true,
                                                                    widget
                                                                        .vRestante
                                                                        ?.toString()),
                                                                'R\$ 0,00',
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 5.0))
                                            .addToStart(SizedBox(width: 12.0))
                                            .addToEnd(SizedBox(width: 12.0)),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      child: Container(
                                                        width: 50.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .edtValueDefinedTextController,
                                                          focusNode: _model
                                                              .edtValueDefinedFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.edtValueDefinedTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    0),
                                                            () async {
                                                              safeSetState(() {
                                                                _model.edtValueDefinedTextController
                                                                        ?.text =
                                                                    functions.edtTextToCurrency(
                                                                        _model
                                                                            .edtValueDefinedTextController
                                                                            .text,
                                                                        true)!;
                                                                _model
                                                                    .edtValueDefinedFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtValueDefinedTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtValueDefinedTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                            },
                                                          ),
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            await actions
                                                                .hideKeyboard(
                                                              context,
                                                            );
                                                            if ((functions.stringToDouble(_model
                                                                        .edtValueDefinedTextController
                                                                        .text)! >
                                                                    0.0) &&
                                                                (functions.stringToDouble(_model
                                                                        .edtValueDefinedTextController
                                                                        .text)! <=
                                                                    widget
                                                                        .vRestante!)) {
                                                              Navigator.pop(
                                                                  context,
                                                                  DTRetornoValorStruct(
                                                                    valor: functions
                                                                        .stringToDouble(_model
                                                                            .edtValueDefinedTextController
                                                                            .text),
                                                                    troco: ((valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                                      0.0,
                                                                                    ) -
                                                                                    valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                      0.0,
                                                                                    )) <=
                                                                                0.0) ||
                                                                            (valueOrDefault<double>(
                                                                                  functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                  0.0,
                                                                                ) <=
                                                                                0.0)
                                                                        ? 0.0
                                                                        : (valueOrDefault<double>(
                                                                              functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                              0.0,
                                                                            ) -
                                                                            valueOrDefault<double>(
                                                                              functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                              0.0,
                                                                            )),
                                                                  ));
                                                            } else {
                                                              if (functions.stringToDouble(_model
                                                                      .edtValueDefinedTextController
                                                                      .text)! <=
                                                                  0.0) {
                                                                await m_s_framework_flutter_p5iajh_actions
                                                                    .elegantNotificationCustom(
                                                                  context,
                                                                  'Atenção',
                                                                  'Por favor, informe um valor maior que ZERO!',
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  350.0,
                                                                  'bottomcenter',
                                                                  'frombottom',
                                                                  Color(
                                                                      0xFFFFAC00),
                                                                  'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                );
                                                              } else {
                                                                await m_s_framework_flutter_p5iajh_actions
                                                                    .elegantNotificationCustom(
                                                                  context,
                                                                  'Atenção',
                                                                  'O pagamento informado é superior ao restante!',
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  350.0,
                                                                  'bottomcenter',
                                                                  'frombottom',
                                                                  Color(
                                                                      0xFFFFAC00),
                                                                  'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                );
                                                                return;
                                                              }

                                                              return;
                                                            }
                                                          },
                                                          autofocus: true,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .done,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: false,
                                                            labelText:
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.realFormatSCifrao(
                                                                  true,
                                                                  widget
                                                                      .vRestante
                                                                      ?.toString()),
                                                              'R\$ 0,00',
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            alignLabelWithHint:
                                                                true,
                                                            hintText:
                                                                valueOrDefault<
                                                                    String>(
                                                              functions.realFormatSCifrao(
                                                                  true,
                                                                  widget
                                                                      .vRestante
                                                                      ?.toString()),
                                                              'R\$ 0,00',
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFC7000E4),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLength: 12,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .edtValueDefinedTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
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
                                                                    7.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .success,
                                                          borderRadius: 8.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.check_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await actions
                                                                .hideKeyboard(
                                                              context,
                                                            );
                                                            if ((functions.stringToDouble(_model
                                                                        .edtValueDefinedTextController
                                                                        .text)! >
                                                                    0.0) &&
                                                                (functions.stringToDouble(_model
                                                                        .edtValueDefinedTextController
                                                                        .text)! <=
                                                                    ((widget
                                                                            .vRestante!) +
                                                                        0.1))) {
                                                              Navigator.pop(
                                                                  context,
                                                                  DTRetornoValorStruct(
                                                                    valor: functions
                                                                        .stringToDouble(_model
                                                                            .edtValueDefinedTextController
                                                                            .text),
                                                                    troco: ((valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                                      0.0,
                                                                                    ) -
                                                                                    valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                      0.0,
                                                                                    )) <=
                                                                                0.0) ||
                                                                            (valueOrDefault<double>(
                                                                                  functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                  0.0,
                                                                                ) <=
                                                                                0.0)
                                                                        ? 0.0
                                                                        : (valueOrDefault<double>(
                                                                              functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                              0.0,
                                                                            ) -
                                                                            valueOrDefault<double>(
                                                                              functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                              0.0,
                                                                            )),
                                                                  ));
                                                            } else {
                                                              if (functions.stringToDouble(_model
                                                                      .edtValueDefinedTextController
                                                                      .text)! <=
                                                                  0.0) {
                                                                await m_s_framework_flutter_p5iajh_actions
                                                                    .elegantNotificationCustom(
                                                                  context,
                                                                  'Atenção',
                                                                  'Por favor, informe um valor maior que ZERO!',
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  350.0,
                                                                  'bottomcenter',
                                                                  'frombottom',
                                                                  Color(
                                                                      0xFFFFAC00),
                                                                  'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                );
                                                              } else {
                                                                await m_s_framework_flutter_p5iajh_actions
                                                                    .elegantNotificationCustom(
                                                                  context,
                                                                  'Atenção',
                                                                  'O pagamento informado é superior ao restante!',
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  350.0,
                                                                  'bottomcenter',
                                                                  'frombottom',
                                                                  Color(
                                                                      0xFFFFAC00),
                                                                  'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                );
                                                                return;
                                                              }

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
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
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.clear_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            safeSetState(() {
                                                              _model.edtValueDefinedTextController
                                                                      ?.text =
                                                                  functions
                                                                      .realFormatSCifrao(
                                                                          true,
                                                                          '0')!;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (widget.enumTap ==
                                          TpPagamento.DINHEIRO)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 45.0,
                                                            child: Container(
                                                              width: 50.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .edtRecebidoTotalTextController,
                                                                focusNode: _model
                                                                    .edtRecebidoTotalFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.edtRecebidoTotalTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          0),
                                                                  () async {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.edtRecebidoTotalTextController?.text = functions.edtTextToCurrency(
                                                                          _model
                                                                              .edtRecebidoTotalTextController
                                                                              .text,
                                                                          true)!;
                                                                      _model
                                                                          .edtRecebidoTotalFocusNode
                                                                          ?.requestFocus();
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .addPostFrameCallback(
                                                                              (_) {
                                                                        _model
                                                                            .edtRecebidoTotalTextController
                                                                            ?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .edtRecebidoTotalTextController!
                                                                              .text
                                                                              .length,
                                                                        );
                                                                      });
                                                                    });
                                                                  },
                                                                ),
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense:
                                                                      false,
                                                                  labelText:
                                                                      'Valor Recebido',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  alignLabelWithHint:
                                                                      true,
                                                                  hintText:
                                                                      'Valor Recebido',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            7.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLength: 12,
                                                                buildCounter: (context,
                                                                        {required currentLength,
                                                                        required isFocused,
                                                                        maxLength}) =>
                                                                    null,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .edtRecebidoTotalTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      7.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Troco',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.realFormatSCifrao(
                                                                    true,
                                                                    ((valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                                      0.0,
                                                                                    ) -
                                                                                    valueOrDefault<double>(
                                                                                      functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                      0.0,
                                                                                    )) <=
                                                                                0.0) ||
                                                                            (valueOrDefault<double>(
                                                                                  functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                  0.0,
                                                                                ) <=
                                                                                0.0)
                                                                        ? '0'
                                                                        : (valueOrDefault<double>(
                                                                                  functions.stringToDouble(_model.edtRecebidoTotalTextController.text),
                                                                                  0.0,
                                                                                ) -
                                                                                valueOrDefault<double>(
                                                                                  functions.stringToDouble(_model.edtValueDefinedTextController.text),
                                                                                  0.0,
                                                                                ))
                                                                            .toString()),
                                                                'R\$ 0,00',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .manrope(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ]
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          12.0))
                                                              .addToEnd(SizedBox(
                                                                  width: 12.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: ScrollConfiguration(
                                                  behavior:
                                                      ScrollConfiguration.of(
                                                              context)
                                                          .copyWith(
                                                    scrollbars: false,
                                                    dragDevices: {
                                                      PointerDeviceKind.mouse,
                                                      PointerDeviceKind.touch,
                                                      PointerDeviceKind.stylus,
                                                      PointerDeviceKind.unknown,
                                                    },
                                                  ),
                                                  child: Scrollbar(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: functions
                                                                  .listCurrencyPossibility(
                                                                      widget
                                                                          .vRestante)!
                                                                  .map((label) =>
                                                                      ChipData(
                                                                          label))
                                                                  .toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValue =
                                                                        val?.firstOrNull);
                                                                if (!_model
                                                                    .bHasInitialized) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.edtRecebidoTotalTextController
                                                                            ?.text =
                                                                        _model
                                                                            .choiceChipsValue!;
                                                                    _model
                                                                        .edtRecebidoTotalFocusNode
                                                                        ?.requestFocus();
                                                                    WidgetsBinding
                                                                        .instance
                                                                        .addPostFrameCallback(
                                                                            (_) {
                                                                      _model.edtRecebidoTotalTextController
                                                                              ?.selection =
                                                                          TextSelection
                                                                              .collapsed(
                                                                        offset: _model
                                                                            .edtRecebidoTotalTextController!
                                                                            .text
                                                                            .length,
                                                                      );
                                                                    });
                                                                  });
                                                                } else {
                                                                  _model.bHasInitialized =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                iconSize: 14.0,
                                                                labelPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                elevation: 2.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                iconSize: 14.0,
                                                                labelPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              chipSpacing: 3.0,
                                                              rowSpacing: 8.0,
                                                              multiselect:
                                                                  false,
                                                              initialized: _model
                                                                      .choiceChipsValue !=
                                                                  null,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .choiceChipsValueController ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [
                                                                  functions.realFormatSCifrao(
                                                                      true,
                                                                      widget
                                                                          .vRestante
                                                                          ?.toString())!
                                                                ],
                                                              ),
                                                              wrapped: false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
  }
}
