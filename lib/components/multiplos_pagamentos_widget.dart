import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/informa_valor_widget.dart';
import '/components/tp_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'multiplos_pagamentos_model.dart';
export 'multiplos_pagamentos_model.dart';

/// infome de parcelas e recebimento
class MultiplosPagamentosWidget extends StatefulWidget {
  const MultiplosPagamentosWidget({
    super.key,
    double? valueTotal,
    this.aListRegistrados,
  }) : this.valueTotal = valueTotal ?? 0.0;

  final double valueTotal;
  final List<PaymentDataTypeStruct>? aListRegistrados;

  @override
  State<MultiplosPagamentosWidget> createState() =>
      _MultiplosPagamentosWidgetState();
}

class _MultiplosPagamentosWidgetState extends State<MultiplosPagamentosWidget>
    with TickerProviderStateMixin {
  late MultiplosPagamentosModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultiplosPagamentosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.aListRegistrados != null &&
          (widget.aListRegistrados)!.isNotEmpty) {
        _model.paymentDt =
            widget.aListRegistrados!.toList().cast<PaymentDataTypeStruct>();
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    safeSetState(() {});
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: SafeArea(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Stack(
                          children: [
                            ScrollConfiguration(
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
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                Color(0xFF9B3EFF)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
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
                                                    FlutterFlowIconButton(
                                                      borderRadius: 8.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons
                                                            .chevron_left_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
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
                                                            'Multiplos Pagamentos',
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
                                                        ],
                                                      ),
                                                    ),
                                                    Icon(
                                                      FFIcons.kkcreditCard,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 24.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
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
                                                        color:
                                                            Color(0x7663A6FF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.0),
                                                      ),
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
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                          .valueTotal
                                                                          .toString()),
                                                                  'R\$ 0,00',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                    child: Container(
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xC4FF974C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.0),
                                                      ),
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                      ((widget.valueTotal -
                                                                              (functions.sumListDouble(_model.paymentDt.map((e) => e.valor).toList())!)))
                                                                          .toString()),
                                                                  'R\$ 0,00',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                ]
                                                    .divide(
                                                        SizedBox(width: 5.0))
                                                    .addToStart(
                                                        SizedBox(width: 12.0))
                                                    .addToEnd(
                                                        SizedBox(width: 12.0)),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 7.0))
                                                .addToStart(
                                                    SizedBox(height: 7.0))
                                                .addToEnd(
                                                    SizedBox(height: 7.0)),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            if (_model.paymentDt.length >= 1)
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('teste'),
                                                        content: Text((FFAppState()
                                                                .CondPagamentoList
                                                                .firstOrNull!
                                                                .toMap())
                                                            .toString()),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Text(
                                                  'Pagamentos Registrados',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
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
                                                        letterSpacing: 0.0,
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
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      if (_model.paymentDt.length >= 1)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final listPay =
                                                  _model.paymentDt.toList();

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: listPay.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 5.0),
                                                itemBuilder:
                                                    (context, listPayIndex) {
                                                  final listPayItem =
                                                      listPay[listPayIndex];
                                                  return Container(
                                                    width: 100.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Card(
                                                          clipBehavior: Clip
                                                              .antiAliasWithSaveLayer,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          elevation: 0.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    7.0),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kkcreditCard,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.sDescEnumPag(
                                                                          listPayItem
                                                                              .tPPagEnum),
                                                                      'Não Informado',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.manrope(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                  if (listPayItem
                                                                          .parcelas >=
                                                                      2)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        ' - ${valueOrDefault<String>(
                                                                          listPayItem
                                                                              .parcelas
                                                                              .toString(),
                                                                          '1',
                                                                        )} x',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if (listPayItem
                                                                          .troco >
                                                                      0.0)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        ' - Troco: ${valueOrDefault<String>(
                                                                          functions.realFormatSCifrao(
                                                                              true,
                                                                              valueOrDefault<String>(
                                                                                listPayItem.troco.toString(),
                                                                                '0',
                                                                              )),
                                                                          'R\$ 0,00',
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              if (listPayItem
                                                                      .valor >
                                                                  0.0)
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions
                                                                        .realFormatSCifrao(
                                                                            true,
                                                                            valueOrDefault<String>(
                                                                              listPayItem.valor.toString(),
                                                                              'R\$ 0,00',
                                                                            )),
                                                                    'R\$ 0,00',
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
                                                            ],
                                                          ),
                                                        ),
                                                        if (listPayItem
                                                            .confirmado)
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            disabledIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                            icon: Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: true
                                                                ? null
                                                                : () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                          ),
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              FFIcons.kktrashX,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              var _shouldSetState =
                                                                  false;
                                                              if (listPayItem
                                                                      .confirmado &&
                                                                  functions.enumGoToPage(
                                                                      listPayItem
                                                                          .tPPagEnum,
                                                                      0)!) {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            171.0,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.95,
                                                                        child: m_s_framework_flutter_p5iajh
                                                                            .UnViewMSFrameMessageBoxWidget(
                                                                          sTitulo:
                                                                              'Atenção',
                                                                          sText:
                                                                              'Deseja realizar o reembolso desse pagamento!?',
                                                                          colorConfirm:
                                                                              Color(0xFFFF9700),
                                                                          colorCancel:
                                                                              Color(0x00000000),
                                                                          enableCancel:
                                                                              true,
                                                                          colorTextButtonConfirm:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          sTextoConfirm:
                                                                              'Confirmar',
                                                                          actConfirm:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            if (FFAppState().ConfigLocais.gatewayPgto ==
                                                                                GateWay.Getnet) {
                                                                              _model.returnGetEstorno = await actions.getNetEstornaPagamento(
                                                                                listPayItem.tefProcessado.callerid,
                                                                              );
                                                                              _shouldSetState = true;
                                                                              if (functions.getValueJsonByCampo(_model.returnGetEstorno, 'result') != '0') {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: Container(
                                                                                        height: 171.0,
                                                                                        width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                        child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                                                                                          sTitulo: 'Atenção',
                                                                                          sText: 'Falha ao realizar estorno, verifique os dados, tente novamente ou entre em contato com sua rede!',
                                                                                          colorConfirm: FlutterFlowTheme.of(context).error,
                                                                                          colorCancel: Color(0x00000000),
                                                                                          enableCancel: false,
                                                                                          colorTextButtonConfirm: FlutterFlowTheme.of(context).info,
                                                                                          sTextoConfirm: 'Ok',
                                                                                          actConfirm: () async {},
                                                                                          actCancel: () async {},
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );

                                                                                return;
                                                                              }
                                                                            } else {
                                                                              if (listPayItem.tPPagEnum == TpPagamento.PIX) {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: Container(
                                                                                        height: 171.0,
                                                                                        width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                        child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                                                                                          sTitulo: 'Atenção',
                                                                                          sText: 'Pix não pode ser estornado pela aplicação, contate sua rede!',
                                                                                          colorConfirm: FlutterFlowTheme.of(context).error,
                                                                                          colorCancel: Color(0x00000000),
                                                                                          enableCancel: false,
                                                                                          colorTextButtonConfirm: FlutterFlowTheme.of(context).info,
                                                                                          sTextoConfirm: 'Ok',
                                                                                          actConfirm: () async {},
                                                                                          actCancel: () async {},
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              } else {
                                                                                _model.cieloEstorna = await actions.cieloLioRealizaEstorno(
                                                                                  functions.formaJsonCieloEstorno(listPayItem.tefProcessado.callerid, listPayItem.tefProcessado.nsu.toString(), listPayItem.tefProcessado.aut.toString(), widget.valueTotal.toString()).toString(),
                                                                                  (value) async {},
                                                                                );
                                                                                _shouldSetState = true;
                                                                                if (!_model.cieloEstorna!) {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: Container(
                                                                                          height: 171.0,
                                                                                          width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                          child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                                                                                            sTitulo: 'Atenção',
                                                                                            sText: 'Falha ao realizar estorno, verifique os dados, tente novamente ou entre em contato com sua rede!',
                                                                                            colorConfirm: FlutterFlowTheme.of(context).error,
                                                                                            colorCancel: Color(0x00000000),
                                                                                            enableCancel: false,
                                                                                            colorTextButtonConfirm: FlutterFlowTheme.of(context).info,
                                                                                            sTextoConfirm: 'Ok',
                                                                                            actConfirm: () async {},
                                                                                            actCancel: () async {},
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );

                                                                                  return;
                                                                                }
                                                                              }
                                                                            }

                                                                            _model.removeFromPaymentDt(listPayItem);
                                                                            safeSetState(() {});
                                                                          },
                                                                          actCancel:
                                                                              () async {
                                                                            unawaited(
                                                                              () async {}(),
                                                                            );
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              } else {
                                                                if ((listPayItem
                                                                            .tPPagEnum ==
                                                                        TpPagamento
                                                                            .VOUCHER) ||
                                                                    (listPayItem
                                                                            .tPPagEnum ==
                                                                        TpPagamento
                                                                            .VALECOMBUSTIVEL)) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              171.0,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.95,
                                                                          child:
                                                                              m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                                                                            sTitulo:
                                                                                'Atenção',
                                                                            sText:
                                                                                'Ao confirmar, será cancelado todos os registros. Deseja continuar?',
                                                                            colorConfirm:
                                                                                Color(0xFFFF9700),
                                                                            colorCancel:
                                                                                Color(0x00000000),
                                                                            enableCancel:
                                                                                true,
                                                                            colorTextButtonConfirm:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            sTextoConfirm:
                                                                                'Confirmar',
                                                                            actConfirm:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                              _model.paymentDt = [];
                                                                              safeSetState(() {});
                                                                              FFAppState().paymmentsConfirmed = [];
                                                                              safeSetState(() {});
                                                                            },
                                                                            actCancel:
                                                                                () async {
                                                                              unawaited(
                                                                                () async {}(),
                                                                              );
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  _model.removeFromPaymentDt(
                                                                      listPayItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                          ),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 7.0))
                                                          .addToStart(SizedBox(
                                                              width: 7.0))
                                                          .addToEnd(SizedBox(
                                                              width: 7.0)),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      if (functions.sumListDouble(_model
                                              .paymentDt
                                              .map((e) => e.valor)
                                              .toList()) !=
                                          widget.valueTotal)
                                        Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 5.0, 12.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.tpPagamentoModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: TpPagamentoWidget(
                                                enumSelected: TpPagamento.VAZIO,
                                                bModoPagMP: true,
                                                tapCondPag: (enumTaped) async {
                                                  var _shouldSetState = false;
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              InformaValorWidget(
                                                            vTotal: widget
                                                                .valueTotal,
                                                            vRestante: (widget
                                                                    .valueTotal -
                                                                (functions.sumListDouble(_model
                                                                    .paymentDt
                                                                    .map((e) =>
                                                                        e.valor)
                                                                    .toList())!)),
                                                            enumTap: enumTaped,
                                                            vDefined: (widget
                                                                    .valueTotal -
                                                                (functions.sumListDouble(_model
                                                                    .paymentDt
                                                                    .map((e) =>
                                                                        e.valor)
                                                                    .toList())!)),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                              .actReturnValor =
                                                          value));

                                                  _shouldSetState = true;
                                                  if (_model.actReturnValor !=
                                                      null) {
                                                    if (!((enumTaped ==
                                                            TpPagamento
                                                                .VALECOMBUSTIVEL) ||
                                                        (enumTaped ==
                                                            TpPagamento
                                                                .VOUCHER))) {
                                                      await _model
                                                          .processaMultiplosPagamentos(
                                                        context,
                                                        payEnum: enumTaped,
                                                        vValor: _model
                                                            .actReturnValor
                                                            ?.valor,
                                                        vOutro: valueOrDefault<
                                                            double>(
                                                          _model.actReturnValor
                                                              ?.troco,
                                                          0.0,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (functions.sumListDouble(_model.paymentDt
                                    .map((e) => e.valor)
                                    .toList()) ==
                                widget.valueTotal)
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 12.0),
                                  child: FFButtonWidget(
                                    onPressed: (functions.sumListDouble(_model
                                                .paymentDt
                                                .map((e) => e.valor)
                                                .toList()) !=
                                            widget.valueTotal)
                                        ? null
                                        : () async {
                                            Navigator.pop(
                                                context, _model.paymentDt);
                                          },
                                    text: functions.sumListDouble(_model
                                                .paymentDt
                                                .map((e) => e.valor)
                                                .toList()) ==
                                            widget.valueTotal
                                        ? 'Finalizar'
                                        : 'Falta ${functions.realFormatSCifrao(true, (widget.valueTotal - (functions.sumListDouble(_model.paymentDt.map((e) => e.valor).toList())!)).toString())}',
                                    icon: Icon(
                                      FFIcons.kklayoutList,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconColor:
                                          FlutterFlowTheme.of(context).info,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(7.0),
                                      disabledColor: Color(0x7663A6FF),
                                      disabledTextColor:
                                          FlutterFlowTheme.of(context).primary,
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .cardSelection,
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context).info,
                                      hoverElevation: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
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
