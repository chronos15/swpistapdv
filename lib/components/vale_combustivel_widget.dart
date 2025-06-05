import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_lista_vazia_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_scanner_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vale_combustivel_model.dart';
export 'vale_combustivel_model.dart';

class ValeCombustivelWidget extends StatefulWidget {
  const ValeCombustivelWidget({
    super.key,
    required this.iIDCliente,
    required this.totalCompra,
  });

  final int? iIDCliente;
  final double? totalCompra;

  @override
  State<ValeCombustivelWidget> createState() => _ValeCombustivelWidgetState();
}

class _ValeCombustivelWidgetState extends State<ValeCombustivelWidget>
    with TickerProviderStateMixin {
  late ValeCombustivelModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValeCombustivelModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
                SafeArea(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    curve: Curves.easeInOut,
                    height: MediaQuery.sizeOf(context).height * 0.96,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: 600.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 0.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Vale Combustível',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                              Text(
                                                'Informe a númeraçao do vale combustível para pagamento',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 3.0)),
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 7.0, 0.0, 0.0),
                                              child: Text(
                                                'Código do Vale',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
                                                          Padding(
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
                                                            FFIcons.kkqrcode,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
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
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: double
                                                                        .infinity,
                                                                    child: m_s_framework_flutter_p5iajh
                                                                        .UnViewMSFrameScannerWidget(
                                                                      bActiveClose:
                                                                          true,
                                                                      actReturnCallBack:
                                                                          (valueReturn) async {
                                                                        var _shouldSetState =
                                                                            false;
                                                                        if (valueReturn !=
                                                                                '') {
                                                                          _model.apiResultkf3QR =
                                                                              await ValeCombustivelListaCall.call(
                                                                            ip: m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host,
                                                                            token:
                                                                                m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
                                                                            pesquisa:
                                                                                '\$filter=ID_REQUISICAO eq ${valueReturn}',
                                                                            demmand:
                                                                                1,
                                                                            skip:
                                                                                0,
                                                                            orderby:
                                                                                'SNDISPONIVEL DESC, ID_REQUISICAO DESC',
                                                                          );

                                                                          _shouldSetState =
                                                                              true;
                                                                          if ((_model.apiResultkf3QR?.succeeded ??
                                                                              true)) {
                                                                            if (ValeCombustivelListaCall.value(
                                                                                  (_model.apiResultkf3QR?.jsonBody ?? ''),
                                                                                )!
                                                                                    .length >=
                                                                                1) {
                                                                              await _model.addOrRemoveList(
                                                                                context,
                                                                                valueDT: ValeCombustivelListaCall.value(
                                                                                  (_model.apiResultkf3QR?.jsonBody ?? ''),
                                                                                )?.firstOrNull,
                                                                              );
                                                                              safeSetState(() {
                                                                                _model.textController?.clear();
                                                                              });
                                                                            } else {
                                                                              await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
                                                                                context,
                                                                                'Atenção',
                                                                                'Não foi encontrado vale combustível com esse ID informado!',
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                                350.0,
                                                                                'bottomcenter',
                                                                                'frombottom',
                                                                                Color(0xFFFFAC00),
                                                                                'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                              );
                                                                            }
                                                                          } else {
                                                                            await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
                                                                              context,
                                                                              'Atenção',
                                                                              'Falha ao realizar comunicação com o servidor!',
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                              350.0,
                                                                              'bottomcenter',
                                                                              'frombottom',
                                                                              FlutterFlowTheme.of(context).error,
                                                                              'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                            );
                                                                            return;
                                                                          }
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.textController',
                                                          Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: false,
                                                          hintText: 'Ex: VC001',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
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
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                              color: Color(
                                                                  0x00000000),
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
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.0),
                                                          ),
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      7.0,
                                                                      1.0,
                                                                      0.0,
                                                                      2.0),
                                                          suffixIcon: _model
                                                                  .textController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .textController
                                                                        ?.clear();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    size: 22.0,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model.textController
                                                                      .text !=
                                                                  '') {
                                                            unawaited(
                                                              () async {
                                                                await actions
                                                                    .hideKeyboard(
                                                                  context,
                                                                );
                                                              }(),
                                                            );
                                                            _model.apiResultkf3 =
                                                                await ValeCombustivelListaCall
                                                                    .call(
                                                              ip: m_s_framework_flutter_p5iajh_app_state
                                                                      .FFAppState()
                                                                  .ConfigGlobaisServer
                                                                  .host,
                                                              token: m_s_framework_flutter_p5iajh_app_state
                                                                      .FFAppState()
                                                                  .Token,
                                                              pesquisa:
                                                                  '\$filter=ID_REQUISICAO eq ${_model.textController.text}',
                                                              demmand: 1,
                                                              skip: 0,
                                                              orderby:
                                                                  'SNDISPONIVEL DESC, ID_REQUISICAO DESC',
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultkf3
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if (ValeCombustivelListaCall
                                                                          .value(
                                                                    (_model.apiResultkf3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .length >=
                                                                  1) {
                                                                await _model
                                                                    .addOrRemoveList(
                                                                  context,
                                                                  valueDT:
                                                                      ValeCombustivelListaCall
                                                                          .value(
                                                                    (_model.apiResultkf3
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )?.firstOrNull,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                });
                                                              } else {
                                                                await m_s_framework_flutter_p5iajh_actions
                                                                    .elegantNotificationCustom(
                                                                  context,
                                                                  'Atenção',
                                                                  'Não foi encontrado voucher com esse ID informado!',
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
                                                              }
                                                            } else {
                                                              await m_s_framework_flutter_p5iajh_actions
                                                                  .elegantNotificationCustom(
                                                                context,
                                                                'Atenção',
                                                                'Falha ao realizar comunicação com o servidor!',
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                350.0,
                                                                'bottomcenter',
                                                                'frombottom',
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                              );
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            }
                                                          } else {
                                                            await m_s_framework_flutter_p5iajh_actions
                                                                .elegantNotificationCustom(
                                                              context,
                                                              'Atenção',
                                                              'Informe um número válido de vale combustível para prosseguir!',
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                              350.0,
                                                              'bottomcenter',
                                                              'frombottom',
                                                              Color(0xFFFF9F04),
                                                              'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                            );
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                        },
                                                        text: 'Verificar',
                                                        icon: Icon(
                                                          FFIcons.kksearch,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 90.0,
                                                          height:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
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
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.receipt_long,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20.0,
                                                  ),
                                                  Text(
                                                    'Vales Selecionados',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxHeight: 200.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final vales = _model
                                                        .valesSelected
                                                        .toList();
                                                    if (vales.isEmpty) {
                                                      return Container(
                                                        height: 150.0,
                                                        child: m_s_framework_flutter_p5iajh
                                                            .UnViewMSFrameListaVaziaWidget(
                                                          sTitulo:
                                                              'Lista Vazia',
                                                          sTexto:
                                                              'Não foi selecionado nenhum vale combustível. Informe ou faça a leitura e toque em verificar!',
                                                          bIsAction: false,
                                                          vSizeTitulo: 14.0,
                                                          vSizeTexto: 12.0,
                                                          corTitulo:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          corSubtitulo:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          aActionButton:
                                                              () async {},
                                                        ),
                                                      );
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: vales.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(height: 5.0),
                                                      itemBuilder: (context,
                                                          valesIndex) {
                                                        final valesItem =
                                                            vales[valesIndex];
                                                        return Container(
                                                          width:
                                                              double.infinity,
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
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              valesItem.idRequisicao,
                                                                              formatType: FormatType.custom,
                                                                              format: '##.##',
                                                                              locale: 'pt_br',
                                                                            ),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.firstLetterUpper(valueOrDefault<String>(
                                                                              valesItem.nomeCliente,
                                                                              'NÃO IDENTIFICADO',
                                                                            )),
                                                                            '-',
                                                                          ).maybeHandleOverflow(
                                                                            maxChars:
                                                                                25,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          maxLines:
                                                                              1,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.manrope(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 13.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        functions.realFormatSCifrao(
                                                                            true,
                                                                            valueOrDefault<String>(
                                                                              valesItem.totalreq.toString(),
                                                                              '0',
                                                                            )),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderRadius:
                                                                      8.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customPrimary,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await _model
                                                                        .addOrRemoveList(
                                                                      context,
                                                                      valueDT:
                                                                          valesItem,
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'listViewOnPageLoadAnimation']!);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  AlignedTooltip(
                                                    content: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      child: Text(
                                                        'Dica: Opte por Múltiplos Pagamentos se o vale é inferior a totalização!',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    offset: 4.0,
                                                    preferredDirection:
                                                        AxisDirection.down,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    elevation: 2.0,
                                                    tailBaseWidth: 24.0,
                                                    tailLength: 20.0,
                                                    waitDuration: Duration(
                                                        milliseconds: 100),
                                                    showDuration: Duration(
                                                        milliseconds: 1500),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Icon(
                                                      FFIcons.kkprogressAlert,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Faça a leitura do código de barras ou digite a identificação manualmente.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'O valor total da compra é de: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .realFormatSCifrao(
                                                              true,
                                                              valueOrDefault<
                                                                  String>(
                                                                widget
                                                                    .totalCompra
                                                                    ?.toString(),
                                                                '0',
                                                              )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Total de Vales Selecionados',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.manrope(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      functions
                                                          .realFormatSCifrao(
                                                              true,
                                                              valueOrDefault<
                                                                  String>(
                                                                functions
                                                                    .sumListDouble(_model
                                                                        .valesSelected
                                                                        .map((e) =>
                                                                            valueOrDefault<double>(
                                                                              e.totalreq,
                                                                              0.0,
                                                                            ))
                                                                        .toList())
                                                                    ?.toString(),
                                                                '0',
                                                              )),
                                                      '0',
                                                    ),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 5.0)),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      valueOrDefault<Color>(
                                                        ((widget
                                                                        .totalCompra!) -
                                                                    valueOrDefault<
                                                                        double>(
                                                                      functions.sumListDouble(_model
                                                                          .valesSelected
                                                                          .map((e) =>
                                                                              valueOrDefault<double>(
                                                                                e.totalreq,
                                                                                0.0,
                                                                              ))
                                                                          .toList()),
                                                                      0.0,
                                                                    )) <=
                                                                0.0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                      ),
                                                      valueOrDefault<Color>(
                                                        ((widget
                                                                        .totalCompra!) -
                                                                    valueOrDefault<
                                                                        double>(
                                                                      functions.sumListDouble(_model
                                                                          .valesSelected
                                                                          .map((e) =>
                                                                              valueOrDefault<double>(
                                                                                e.totalreq,
                                                                                0.0,
                                                                              ))
                                                                          .toList()),
                                                                      0.0,
                                                                    )) <=
                                                                0.0
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .customPrimary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customPrimary,
                                                      )
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        1.0, -0.98),
                                                    end: AlignmentDirectional(
                                                        -1.0, 0.98),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Valor Restante',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            ((widget
                                                                            .totalCompra!) -
                                                                        valueOrDefault<
                                                                            double>(
                                                                          functions.sumListDouble(_model
                                                                              .valesSelected
                                                                              .map((e) => valueOrDefault<double>(
                                                                                    e.totalreq,
                                                                                    0.0,
                                                                                  ))
                                                                              .toList()),
                                                                          0.0,
                                                                        )) >=
                                                                    0.0
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    functions.realFormatSCifrao(
                                                                        true,
                                                                        ((widget.totalCompra!) -
                                                                                valueOrDefault<double>(
                                                                                  functions.sumListDouble(_model.valesSelected
                                                                                      .map((e) => valueOrDefault<double>(
                                                                                            e.totalreq,
                                                                                            0.0,
                                                                                          ))
                                                                                      .toList()),
                                                                                  0.0,
                                                                                ))
                                                                            .toString()),
                                                                    '0',
                                                                  )
                                                                : 'R\$ 0,00',
                                                            'R\$ 0,00',
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 5.0))
                                                      .addToStart(
                                                          SizedBox(width: 12.0))
                                                      .addToEnd(SizedBox(
                                                          width: 12.0)),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                        onPressed:
                                            (_model.valesSelected.length <= 0)
                                                ? null
                                                : () async {
                                                    if (_model.valesSelected
                                                            .length >=
                                                        1) {
                                                      Navigator.pop(context,
                                                          _model.valesSelected);
                                                    }
                                                  },
                                        text: 'Finalizar',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding: EdgeInsets.all(8.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          disabledTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'buttonOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
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
