import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/animation_status_widget.dart';
import '/components/parcelamento_widget.dart';
import '/components/selecionar_cidades_widget.dart';
import '/components/selecionar_cliente_widget.dart';
import '/components/tp_pagamento_widget.dart';
import '/components/virtual_keyboard_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_lista_vazia_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  static String routeName = 'Checkout';
  static String routePath = '/checkout';

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget>
    with TickerProviderStateMixin {
  late CheckoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasRowTriggered = false;
  var hasFormTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      if (animationsMap['rowOnActionTriggerAnimation'] != null) {
        safeSetState(() => hasRowTriggered = true);
        SchedulerBinding.instance.addPostFrameCallback((_) async =>
            animationsMap['rowOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0));
      }
      _model.finishsucess = false;
      _model.pgtoSucess = functions.verifyAllConfirmed(
          FFAppState().paymmentsConfirmed.toList(),
          functions.sumListDouble(FFAppState()
              .AbastecimentosSelecionados
              .map((e) => e.vlrtotal)
              .toList()
              .toList()))!;
      _model.enumSelected = TpPagamento.VAZIO;
      _model.nfdisponivel = false;
      _model.bTentarNovamente = false;
      safeSetState(() {});
      if (FFAppState().paymmentsConfirmed.length >= 2) {
        safeSetState(() {
          _model.choiceChipsValueController?.value = ['Multiplos Pagamentos'];
        });
        _model.bModoPgMult = true;
        safeSetState(() {});
      }
      if (FFAppState().ClienteSelected.idCodigo < 1) {
        FFAppState().updateClienteSelectedStruct(
          (e) => e
            ..nome = 'CONSUMIDOR'
            ..idCodigo = 1
            ..denome = 'CONSUMIDOR'
            ..tppessoa = null
            ..cpfcnpj = null
            ..cidade = null
            ..estado = null
            ..endereco = null
            ..complemento = null
            ..cep = null
            ..codCidade = null
            ..bairro = null
            ..codibge = null,
        );
        safeSetState(() {});
      }
      await actions.verifyCompActPage(
        context,
        (compActive) async {
          if (_model.pageViewCurrentIndex != 2) {
            if (compActive!) {
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .reverse();
              }
            } else {
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                await animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0);
              }
            }
          } else {
            return;
          }
        },
      );
    });

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
    _model.edtNomeClienteTextController ??= TextEditingController(
        text: FFAppState().ClienteSelected.idCodigo >= 2
            ? FFAppState().ClienteSelected.nome
            : '');
    _model.edtNomeClienteFocusNode ??= FocusNode();

    _model.edtCPFClienteTextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.cpfcnpj);
    _model.edtCPFClienteFocusNode ??= FocusNode();

    _model.edtEnderecoTextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.endereco);
    _model.edtEnderecoFocusNode ??= FocusNode();

    _model.edtCidadeTextController ??= TextEditingController();
    _model.edtCidadeFocusNode ??= FocusNode();

    _model.edtBairroTextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.bairro);
    _model.edtBairroFocusNode ??= FocusNode();

    _model.edtIBGETextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.codibge);
    _model.edtIBGEFocusNode ??= FocusNode();

    _model.edtIBGEMask = MaskTextInputFormatter(mask: '#####-###');
    _model.edtComplementoTextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.complemento);
    _model.edtComplementoFocusNode ??= FocusNode();

    _model.edtCepTextController ??=
        TextEditingController(text: FFAppState().ClienteSelected.cep);
    _model.edtCepFocusNode ??= FocusNode();

    _model.edtCepMask = MaskTextInputFormatter(mask: '#####-###');
    animationsMap.addAll({
      'tpPagamentoOnPageLoadAnimation': AnimationInfo(
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
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'richTextOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primaryBackground,
            angle: 0.524,
          ),
        ],
      ),
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
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 380.0.ms,
            duration: 600.0.ms,
            color: Color(0x68E0E3E7),
            angle: 0.524,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 190.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 0.5,
          ),
        ],
      ),
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 15.999999999999986),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'richTextOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.087,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).primaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
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
      'formOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 38.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<m_s_framework_flutter_p5iajh_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              backgroundColor: valueOrDefault<Color>(
                _model.finishsucess
                    ? Color(0xFF12B66A)
                    : FlutterFlowTheme.of(context).secondaryBackground,
                FlutterFlowTheme.of(context).secondaryBackground,
              ),
              automaticallyImplyLeading: false,
              leading: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: valueOrDefault<Color>(
                      _model.finishsucess
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primaryText,
                      FlutterFlowTheme.of(context).primaryText,
                    ),
                    size: 22.0,
                  ),
                  onPressed: () async {
                    if (_model.pageViewCurrentIndex == 0) {
                      context.pushNamed(TelaInicialWidget.routeName);
                    } else {
                      if (_model.finishsucess) {
                        FFAppState().aFiltrosAbastecimento =
                            FiltrosAbastecimentoStruct();
                        safeSetState(() {});

                        context.goNamed(TelaInicialWidget.routeName);
                      } else {
                        await _model.pageViewController?.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    }
                  },
                ),
              ),
              title: Text(
                'Fechamento',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: GoogleFonts.outfit(
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                      color: valueOrDefault<Color>(
                        _model.finishsucess
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).cardAlter,
                        FlutterFlowTheme.of(context).cardAlter,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
              ),
              actions: [
                Visibility(
                  visible: _model.pageViewCurrentIndex == 0,
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 12.0,
                        borderWidth: 1.0,
                        buttonSize: 35.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.add_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 18.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(
                            ProdutosWidget.routeName,
                            queryParameters: {
                              'bLancamentoDiversos': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                            }.withoutNulls,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              toolbarHeight: 70.0,
              elevation: 0.0,
            ),
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    onPageChanged: (_) async {
                      var _shouldSetState = false;
                      if (_model.pageViewCurrentIndex == 2) {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .reverse();
                        }
                        _model.iLoopPay = 0;
                        safeSetState(() {});
                        if (!_model.bModoPgMult &&
                            (!_model.pgtoSucess ||
                                functions
                                    .enumDefaultApp(_model.enumSelected)!)) {
                          FFAppState().paymmentsConfirmed = [];
                          safeSetState(() {});
                          FFAppState()
                              .addToPaymmentsConfirmed(PaymentDataTypeStruct(
                            valor: functions.sumListDouble(FFAppState()
                                .AbastecimentosSelecionados
                                .map((e) => e.vlrtotal)
                                .toList()),
                            tPPagEnum: _model.enumSelected,
                            parcelas: _model.iParcelasCount,
                            confirmado: false,
                            bModoReg: 0,
                          ));
                          safeSetState(() {});
                        }
                        await _model.loopMultiplosPagamentos(context);
                        safeSetState(() {});
                        _model.pgtoSucess = valueOrDefault<bool>(
                          functions.verifyAllConfirmed(
                              FFAppState().paymmentsConfirmed.toList(),
                              functions.sumListDouble(FFAppState()
                                  .AbastecimentosSelecionados
                                  .map((e) => e.vlrtotal)
                                  .toList())),
                          false,
                        );
                        safeSetState(() {});
                        if (_model.pgtoSucess) {
                          await Future.delayed(
                              const Duration(milliseconds: 1000));
                          _model.actReturnVenda =
                              await _model.confirmaVenda(context);
                          _shouldSetState = true;
                          if (_model.actReturnVenda!) {
                            _model.finishsucess = _model.actReturnVenda!;
                            _model.bWait = false;
                            safeSetState(() {});
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .reverse();
                            }
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          } else {
                            _model.finishsucess = _model.actReturnVenda!;
                            _model.bWait = false;
                            safeSetState(() {});
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }
                        } else {
                          _model.finishsucess = false;
                          _model.bWait = false;
                          safeSetState(() {});
                          if (_shouldSetState) safeSetState(() {});
                          return;
                        }
                      } else {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                        if (_model.pageViewCurrentIndex == 0) {
                          if (animationsMap['rowOnActionTriggerAnimation'] !=
                              null) {
                            safeSetState(() => hasRowTriggered = true);
                            SchedulerBinding.instance.addPostFrameCallback(
                                (_) async => animationsMap[
                                        'rowOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0));
                          }
                        } else {
                          if (animationsMap['rowOnActionTriggerAnimation'] !=
                              null) {
                            animationsMap['rowOnActionTriggerAnimation']!
                                .controller
                                .reverse();
                          }
                        }

                        _model.finishsucess = false;
                        _model.bWait = true;
                        safeSetState(() {});
                        _model.pgtoSucess = functions.verifyAllConfirmed(
                            FFAppState().paymmentsConfirmed.toList(),
                            functions.sumListDouble(FFAppState()
                                .AbastecimentosSelecionados
                                .map((e) => e.vlrtotal)
                                .toList()))!;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Builder(
                          builder: (context) {
                            final abastecimentos = FFAppState()
                                .AbastecimentosSelecionados
                                .toList();
                            if (abastecimentos.isEmpty) {
                              return Center(
                                child: Container(
                                  width: double.infinity,
                                  height: 250.0,
                                  child: m_s_framework_flutter_p5iajh
                                      .UnViewMSFrameListaVaziaWidget(
                                    sTitulo: 'Lista Vazia',
                                    sTexto:
                                        'Adicione um novo abastecimento ou produto!',
                                    bIsAction: true,
                                    vSizeTitulo: 16.0,
                                    vSizeTexto: 14.0,
                                    corTitulo: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    corSubtitulo: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    sTextAction: 'Adicionar',
                                    cColorButton:
                                        FlutterFlowTheme.of(context).primary,
                                    pIcon: Icon(
                                      Icons.add,
                                    ),
                                    textSize: 14.0,
                                    aActionButton: () async {
                                      context.pushNamed(
                                          TelaInicialWidget.routeName);
                                    },
                                  ),
                                ),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                10.0,
                                0,
                                150.0,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: abastecimentos.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 5.0),
                              itemBuilder: (context, abastecimentosIndex) {
                                final abastecimentosItem =
                                    abastecimentos[abastecimentosIndex];
                                return Stack(
                                  children: [
                                    if (!abastecimentosItem.bAsProduct)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 5.0, 7.0, 5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            abastecimentosItem.codAbastecimento.toString(),
                                                                            '0',
                                                                          ),
                                                                          style:
                                                                              GoogleFonts.outfit(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              ' - ',
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            abastecimentosItem.combustivel,
                                                                            'Não Informado',
                                                                          ),
                                                                          style:
                                                                              GoogleFonts.outfit(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    maxLines: 1,
                                                                  ),
                                                                ),
                                                                if (FFAppState()
                                                                    .AbastecimentosSelecionados
                                                                    .contains(
                                                                        abastecimentosItem))
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    borderRadius:
                                                                        50.0,
                                                                    borderWidth:
                                                                        0.5,
                                                                    buttonSize:
                                                                        35.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .remove_shopping_cart,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      FFAppState()
                                                                          .removeFromAbastecimentosSelecionados(
                                                                              abastecimentosItem);
                                                                      safeSetState(
                                                                          () {});
                                                                      await m_s_framework_flutter_p5iajh_actions
                                                                          .elegantNotificationCustom(
                                                                        context,
                                                                        'Removido',
                                                                        '${abastecimentosItem.idBico > 0 ? 'Abastecimento' : 'Item diverso'} removido da lista de fechamento',
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        350.0,
                                                                        'bottomcenter',
                                                                        'frombottom',
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        'https://cdn-icons-png.flaticon.com/512/1828/1828843.png',
                                                                      );
                                                                      if (FFAppState()
                                                                              .AbastecimentosSelecionados
                                                                              .length ==
                                                                          0) {
                                                                        if (Navigator.of(context)
                                                                            .canPop()) {
                                                                          context
                                                                              .pop();
                                                                        }
                                                                        context.pushNamed(
                                                                            TelaInicialWidget.routeName);
                                                                      }
                                                                    },
                                                                  ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      abastecimentosItem.idBico >=
                                                                              1
                                                                          ? 'Bico ${valueOrDefault<String>(
                                                                              abastecimentosItem.idBico.toString(),
                                                                              '0',
                                                                            )}'
                                                                          : 'Diversos',
                                                                      'Bico',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          abastecimentosItem
                                                                              .frentista,
                                                                          '--',
                                                                        ),
                                                                        style: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                      )
                                                                    ],
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
                                                                  maxLines: 1,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'R\$ ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .manrope(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions
                                                                    .realFormatSCifrao(
                                                                        false,
                                                                        valueOrDefault<
                                                                            String>(
                                                                          abastecimentosItem
                                                                              .vlrtotal
                                                                              .toString(),
                                                                          '0',
                                                                        )),
                                                                '0,00',
                                                              ),
                                                              style: GoogleFonts
                                                                  .manrope(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .cardAlter,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 22.0,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '  ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  formatNumber(
                                                                abastecimentosItem
                                                                    .quantidade,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format:
                                                                    '##0.000',
                                                                locale: 'pt_br',
                                                              ),
                                                              style: GoogleFonts
                                                                  .outfit(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 14.0,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                abastecimentosItem
                                                                    .unidade,
                                                                'UN',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
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
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.timer_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cardAlter,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd/MM/yyyy  • HH:mm",
                                                            m_s_framework_flutter_p5iajh_functions
                                                                .dateNullFormate(
                                                                    functions.dataHoraJsonToDate(
                                                                        abastecimentosItem
                                                                            .datahora)),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '15/03/2022  • 10:12',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
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
                                                                  fontSize:
                                                                      12.0,
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (abastecimentosItem.bAsProduct)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 5.0, 7.0, 5.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      abastecimentosItem
                                                                          .produtoDT
                                                                          .idCodigo
                                                                          .toString(),
                                                                      '0',
                                                                    ),
                                                                    style: GoogleFonts
                                                                        .outfit(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: ' - ',
                                                                    style:
                                                                        TextStyle(),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      abastecimentosItem
                                                                          .produtoDT
                                                                          .nompro,
                                                                      'Não Informado',
                                                                    ),
                                                                    style: GoogleFonts
                                                                        .outfit(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          20.0,
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
                                                              maxLines: 1,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (FFAppState()
                                                          .AbastecimentosSelecionados
                                                          .contains(
                                                              abastecimentosItem))
                                                        FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                          borderRadius: 50.0,
                                                          borderWidth: 0.5,
                                                          buttonSize: 35.0,
                                                          icon: Icon(
                                                            Icons
                                                                .remove_shopping_cart,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            FFAppState()
                                                                .removeFromAbastecimentosSelecionados(
                                                                    abastecimentosItem);
                                                            safeSetState(() {});
                                                            await m_s_framework_flutter_p5iajh_actions
                                                                .elegantNotificationCustom(
                                                              context,
                                                              'Removido',
                                                              'Item diverso removido da lista de fechamento',
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
                                                              'https://cdn-icons-png.flaticon.com/512/1828/1828843.png',
                                                            );
                                                            if (FFAppState()
                                                                    .AbastecimentosSelecionados
                                                                    .length ==
                                                                0) {
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context.pushNamed(
                                                                  TelaInicialWidget
                                                                      .routeName);
                                                            }
                                                          },
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          'MARCA: ${valueOrDefault<String>(
                                                            abastecimentosItem
                                                                .produtoDT
                                                                .marca,
                                                            '0',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${abastecimentosItem.idFrentista.toString()}-${abastecimentosItem.frentista}',
                                                              style: GoogleFonts
                                                                  .outfit(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 14.0,
                                                              ),
                                                            )
                                                          ],
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
                                                        maxLines: 1,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: 'R\$ ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .manrope(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                functions
                                                                    .realFormatSCifrao(
                                                                        false,
                                                                        valueOrDefault<
                                                                            String>(
                                                                          abastecimentosItem
                                                                              .vlrtotal
                                                                              .toString(),
                                                                          '0',
                                                                        )),
                                                                '0,00',
                                                              ),
                                                              style: GoogleFonts
                                                                  .manrope(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .cardAlter,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 22.0,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '  ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  formatNumber(
                                                                abastecimentosItem
                                                                    .quantidade,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format:
                                                                    '##0.000',
                                                                locale: 'pt_br',
                                                              ),
                                                              style: GoogleFonts
                                                                  .outfit(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 14.0,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                abastecimentosItem
                                                                    .produtoDT
                                                                    .und,
                                                                'UN',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
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
                                                        ),
                                                        maxLines: 1,
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.timer_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cardAlter,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      AutoSizeText(
                                                        dateTimeFormat(
                                                          "dd/MM/yyyy hh:mm",
                                                          abastecimentosItem
                                                              .dateDefault!,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
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
                                                                  fontSize:
                                                                      12.0,
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (_model.activeFormCliente) {
                                        await Future.wait([
                                          Future(() async {
                                            if (animationsMap[
                                                    'formOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'formOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                          Future(() async {
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation'] !=
                                                null) {
                                              animationsMap[
                                                      'iconButtonOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                          Future(() async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .reverse();
                                            }
                                          }),
                                        ]);
                                        _model.activeFormCliente = false;
                                        safeSetState(() {});
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      } else {
                                        _model.activeFormCliente = true;
                                        safeSetState(() {});
                                        await Future.wait([
                                          Future(() async {
                                            if (animationsMap[
                                                    'formOnActionTriggerAnimation'] !=
                                                null) {
                                              safeSetState(() =>
                                                  hasFormTriggered = true);
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback(
                                                      (_) async => animationsMap[
                                                              'formOnActionTriggerAnimation']!
                                                          .controller
                                                          .forward(from: 0.0));
                                            }
                                          }),
                                          Future(() async {
                                            if (animationsMap[
                                                    'iconButtonOnActionTriggerAnimation'] !=
                                                null) {
                                              animationsMap[
                                                      'iconButtonOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          Future(() async {
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }),
                                          Future(() async {
                                            safeSetState(() {
                                              _model
                                                  .edtNomeClienteTextController
                                                  ?.text = () {
                                                if (FFAppState()
                                                        .ClienteSelected
                                                        .idCodigo >=
                                                    2) {
                                                  return FFAppState()
                                                      .ClienteSelected
                                                      .nome;
                                                } else if (FFAppState()
                                                            .ClienteSelected
                                                            .nome ==
                                                        '') {
                                                  return '';
                                                } else if (FFAppState()
                                                        .ClienteSelected
                                                        .nome !=
                                                    'CONSUMIDOR') {
                                                  return FFAppState()
                                                      .ClienteSelected
                                                      .nome;
                                                } else {
                                                  return '';
                                                }
                                              }();
                                            });
                                            safeSetState(() {
                                              _model.edtCPFClienteTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .cpfcnpj;
                                            });
                                            safeSetState(() {
                                              _model.edtEnderecoTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .endereco;
                                            });
                                            safeSetState(() {
                                              _model.edtCidadeTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .cidade;
                                            });
                                            safeSetState(() {
                                              _model.dpdUFValueController
                                                      ?.value =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .estado;
                                            });
                                            safeSetState(() {
                                              _model.edtComplementoTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .complemento;
                                            });
                                            safeSetState(() {
                                              _model.edtCepTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .cep;
                                              _model.edtCepMask.updateMask(
                                                newValue: TextEditingValue(
                                                  text: _model
                                                      .edtCepTextController!
                                                      .text,
                                                ),
                                              );
                                            });
                                            safeSetState(() {
                                              _model.edtBairroTextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .bairro;
                                            });
                                            safeSetState(() {
                                              _model.edtIBGETextController
                                                      ?.text =
                                                  FFAppState()
                                                      .ClienteSelected
                                                      .codibge;
                                              _model.edtIBGEMask.updateMask(
                                                newValue: TextEditingValue(
                                                  text: _model
                                                      .edtIBGETextController!
                                                      .text,
                                                ),
                                              );
                                            });
                                            _model.idCidadeSelected =
                                                FFAppState()
                                                    .ClienteSelected
                                                    .codCidade;
                                            safeSetState(() {});
                                          }),
                                        ]);
                                      }
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FFIcons.kkuserDollar,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText(
                                                  '${valueOrDefault<String>(
                                                    FFAppState()
                                                        .ClienteSelected
                                                        .idCodigo
                                                        .toString(),
                                                    '1',
                                                  )} - ${valueOrDefault<String>(
                                                    FFAppState()
                                                        .ClienteSelected
                                                        .nome,
                                                    'CONSUMIDOR',
                                                  )}'
                                                      .maybeHandleOverflow(
                                                    maxChars: 35,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 1,
                                                  minFontSize: 12.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                AutoSizeText(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .ClienteSelected
                                                        .cpfcnpj,
                                                    '00.000.000-00',
                                                  ).maybeHandleOverflow(
                                                    maxChars: 35,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 1,
                                                  minFontSize: 10.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ]
                                            .divide(SizedBox(width: 12.0))
                                            .addToStart(SizedBox(width: 12.0))
                                            .addToEnd(SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('Pagamento Único'),
                                        ChipData('Multiplos Pagamentos')
                                      ],
                                      onChanged: (val) async {
                                        safeSetState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull);
                                        _model.actReturnMPSelected =
                                            await _model
                                                .processaMultiplosPagamento(
                                                    context);
                                        if (!_model.actReturnMPSelected!) {
                                          _model.pgtoSucess =
                                              valueOrDefault<bool>(
                                            functions.verifyAllConfirmed(
                                                FFAppState()
                                                    .paymmentsConfirmed
                                                    .toList(),
                                                functions.sumListDouble(
                                                    FFAppState()
                                                        .AbastecimentosSelecionados
                                                        .map((e) => e.vlrtotal)
                                                        .toList())),
                                            false,
                                          );
                                          _model.bWait = true;
                                          safeSetState(() {});
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        } else {
                                          safeSetState(() {
                                            _model.choiceChipsValueController
                                                ?.value = ['Pagamento Único'];
                                          });
                                          _model.bModoPgMult = false;
                                          _model.enumSelected =
                                              TpPagamento.VAZIO;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 12.0,
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
                                        iconColor: Color(0x00000000),
                                        iconSize: 14.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                5.0, 2.0, 15.0, 2.0),
                                        elevation: 2.0,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.manrope(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .cardAlter,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 16.0,
                                        elevation: 8.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 8.0,
                                      multiselect: false,
                                      initialized:
                                          _model.choiceChipsValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                        ['Pagamento Único'],
                                      ),
                                      wrapped: false,
                                    ),
                                  ),
                                  if (_model.choiceChipsValue ==
                                      'Multiplos Pagamentos')
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: LinearPercentIndicator(
                                                    percent:
                                                        valueOrDefault<double>(
                                                      functions.validaIndicador(
                                                          valueOrDefault<
                                                              double>(
                                                        ((valueOrDefault<
                                                                        double>(
                                                                      functions.sumListDouble(FFAppState()
                                                                          .paymmentsConfirmed
                                                                          .map((e) =>
                                                                              e.valor)
                                                                          .toList()),
                                                                      0.0,
                                                                    ) /
                                                                    (functions.sumListDouble(FFAppState()
                                                                        .AbastecimentosSelecionados
                                                                        .map((e) =>
                                                                            e.vlrtotal)
                                                                        .toList())!)) *
                                                                100) /
                                                            100,
                                                        0.0,
                                                      )),
                                                      0.0,
                                                    ),
                                                    lineHeight: 12.0,
                                                    animation: true,
                                                    animateFromLastPercent:
                                                        true,
                                                    progressColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    barRadius:
                                                        Radius.circular(35.0),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                ),
                                              ),
                                              FlutterFlowIconButton(
                                                borderRadius: 150.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.actReturnMPPlus =
                                                      await _model
                                                          .processaMultiplosPagamento(
                                                              context);
                                                  if (!_model
                                                      .actReturnMPPlus!) {
                                                    _model.pgtoSucess =
                                                        valueOrDefault<bool>(
                                                      functions.verifyAllConfirmed(
                                                          FFAppState()
                                                              .paymmentsConfirmed
                                                              .toList(),
                                                          functions.sumListDouble(
                                                              FFAppState()
                                                                  .AbastecimentosSelecionados
                                                                  .map((e) => e
                                                                      .vlrtotal)
                                                                  .toList())),
                                                      false,
                                                    );
                                                    _model.bWait = true;
                                                    safeSetState(() {});
                                                    await _model
                                                        .pageViewController
                                                        ?.nextPage(
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.ease,
                                                    );
                                                  } else {
                                                    safeSetState(() {
                                                      _model
                                                          .choiceChipsValueController
                                                          ?.value = [
                                                        'Pagamento Único'
                                                      ];
                                                    });
                                                    _model.bModoPgMult = false;
                                                    _model.enumSelected =
                                                        TpPagamento.VAZIO;
                                                    safeSetState(() {});
                                                  }

                                                  safeSetState(() {});
                                                },
                                              ),
                                            ].divide(SizedBox(width: 16.0)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: AutoSizeText(
                                                'Restante',
                                                maxLines: 1,
                                                minFontSize: 10.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                            AutoSizeText(
                                              valueOrDefault<String>(
                                                functions.realFormatSCifrao(
                                                    true,
                                                    valueOrDefault<String>(
                                                      functions
                                                          .sumListDouble(
                                                              FFAppState()
                                                                  .paymmentsConfirmed
                                                                  .map((e) =>
                                                                      e.valor)
                                                                  .toList())
                                                          .toString(),
                                                      '0',
                                                    )),
                                                'R\$ 0,00',
                                              ).maybeHandleOverflow(
                                                maxChars: 35,
                                                replacement: '…',
                                              ),
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final listPay = FFAppState()
                                                  .paymmentsConfirmed
                                                  .toList();
                                              if (listPay.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 250.0,
                                                    child: m_s_framework_flutter_p5iajh
                                                        .UnViewMSFrameListaVaziaWidget(
                                                      sTitulo: 'Lista Vazia',
                                                      sTexto:
                                                          'Informe um método de pagamento para prosseguir!',
                                                      bIsAction: true,
                                                      vSizeTitulo: 15.0,
                                                      vSizeTexto: 14.0,
                                                      corTitulo:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      corSubtitulo:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      sTextAction: 'Adicionar',
                                                      cColorButton:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      pIcon: Icon(
                                                        Icons.add_task,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 20.0,
                                                      ),
                                                      textSize: 14.0,
                                                      aActionButton: () async {
                                                        await _model
                                                            .processaMultiplosPagamento(
                                                                context);
                                                        safeSetState(() {});
                                                        _model.pgtoSucess =
                                                            valueOrDefault<
                                                                bool>(
                                                          functions.verifyAllConfirmed(
                                                              FFAppState()
                                                                  .paymmentsConfirmed
                                                                  .toList(),
                                                              functions.sumListDouble(
                                                                  FFAppState()
                                                                      .AbastecimentosSelecionados
                                                                      .map((e) =>
                                                                          e.vlrtotal)
                                                                      .toList())),
                                                          false,
                                                        );
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }

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
                                                        Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kktrashXFilled,
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
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
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
                                                                              var _shouldSetState = false;
                                                                              if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Getnet) {
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
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
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
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
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
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  _model.cieloEstorna = await actions.cieloLioRealizaEstorno(
                                                                                    functions.formaJsonCieloEstorno(listPayItem.tefProcessado.callerid, listPayItem.tefProcessado.nsu.toString(), listPayItem.tefProcessado.aut.toString(), listPayItem.valor.toString()).toString(),
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
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
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
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );

                                                                                    return;
                                                                                  }
                                                                                }
                                                                              }

                                                                              FFAppState().removeFromPaymmentsConfirmed(listPayItem);
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
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                171.0,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.95,
                                                                            child:
                                                                                m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                                                                              sTitulo: 'Atenção',
                                                                              sText: 'Ao confirmar, será cancelado todos os registros. Deseja continuar?',
                                                                              colorConfirm: Color(0xFFFF9700),
                                                                              colorCancel: Color(0x00000000),
                                                                              enableCancel: true,
                                                                              colorTextButtonConfirm: FlutterFlowTheme.of(context).info,
                                                                              sTextoConfirm: 'Confirmar',
                                                                              actConfirm: () async {
                                                                                FFAppState().paymmentsConfirmed = [];
                                                                                safeSetState(() {});
                                                                                safeSetState(() {
                                                                                  _model.choiceChipsValueController?.value = [
                                                                                    'Pagamento Único'
                                                                                  ];
                                                                                });
                                                                                _model.bModoPgMult = false;
                                                                                _model.enumSelected = TpPagamento.VAZIO;
                                                                                safeSetState(() {});
                                                                                _model.pgtoSucess = valueOrDefault<bool>(
                                                                                  functions.verifyAllConfirmed(FFAppState().paymmentsConfirmed.toList(), functions.sumListDouble(FFAppState().AbastecimentosSelecionados.map((e) => e.vlrtotal).toList())),
                                                                                  false,
                                                                                );
                                                                                safeSetState(() {});
                                                                              },
                                                                              actCancel: () async {
                                                                                unawaited(
                                                                                  () async {}(),
                                                                                );
                                                                                Navigator.pop(context);
                                                                              },
                                                                            ),
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
                                                                  FFAppState()
                                                                      .removeFromPaymmentsConfirmed(
                                                                          listPayItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              }

                                                              _model.pgtoSucess =
                                                                  valueOrDefault<
                                                                      bool>(
                                                                functions.verifyAllConfirmed(
                                                                    FFAppState()
                                                                        .paymmentsConfirmed
                                                                        .toList(),
                                                                    functions.sumListDouble(FFAppState()
                                                                        .AbastecimentosSelecionados
                                                                        .map((e) =>
                                                                            e.vlrtotal)
                                                                        .toList())),
                                                                false,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              _model.actReturnMPPlusdELETE =
                                                                  await _model
                                                                      .processaMultiplosPagamento(
                                                                          context);
                                                              _shouldSetState =
                                                                  true;
                                                              if (!_model
                                                                  .actReturnMPPlusdELETE!) {
                                                                _model.pgtoSucess =
                                                                    valueOrDefault<
                                                                        bool>(
                                                                  functions.verifyAllConfirmed(
                                                                      FFAppState()
                                                                          .paymmentsConfirmed
                                                                          .toList(),
                                                                      functions.sumListDouble(FFAppState()
                                                                          .AbastecimentosSelecionados
                                                                          .map((e) =>
                                                                              e.vlrtotal)
                                                                          .toList())),
                                                                  false,
                                                                );
                                                                _model.bWait =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                if (functions.sumListDouble(FFAppState()
                                                                        .paymmentsConfirmed
                                                                        .map((e) => e
                                                                            .valor)
                                                                        .toList())! >=
                                                                    functions.sumListDouble(FFAppState()
                                                                        .AbastecimentosSelecionados
                                                                        .map((e) =>
                                                                            e.vlrtotal)
                                                                        .toList())!) {
                                                                  await _model
                                                                      .pageViewController
                                                                      ?.nextPage(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    curve: Curves
                                                                        .ease,
                                                                  );
                                                                }
                                                              } else {
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .choiceChipsValueController
                                                                      ?.value = [
                                                                    'Pagamento Único'
                                                                  ];
                                                                });
                                                                _model.bModoPgMult =
                                                                    false;
                                                                _model.enumSelected =
                                                                    TpPagamento
                                                                        .VAZIO;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                            },
                                                          ),
                                                        ),
                                                        if (!listPayItem
                                                            .confirmado)
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              FFIcons.kkreload,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (!listPayItem
                                                                  .confirmado) {
                                                                _model.bWait =
                                                                    true;
                                                                _model.pgtoSucess =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .pageViewController
                                                                    ?.animateToPage(
                                                                  2,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          500),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              } else {
                                                                _model.pgtoSucess =
                                                                    valueOrDefault<
                                                                        bool>(
                                                                  functions.verifyAllConfirmed(
                                                                      FFAppState()
                                                                          .paymmentsConfirmed
                                                                          .toList(),
                                                                      functions.sumListDouble(FFAppState()
                                                                          .AbastecimentosSelecionados
                                                                          .map((e) =>
                                                                              e.vlrtotal)
                                                                          .toList())),
                                                                  false,
                                                                );
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                          ),
                                                        if (listPayItem
                                                            .confirmado)
                                                          FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
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
                                      ],
                                    ),
                                  if (!_model.bModoPgMult)
                                    Builder(
                                      builder: (context) => wrapWithModel(
                                        model: _model.tpPagamentoModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: TpPagamentoWidget(
                                          enumSelected: _model.enumSelected,
                                          bModoPagMP: false,
                                          tapCondPag: (enumTaped) async {
                                            var _shouldSetState = false;
                                            if (_model.enumSelected !=
                                                enumTaped) {
                                              FFAppState().paymmentsConfirmed =
                                                  [];
                                              safeSetState(() {});
                                              _model.enumSelected = enumTaped;
                                              _model.iParcelasCount = 1;
                                              _model.pgtoSucess = false;
                                              _model.bWait = true;
                                              _model.iModoReg = 0;
                                              safeSetState(() {});
                                              if (functions.enumGoToPage(
                                                  enumTaped,
                                                  functions
                                                      .pesquisaCondPagFromTipo(
                                                          FFAppState()
                                                              .CondPagamentoList
                                                              .toList(),
                                                          functions
                                                              .iTipoEnumPag(
                                                                  enumTaped))
                                                      ?.numeroPar)!) {
                                                if (functions.enumParcelado(
                                                    enumTaped,
                                                    functions
                                                        .pesquisaCondPagFromTipo(
                                                            FFAppState()
                                                                .CondPagamentoList
                                                                .toList(),
                                                            functions
                                                                .iTipoEnumPag(
                                                                    enumTaped))
                                                        ?.numeroPar)!) {
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
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    dialogContext)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.9,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.95,
                                                            child:
                                                                ParcelamentoWidget(
                                                              condPagDt: functions.pesquisaCondPagFromTipo(
                                                                  FFAppState()
                                                                      .CondPagamentoList
                                                                      .toList(),
                                                                  functions
                                                                      .iTipoEnumPag(
                                                                          enumTaped))!,
                                                              valorTotal: functions
                                                                  .sumListDouble(FFAppState()
                                                                      .AbastecimentosSelecionados
                                                                      .map((e) =>
                                                                          e.vlrtotal)
                                                                      .toList())!,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() => _model
                                                              .iParcelasReturned =
                                                          value));

                                                  _shouldSetState = true;
                                                  _model.iParcelasCount =
                                                      _model.iParcelasReturned!;
                                                  safeSetState(() {});
                                                } else {
                                                  _model.pgtoSucess = false;
                                                  safeSetState(() {});
                                                }

                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                                return;
                                              } else {
                                                if ((enumTaped ==
                                                        TpPagamento
                                                            .VALECOMBUSTIVEL) ||
                                                    (enumTaped ==
                                                        TpPagamento.VOUCHER)) {
                                                  _model.processaShelVale =
                                                      await action_blocks
                                                          .processaVoucherVale(
                                                    context,
                                                    tpPag: enumTaped,
                                                    valorTotal: functions
                                                        .sumListDouble(FFAppState()
                                                            .AbastecimentosSelecionados
                                                            .map((e) =>
                                                                e.vlrtotal)
                                                            .toList()),
                                                  );
                                                  _shouldSetState = true;
                                                  if (_model.processaShelVale !=
                                                      null) {
                                                    _model.pgtoSucess = false;
                                                    _model.bModoPgMult = true;
                                                    _model.iModoReg = 2;
                                                    safeSetState(() {});
                                                    safeSetState(() {
                                                      _model
                                                          .choiceChipsValueController
                                                          ?.value = [
                                                        'Multiplos Pagamentos'
                                                      ];
                                                    });
                                                    if (_model
                                                            .processaShelVale
                                                            ?.tefProcessado
                                                            .voucherpg !=
                                                        1) {
                                                      _model.actReturnMPPlusVoucher =
                                                          await _model
                                                              .processaMultiplosPagamento(
                                                                  context);
                                                      _shouldSetState = true;
                                                      if (!_model
                                                          .actReturnMPPlusVoucher!) {
                                                        _model.pgtoSucess =
                                                            valueOrDefault<
                                                                bool>(
                                                          functions.verifyAllConfirmed(
                                                              FFAppState()
                                                                  .paymmentsConfirmed
                                                                  .toList(),
                                                              functions.sumListDouble(
                                                                  FFAppState()
                                                                      .AbastecimentosSelecionados
                                                                      .map((e) =>
                                                                          e.vlrtotal)
                                                                      .toList())),
                                                          false,
                                                        );
                                                        _model.bWait = true;
                                                        safeSetState(() {});
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else {
                                                        safeSetState(() {
                                                          _model
                                                              .choiceChipsValueController
                                                              ?.value = [
                                                            'Pagamento Único'
                                                          ];
                                                        });
                                                        _model.bModoPgMult =
                                                            false;
                                                        _model.enumSelected =
                                                            TpPagamento.VAZIO;
                                                        safeSetState(() {});
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      _model.pgtoSucess =
                                                          valueOrDefault<bool>(
                                                        functions.verifyAllConfirmed(
                                                            FFAppState()
                                                                .paymmentsConfirmed
                                                                .toList(),
                                                            functions.sumListDouble(
                                                                FFAppState()
                                                                    .AbastecimentosSelecionados
                                                                    .map((e) =>
                                                                        e.vlrtotal)
                                                                    .toList())),
                                                        false,
                                                      );
                                                      _model.bWait = true;
                                                      safeSetState(() {});
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    _model.enumSelected =
                                                        TpPagamento.VAZIO;
                                                    _model.iParcelasCount = 1;
                                                    _model.pgtoSucess = false;
                                                    safeSetState(() {});
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }
                                                } else {
                                                  _model.iParcelasCount = 1;
                                                  _model.pgtoSucess = true;
                                                  safeSetState(() {});
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              _model.enumSelected =
                                                  TpPagamento.VAZIO;
                                              _model.iParcelasCount = 1;
                                              _model.pgtoSucess = false;
                                              safeSetState(() {});
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                          },
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'tpPagamentoOnPageLoadAnimation']!),
                                    ),
                                ]
                                    .divide(SizedBox(height: 12.0))
                                    .addToStart(SizedBox(height: 12.0))
                                    .addToEnd(SizedBox(height: 150.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              if (_model.finishsucess)
                                Opacity(
                                  opacity: 0.2,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -0.8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/paysuc.png',
                                        width: 175.0,
                                        height: 175.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
                                  ),
                                ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        wrapWithModel(
                                          model: _model.animationStatusModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: AnimationStatusWidget(
                                            status: () {
                                              if (_model.bWait) {
                                                return StatusFinalizado.Aguardo;
                                              } else if (_model.finishsucess &&
                                                  !_model.bWait) {
                                                return StatusFinalizado.Sucesso;
                                              } else if (!_model.finishsucess &&
                                                  !_model.bWait) {
                                                return StatusFinalizado.Falha;
                                              } else {
                                                return StatusFinalizado.Sucesso;
                                              }
                                            }(),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              () {
                                                if (_model.finishsucess) {
                                                  return 'Venda Finalizada!';
                                                } else if (!_model.pgtoSucess &&
                                                    _model.bWait) {
                                                  return 'Um momento...';
                                                } else if (_model.bWait) {
                                                  return 'Aguarde...';
                                                } else if (!_model.bWait &&
                                                    !_model.pgtoSucess) {
                                                  return 'Atenção';
                                                } else {
                                                  return 'Falha ao registrar venda!';
                                                }
                                              }()
                                                  .maybeHandleOverflow(
                                                maxChars: 35,
                                                replacement: '…',
                                              ),
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 7.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  () {
                                                    if (_model.finishsucess) {
                                                      return 'Registro efetuado com sucesso!';
                                                    } else if (!_model
                                                            .pgtoSucess &&
                                                        _model.bWait) {
                                                      return 'Estamos finalizando seu pagamento com segurança e rapidez. Isso levará apenas alguns instantes...';
                                                    } else if (_model.bWait &&
                                                        _model.pgtoSucess) {
                                                      return 'Enviando venda ao servidor, um momento...';
                                                    } else if (!_model
                                                            .pgtoSucess &&
                                                        !_model.bWait &&
                                                        _model
                                                            .bFailDeppLinkAbertura) {
                                                      return 'Falha ao abrir plugin/deeplink, verifique seu terminal e tente novamente!';
                                                    } else if (!_model
                                                            .pgtoSucess &&
                                                        !_model.bWait) {
                                                      return 'Não foi possível confirmar o pagamento, verifique os dados e tente novamente!';
                                                    } else {
                                                      return 'Falha ao enviar registro para o servidor. Verifique a conexão e os dados...';
                                                    }
                                                  }(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 3,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!_model.finishsucess &&
                                            _model.bWait)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: custom_widgets.LoadingWidget(
                                              width: 150.0,
                                              height: 150.0,
                                              colorLoading:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              iStroke: 5.0,
                                            ),
                                          ),
                                        if (_model.finishsucess)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 7.0, 0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          7.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: 'Pagamento',
                                                                                  style: TextStyle(),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.manrope(
                                                                                      fontWeight: FontWeight.w300,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            maxLines:
                                                                                1,
                                                                          ),
                                                                          RichText(
                                                                            textScaler:
                                                                                MediaQuery.of(context).textScaler,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                TextSpan(
                                                                                  text: FFAppState().HistoricoVendas.lastOrNull!.pagamentos.length > 1
                                                                                      ? '1'
                                                                                      : valueOrDefault<String>(
                                                                                          _model.aVendaRem?.idFormapgto.toString(),
                                                                                          '1',
                                                                                        ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.manrope(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: ' - ',
                                                                                  style: GoogleFonts.outfit(
                                                                                    color: FlutterFlowTheme.of(context).cardAlter,
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: valueOrDefault<String>(
                                                                                    FFAppState().HistoricoVendas.lastOrNull!.pagamentos.length > 1
                                                                                        ? 'Mútliplos Pagamentos'
                                                                                        : valueOrDefault<String>(
                                                                                            _model.aVendaRem?.descrtpvenda,
                                                                                            'DINHEIRO',
                                                                                          ),
                                                                                    '--',
                                                                                  ),
                                                                                  style: GoogleFonts.outfit(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.manrope(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            maxLines:
                                                                                1,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                collapsed:
                                                                    Container(),
                                                                expanded:
                                                                    Visibility(
                                                                  visible: FFAppState()
                                                                          .HistoricoVendas
                                                                          .lastOrNull!
                                                                          .pagamentos
                                                                          .length >=
                                                                      2,
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final listPay = FFAppState()
                                                                              .HistoricoVendas
                                                                              .lastOrNull
                                                                              ?.pagamentos
                                                                              .toList() ??
                                                                          [];

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.fromLTRB(
                                                                          0,
                                                                          12.0,
                                                                          0,
                                                                          12.0,
                                                                        ),
                                                                        primary:
                                                                            false,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listPay.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 5.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                listPayIndex) {
                                                                          final listPayItem =
                                                                              listPay[listPayIndex];
                                                                          return Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(7.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Card(
                                                                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    elevation: 2.0,
                                                                                    shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: Icon(
                                                                                        FFIcons.kkchecks,
                                                                                        color: FlutterFlowTheme.of(context).success,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                functions.sDescEnumPag(listPayItem.tPPagEnum),
                                                                                                'Não Informado',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.manrope(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            if (listPayItem.parcelas >= 2)
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  ' - ${valueOrDefault<String>(
                                                                                                    listPayItem.parcelas.toString(),
                                                                                                    '1',
                                                                                                  )} x',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                        if (listPayItem.valor > 0.0)
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.realFormatSCifrao(
                                                                                                  true,
                                                                                                  valueOrDefault<String>(
                                                                                                    listPayItem.valor.toString(),
                                                                                                    'R\$ 0,00',
                                                                                                  )),
                                                                                              'R\$ 0,00',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.manrope(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 7.0)).addToEnd(SizedBox(width: 12.0)),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                theme:
                                                                    ExpandableThemeData(
                                                                  tapHeaderToExpand:
                                                                      true,
                                                                  tapBodyToExpand:
                                                                      false,
                                                                  tapBodyToCollapse:
                                                                      false,
                                                                  headerAlignment:
                                                                      ExpandablePanelHeaderAlignment
                                                                          .center,
                                                                  hasIcon: true,
                                                                  iconSize:
                                                                      25.0,
                                                                  iconColor:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    FFAppState().HistoricoVendas.lastOrNull!.pagamentos.length >=
                                                                            2
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 4.0,
                                                          thickness: 1.0,
                                                          indent: 12.0,
                                                          endIndent: 12.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      5.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text:
                                                                            'R\$ ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 10.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          functions.realFormatSCifrao(
                                                                              false,
                                                                              _model.aVendaRem?.totalvenda.toString()),
                                                                          '0',
                                                                        ),
                                                                        style: GoogleFonts
                                                                            .manrope(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).cardAlter,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              30.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.outfit(
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
                                                                  maxLines: 1,
                                                                ).animateOnActionTrigger(
                                                                  animationsMap[
                                                                      'richTextOnActionTriggerAnimation1']!,
                                                                ),
                                                              ),
                                                              RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          'Cliente',
                                                                      style: GoogleFonts
                                                                          .manrope(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontSize:
                                                                            14.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                              AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  _model
                                                                      .aVendaRem
                                                                      ?.nomeCliente,
                                                                  '--',
                                                                ),
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    12.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          15.0,
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (_model.finishsucess)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF822B),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  width: 0.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        7.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 5.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      7.0,
                                                                      12.0,
                                                                      7.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                'ID-Venda: ',
                                                                            style:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              _model.aVendaRem?.idCodigo.toString(),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                GoogleFonts.outfit(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                          )
                                                                        ],
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
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              'Data: ',
                                                                          style:
                                                                              GoogleFonts.outfit(
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              valueOrDefault<String>(
                                                                            dateTimeFormat(
                                                                              "dd/MM/yyyy",
                                                                              m_s_framework_flutter_p5iajh_functions.dateNullFormate(functions.dataHoraJsonToDate(_model.aVendaRem?.datavenda)),
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            '15/03/2022',
                                                                          ),
                                                                          style:
                                                                              GoogleFonts.outfit(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    maxLines: 1,
                                                                  ),
                                                                ],
                                                              ),
                                                              ScrollConfiguration(
                                                                behavior: ScrollConfiguration.of(
                                                                        context)
                                                                    .copyWith(
                                                                  scrollbars:
                                                                      false,
                                                                  dragDevices: {
                                                                    PointerDeviceKind
                                                                        .mouse,
                                                                    PointerDeviceKind
                                                                        .touch,
                                                                    PointerDeviceKind
                                                                        .stylus,
                                                                    PointerDeviceKind
                                                                        .unknown,
                                                                  },
                                                                ),
                                                                child:
                                                                    Scrollbar(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        RichText(
                                                                          textScaler:
                                                                              MediaQuery.of(context).textScaler,
                                                                          text:
                                                                              TextSpan(
                                                                            children: [
                                                                              TextSpan(
                                                                                text: 'Frentista(s): ',
                                                                                style: GoogleFonts.outfit(
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                              ),
                                                                              TextSpan(
                                                                                text: valueOrDefault<String>(
                                                                                  m_s_framework_flutter_p5iajh_functions.stringListToSimpleString(', ', functions.allFrentistas(FFAppState().HistoricoVendas.lastOrNull?.abastecimentos.toList())?.toList()),
                                                                                  '-',
                                                                                ),
                                                                                style: GoogleFonts.outfit(
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.manrope(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          maxLines:
                                                                              2,
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
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderRadius: 12.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 45.0,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kkinfoCircleFilled,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 25.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            DetalheHistoricoWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'dtVenda':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .HistoricoVendas
                                                                    .lastOrNull,
                                                                ParamType
                                                                    .DataStruct,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation']!),
                                          ),
                                      ]
                                          .addToStart(SizedBox(height: 12.0))
                                          .addToEnd(SizedBox(height: 200.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (_model.finishsucess)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.35),
                                                        child: FFButtonWidget(
                                                          onPressed: (_model
                                                                      .bWait ||
                                                                  _model
                                                                      .bExecutinNF)
                                                              ? null
                                                              : () async {
                                                                  _model.bExecutinNF =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  if (animationsMap[
                                                                          'buttonOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    animationsMap[
                                                                            'buttonOnActionTriggerAnimation']!
                                                                        .controller
                                                                      ..reset()
                                                                      ..repeat();
                                                                  }
                                                                  _model.actReturnBodyFrom =
                                                                      await actions
                                                                          .buscaNFeFromDoc(
                                                                    m_s_framework_flutter_p5iajh_app_state
                                                                            .FFAppState()
                                                                        .ConfigGlobaisServer
                                                                        .host,
                                                                    _model
                                                                        .aVendaRem
                                                                        ?.idCodigo,
                                                                    m_s_framework_flutter_p5iajh_app_state
                                                                            .FFAppState()
                                                                        .Token,
                                                                    _model.aVendaRem?.modeloDocf ==
                                                                            65
                                                                        ? 'NFCe'
                                                                        : 'NFe',
                                                                  );
                                                                  if ((_model.actReturnBodyFrom !=
                                                                              null &&
                                                                          _model.actReturnBodyFrom !=
                                                                              '') &&
                                                                      (_model.actReturnBodyFrom !=
                                                                          '')) {
                                                                    _model.nfdisponivel =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    await _model
                                                                        .realizaImpressaoNFBase(
                                                                      context,
                                                                      base64Value:
                                                                          _model
                                                                              .actReturnBodyFrom,
                                                                    );
                                                                  } else {
                                                                    _model.actReturnStatus =
                                                                        await _model
                                                                            .verificaStatusNFe(context);
                                                                    if (_model
                                                                        .actReturnStatus!
                                                                        .sucess) {
                                                                      _model.nfdisponivel =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      await _model
                                                                          .realizaImpressaoNFBase(
                                                                        context,
                                                                        base64Value: _model
                                                                            .actReturnStatus
                                                                            ?.pdf,
                                                                      );
                                                                    } else {
                                                                      await m_s_framework_flutter_p5iajh_actions
                                                                          .elegantNotificationError(
                                                                        context,
                                                                        'Falha',
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .actReturnStatus
                                                                              ?.mensagem,
                                                                          '--',
                                                                        ),
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        350.0,
                                                                        'bottomcenter',
                                                                        'frombottom',
                                                                      );
                                                                    }
                                                                  }

                                                                  if (animationsMap[
                                                                          'buttonOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    animationsMap[
                                                                            'buttonOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward();
                                                                  }
                                                                  _model.bExecutinNF =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                          text: !_model
                                                                  .nfdisponivel
                                                              ? 'Nota Fiscal'
                                                              : 'Imprimir Nota Fiscal',
                                                          icon: Icon(
                                                            Icons.print_rounded,
                                                            size: 20.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 55.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            color: Color(
                                                                0xFF740DFF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            disabledColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            disabledTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                          showLoadingIndicator:
                                                              false,
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'buttonOnActionTriggerAnimation']!,
                                                        ),
                                                      ),
                                                      if (_model.bExecutinNF)
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
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child: custom_widgets
                                                                  .LoadingWidget(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                colorLoading:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                iStroke: 3.0,
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
                                      if (_model.finishsucess &&
                                          (functions
                                                  .iTipoEnumPag(FFAppState()
                                                      .paymmentsConfirmed
                                                      .lastOrNull
                                                      ?.tPPagEnum)
                                                  .toString() ==
                                              '4'))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.returnComprovante =
                                                  await actions.geraComprovante(
                                                context,
                                                FFAppState()
                                                    .HistoricoVendas
                                                    .lastOrNull,
                                              );
                                              if (FFAppState()
                                                      .ConfigLocais
                                                      .gatewayPgto ==
                                                  GateWay.Cielo) {
                                                await actions
                                                    .cieloLioRealizaImpressaoImage(
                                                  context,
                                                  _model.returnComprovante,
                                                );
                                              } else {
                                                await actions
                                                    .getNetRealizaImpressaoImage(
                                                  context,
                                                  _model.returnComprovante,
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: 'Imprimir Pedido',
                                            icon: Icon(
                                              FFIcons.kknote,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 55.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color: Color(0xFFFFA30D),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      if (!_model.bWait && _model.finishsucess)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: _model.bWait
                                                ? null
                                                : () async {
                                                    FFAppState()
                                                        .updateAFiltrosAbastecimentoStruct(
                                                      (e) => e
                                                        ..dateInitial = null
                                                        ..dateFinal = null
                                                        ..bico = null
                                                        ..tPRegistro =
                                                            TPRegistro.Todos,
                                                    );
                                                    safeSetState(() {});

                                                    context.goNamed(
                                                      TelaInicialWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'bReloadListView':
                                                            serializeParam(
                                                          true,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                            text: 'Tela Inicial',
                                            icon: Icon(
                                              Icons.format_list_bulleted_add,
                                              size: 25.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 55.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              disabledTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                            showLoadingIndicator: false,
                                          ),
                                        ),
                                      if (!_model.finishsucess && !_model.bWait)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: _model.bWait
                                                ? null
                                                : () async {
                                                    _model.pgtoSucess = functions
                                                        .verifyAllConfirmed(
                                                            FFAppState()
                                                                .paymmentsConfirmed
                                                                .toList(),
                                                            functions.sumListDouble(
                                                                FFAppState()
                                                                    .AbastecimentosSelecionados
                                                                    .map((e) =>
                                                                        e.vlrtotal)
                                                                    .toList()))!;
                                                    _model.bTentarNovamente =
                                                        true;
                                                    safeSetState(() {});
                                                    await _model
                                                        .pageViewController
                                                        ?.animateToPage(
                                                      1,
                                                      duration: Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease,
                                                    );
                                                  },
                                            text: 'Alterar Pagamento',
                                            icon: Icon(
                                              FFIcons.kkswitchHorizontal,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 55.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color: Color(0xFFFF956A),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              disabledTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                        ),
                                      if (!_model.finishsucess && !_model.bWait)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: FFButtonWidget(
                                            onPressed: _model.bWait
                                                ? null
                                                : () async {
                                                    var _shouldSetState = false;
                                                    _model.bWait = true;
                                                    safeSetState(() {});
                                                    _model.iLoopPay = 0;
                                                    safeSetState(() {});
                                                    if (!_model.bModoPgMult &&
                                                        !_model.pgtoSucess) {
                                                      FFAppState()
                                                          .paymmentsConfirmed = [];
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .addToPaymmentsConfirmed(
                                                              PaymentDataTypeStruct(
                                                        valor: functions.sumListDouble(
                                                            FFAppState()
                                                                .AbastecimentosSelecionados
                                                                .map((e) =>
                                                                    e.vlrtotal)
                                                                .toList()),
                                                        tPPagEnum:
                                                            _model.enumSelected,
                                                        parcelas: _model
                                                            .iParcelasCount,
                                                        confirmado: false,
                                                        bModoReg: 0,
                                                      ));
                                                      safeSetState(() {});
                                                    }
                                                    await _model
                                                        .loopMultiplosPagamentos(
                                                            context);
                                                    safeSetState(() {});
                                                    _model.pgtoSucess =
                                                        valueOrDefault<bool>(
                                                      functions.verifyAllConfirmed(
                                                          FFAppState()
                                                              .paymmentsConfirmed
                                                              .toList(),
                                                          functions.sumListDouble(
                                                              FFAppState()
                                                                  .AbastecimentosSelecionados
                                                                  .map((e) => e
                                                                      .vlrtotal)
                                                                  .toList())),
                                                      false,
                                                    );
                                                    safeSetState(() {});
                                                    if (_model.pgtoSucess) {
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  1000));
                                                      _model.actReturnVendaNovamente =
                                                          await _model
                                                              .confirmaVenda(
                                                                  context);
                                                      _shouldSetState = true;
                                                      if (_model
                                                          .actReturnVendaNovamente!) {
                                                        _model.finishsucess = _model
                                                            .actReturnVendaNovamente!;
                                                        _model.bWait = false;
                                                        safeSetState(() {});
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      } else {
                                                        _model.finishsucess =
                                                            _model
                                                                .actReturnVenda!;
                                                        _model.bWait = false;
                                                        safeSetState(() {});
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      _model.finishsucess =
                                                          false;
                                                      _model.bWait = false;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                            text: 'Tentar Novamente',
                                            icon: Icon(
                                              FFIcons.kkreload,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 55.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              disabledTextColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                        ),
                                      if (_model.finishsucess &&
                                          (_model.iNovoDoc! >= 1))
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.35),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.iNovoDoc! > 0) {
                                                await action_blocks.buscaVale(
                                                  context,
                                                  idcodigo: _model.iNovoDoc,
                                                );
                                                safeSetState(() {});
                                              }
                                            },
                                            text: 'Imprimir Vale',
                                            icon: Icon(
                                              FFIcons.kknotes,
                                              size: 20.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 55.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customPrimary,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 7.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.pageViewCurrentIndex != 2)
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 280),
                          curve: Curves.easeIn,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).cardTotalizacao2,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/Dot-PNG-Background.png'
                                    : 'assets/images/Dot-PNG-Background.png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      !_model.activeFormCliente
                                                          ? 12.0
                                                          : 0.0,
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    0.0),
                                            child: AutoSizeText(
                                              !_model.activeFormCliente
                                                  ? 'Totalização'
                                                  : 'Identificação'
                                                      .maybeHandleOverflow(
                                                      maxChars: 35,
                                                      replacement: '…',
                                                    ),
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    font: GoogleFonts.outfit(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          if (_model.activeFormCliente)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 5.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    size: 22.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (_model
                                                        .activeFormCliente) {
                                                      await Future.wait([
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'formOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'formOnActionTriggerAnimation']!
                                                                .controller
                                                                .reverse();
                                                          }
                                                        }),
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'iconButtonOnActionTriggerAnimation'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconButtonOnActionTriggerAnimation']!
                                                                .controller
                                                                .reverse();
                                                          }
                                                        }),
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .reverse();
                                                          }
                                                        }),
                                                      ]);
                                                      _model.activeFormCliente =
                                                          false;
                                                      safeSetState(() {});
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    } else {
                                                      _model.activeFormCliente =
                                                          true;
                                                      safeSetState(() {});
                                                      await Future.wait([
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'formOnActionTriggerAnimation'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasFormTriggered =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => animationsMap[
                                                                        'formOnActionTriggerAnimation']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                        }),
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'iconButtonOnActionTriggerAnimation'] !=
                                                              null) {
                                                            animationsMap[
                                                                    'iconButtonOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        }),
                                                        Future(() async {
                                                          if (animationsMap[
                                                                  'containerOnActionTriggerAnimation'] !=
                                                              null) {
                                                            await animationsMap[
                                                                    'containerOnActionTriggerAnimation']!
                                                                .controller
                                                                .forward(
                                                                    from: 0.0);
                                                          }
                                                        }),
                                                      ]);
                                                    }
                                                  },
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'iconButtonOnActionTriggerAnimation']!,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (!_model.activeFormCliente)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 12.0, 5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            if (_model.pageViewCurrentIndex ==
                                                0)
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: AutoSizeText(
                                                              'N° Selecionado(s)',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              maxLines: 1,
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        MouseRegion(
                                                          opaque: false,
                                                          cursor: MouseCursor
                                                                  .defer ??
                                                              MouseCursor.defer,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.9, -0.9),
                                                            children: [
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.mouseRegionHovered
                                                                      ? Color(
                                                                          0x5EE0E3E7)
                                                                      : Colors
                                                                          .transparent,
                                                                  Colors
                                                                      .transparent,
                                                                ),
                                                                elevation: 0.0,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Atenção'),
                                                                                  content: Text('Deseja limpar os itens selecionados?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancelar'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirmar'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      _model.aCTAbastecimento =
                                                                          AParamCTRegStruct(
                                                                        idcodigo: FFAppState()
                                                                            .AbastecimentosSelecionados
                                                                            .map((e) =>
                                                                                e.codAbastecimento)
                                                                            .toList(),
                                                                        terminal: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                                                                            .ConfigGlobaisServer
                                                                            .terminal,
                                                                        usuario:
                                                                            currentUserData?.usuario,
                                                                        modo: TEOpcao
                                                                            .ARemove,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.actReturnLoop =
                                                                          await AddRemoveVerificaAbastecimentoCall
                                                                              .call(
                                                                        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                                                                            .ConfigGlobaisServer
                                                                            .host,
                                                                        token: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                                                                            .Token,
                                                                        aparamsJson: _model
                                                                            .aCTAbastecimento
                                                                            ?.toMap(),
                                                                      );

                                                                      FFAppState()
                                                                          .AbastecimentosSelecionados = [];
                                                                      FFAppState()
                                                                              .FrentistaSelecionado =
                                                                          FrentistasDataTypeStruct();
                                                                      FFAppState()
                                                                              .ClienteSelected =
                                                                          ClienteListaDataTypeStruct.fromSerializableMap(
                                                                              jsonDecode('{\"ID_CODIGO\":\"1\",\"NOME\":\"CONSUMIDOR\",\"DENOME\":\"CONSUMIDOR\"}'));
                                                                      FFAppState()
                                                                          .paymmentsConfirmed = [];
                                                                      FFAppState()
                                                                              .vDesconto =
                                                                          0.0;
                                                                      safeSetState(
                                                                          () {});
                                                                      if (Navigator.of(
                                                                              context)
                                                                          .canPop()) {
                                                                        context
                                                                            .pop();
                                                                      }
                                                                      context.pushNamed(
                                                                          TelaInicialWidget
                                                                              .routeName);
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text: '',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .close_rounded,
                                                                    size: 20.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 75.0,
                                                                    height:
                                                                        38.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    color: Color(
                                                                        0x130064ED),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.manrope(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Colors.white,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        FFAppState()
                                                                            .AbastecimentosSelecionados
                                                                            .length
                                                                            .toString(),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          onEnter:
                                                              ((event) async {
                                                            safeSetState(() =>
                                                                _model.mouseRegionHovered =
                                                                    true);
                                                          }),
                                                          onExit:
                                                              ((event) async {
                                                            safeSetState(() =>
                                                                _model.mouseRegionHovered =
                                                                    false);
                                                          }),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'rowOnActionTriggerAnimation']!,
                                                    hasBeenTriggered:
                                                        hasRowTriggered),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'R\$ ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            functions.realFormatSCifrao(
                                                                false,
                                                                functions
                                                                    .sumListDouble(FFAppState()
                                                                        .AbastecimentosSelecionados
                                                                        .map((e) =>
                                                                            e.vlrtotal)
                                                                        .toList())
                                                                    .toString()),
                                                            '0',
                                                          ),
                                                          style: GoogleFonts
                                                              .manrope(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 30.0,
                                                          ),
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
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
                                                    ),
                                                    maxLines: 1,
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'richTextOnActionTriggerAnimation2']!,
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            'Desc. R\$',
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 1,
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x260064ED),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            495.0,
                                                                        child:
                                                                            VirtualKeyboardWidget(
                                                                          aValue:
                                                                              FFAppState().vDesconto,
                                                                          vTotal: functions.sumListDouble(FFAppState()
                                                                              .AbastecimentosSelecionados
                                                                              .map((e) => e.vlrtotal)
                                                                              .toList())!,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.actVirtualBack =
                                                                          value));

                                                              if (_model
                                                                      .actVirtualBack! >=
                                                                  0.0) {
                                                                FFAppState()
                                                                        .vDesconto =
                                                                    _model
                                                                        .actVirtualBack!;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        'R\$ ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.manrope(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      functions.realFormatSCifrao(
                                                                          false,
                                                                          FFAppState()
                                                                              .vDesconto
                                                                              .toString()),
                                                                      '0',
                                                                    ),
                                                                    style: GoogleFonts
                                                                        .manrope(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: ' - ',
                                                                    style: GoogleFonts
                                                                        .outfit(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w200,
                                                                      fontSize:
                                                                          10.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      formatNumber(
                                                                        (FFAppState().vDesconto *
                                                                                100) /
                                                                            (functions.sumListDouble(FFAppState().AbastecimentosSelecionados.map((e) => e.vlrtotal).toList())!),
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '##.##',
                                                                        locale:
                                                                            'pt_br',
                                                                      ),
                                                                      '0',
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: '%',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          18.0,
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
                                                              textAlign:
                                                                  TextAlign.end,
                                                              maxLines: 1,
                                                            ),
                                                          ).animateOnActionTrigger(
                                                            animationsMap[
                                                                'richTextOnActionTriggerAnimation3']!,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 5.0)),
                                                  ),
                                              ],
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    if (!_model.activeFormCliente)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  children: [
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model
                                                                .pageViewCurrentIndex ==
                                                            0) {
                                                          context.pushNamed(
                                                              TelaInicialWidget
                                                                  .routeName);
                                                        } else {
                                                          await _model
                                                              .pageViewController
                                                              ?.previousPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        }
                                                      },
                                                      text: 'Voltar',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Colors.transparent,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customPrimary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customPrimary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
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
                                                        child: Icon(
                                                          Icons
                                                              .chevron_left_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customPrimary,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.77, -0.59),
                                                      child: FFButtonWidget(
                                                        onPressed: (!_model
                                                                    .pgtoSucess &&
                                                                (_model.pageViewCurrentIndex ==
                                                                    1) &&
                                                                (!_model.bModoPgMult
                                                                    ? ((_model.enumSelected == null) ||
                                                                        (_model.enumSelected ==
                                                                            TpPagamento
                                                                                .VAZIO) ||
                                                                        !functions.verifyAllValues(
                                                                            FFAppState()
                                                                                .paymmentsConfirmed
                                                                                .toList(),
                                                                            functions.sumListDouble(FFAppState()
                                                                                .AbastecimentosSelecionados
                                                                                .map((e) => e
                                                                                    .vlrtotal)
                                                                                .toList()))!)
                                                                    : !functions.verifyAllValues(
                                                                        FFAppState()
                                                                            .paymmentsConfirmed
                                                                            .toList(),
                                                                        functions.sumListDouble(FFAppState()
                                                                            .AbastecimentosSelecionados
                                                                            .map((e) => e.vlrtotal)
                                                                            .toList()))!))
                                                            ? null
                                                            : () async {
                                                                _model.bWait =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .pageViewController
                                                                    ?.nextPage(
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          300),
                                                                  curve: Curves
                                                                      .ease,
                                                                );
                                                              },
                                                        text: 'Avançar',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconAlignment:
                                                              IconAlignment.end,
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          disabledColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
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
                                                                    5.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .navigate_next_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ).animateOnPageLoad(animationsMap[
                                              'rowOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    if (_model.activeFormCliente)
                                      Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x610064ED),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                1.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kkuserSearch,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.85,
                                                                      child:
                                                                          SelecionarClienteWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(() =>
                                                                    _model.actClienteReturn =
                                                                        value));

                                                            if (_model
                                                                    .actClienteReturn !=
                                                                null) {
                                                              FFAppState()
                                                                      .ClienteSelected =
                                                                  _model
                                                                      .actClienteReturn!;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model.edtNomeClienteTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.nome,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtCPFClienteTextController
                                                                        ?.text =
                                                                    FFAppState()
                                                                        .ClienteSelected
                                                                        .cpfcnpj;
                                                              });
                                                              safeSetState(() {
                                                                _model.edtEnderecoTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.endereco,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtCidadeTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.cidade,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.dpdUFValueController
                                                                        ?.value =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.estado,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtComplementoTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.complemento,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtCepTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.cep,
                                                                  '--',
                                                                );
                                                                _model
                                                                    .edtCepMask
                                                                    .updateMask(
                                                                  newValue:
                                                                      TextEditingValue(
                                                                    text: _model
                                                                        .edtCepTextController!
                                                                        .text,
                                                                  ),
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtBairroTextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.bairro,
                                                                  '--',
                                                                );
                                                              });
                                                              safeSetState(() {
                                                                _model.edtIBGETextController
                                                                        ?.text =
                                                                    valueOrDefault<
                                                                        String>(
                                                                  _model
                                                                      .actClienteReturn
                                                                      ?.codibge,
                                                                  '--',
                                                                );
                                                                _model
                                                                    .edtIBGEMask
                                                                    .updateMask(
                                                                  newValue:
                                                                      TextEditingValue(
                                                                    text: _model
                                                                        .edtIBGETextController!
                                                                        .text,
                                                                  ),
                                                                );
                                                              });
                                                              _model.idCidadeSelected =
                                                                  valueOrDefault<
                                                                      int>(
                                                                _model
                                                                    .actClienteReturn
                                                                    ?.codCidade,
                                                                0,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FocusTraversalGroup(
                                                          policy:
                                                              OrderedTraversalPolicy(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .edtNomeClienteTextController,
                                                              focusNode: _model
                                                                  .edtNomeClienteFocusNode,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.edtCPFClienteTextController
                                                                          ?.text =
                                                                      _model
                                                                          .edtCPFClienteTextController
                                                                          .text;
                                                                  _model
                                                                      .edtCPFClienteFocusNode
                                                                      ?.requestFocus();
                                                                  WidgetsBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (_) {
                                                                    _model.edtCPFClienteTextController
                                                                            ?.selection =
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .edtCPFClienteTextController!
                                                                          .text
                                                                          .length,
                                                                    );
                                                                  });
                                                                });
                                                              },
                                                              autofocus: false,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                hintText:
                                                                    'Nome',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
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
                                                                              12.0),
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
                                                                              12.0),
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
                                                                              12.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .transparent,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        .primaryBackground,
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
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              validator: _model
                                                                  .edtNomeClienteTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (FFAppState()
                                                            .ClienteSelected
                                                            .idCodigo >
                                                        1)
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          FFAppState()
                                                                  .ClienteSelected =
                                                              ClienteListaDataTypeStruct
                                                                  .fromSerializableMap(
                                                                      jsonDecode(
                                                                          '{\"ID_CODIGO\":\"1\",\"NOME\":\"CONSUMIDOR\",\"DENOME\":\"CONSUMIDOR\"}'));
                                                          safeSetState(() {});
                                                          _model.idCidadeSelected =
                                                              0;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .edtNomeClienteTextController
                                                                ?.clear();
                                                            _model
                                                                .edtCPFClienteTextController
                                                                ?.clear();
                                                            _model
                                                                .edtEnderecoTextController
                                                                ?.clear();
                                                            _model
                                                                .edtCidadeTextController
                                                                ?.clear();
                                                            _model
                                                                .edtBairroTextController
                                                                ?.clear();
                                                            _model
                                                                .edtIBGETextController
                                                                ?.clear();
                                                            _model
                                                                .edtComplementoTextController
                                                                ?.clear();
                                                            _model
                                                                .edtCepTextController
                                                                ?.clear();
                                                          });
                                                          safeSetState(() {
                                                            _model.edtNomeClienteTextController
                                                                    ?.text =
                                                                'CONSUMIDOR';
                                                          });
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x610064ED),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                1.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    7.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    7.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            FFIcons
                                                                .kkworldSearch,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 24.0,
                                                          ),
                                                          showLoadingIndicator:
                                                              true,
                                                          onPressed: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.apiResultj0x =
                                                                await m_s_framework_flutter_p5iajh_api_calls_util
                                                                        .ConsultaCNPJCall
                                                                    .call(
                                                              sCNPJ: m_s_framework_flutter_p5iajh_functions
                                                                  .removeCharEsp(
                                                                      _model
                                                                          .edtCPFClienteTextController
                                                                          .text),
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultj0x
                                                                    ?.succeeded ??
                                                                true)) {
                                                              safeSetState(() {
                                                                _model
                                                                    .edtNomeClienteTextController
                                                                    ?.text = m_s_framework_flutter_p5iajh_api_calls_util
                                                                        .ConsultaCNPJCall
                                                                    .razaoSocial(
                                                                  (_model.apiResultj0x
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!;
                                                              });
                                                              if (_shouldSetState)
                                                                safeSetState(
                                                                    () {});
                                                              return;
                                                            } else {
                                                              _model.apiResultxluCliente =
                                                                  await ClientesCall
                                                                      .call(
                                                                ip: m_s_framework_flutter_p5iajh_app_state
                                                                        .FFAppState()
                                                                    .ConfigGlobaisServer
                                                                    .host,
                                                                token: m_s_framework_flutter_p5iajh_app_state
                                                                        .FFAppState()
                                                                    .Token,
                                                                pesquisa:
                                                                    '\$filter=(CPFCNPJ eq \'${_model.edtCPFClienteTextController.text}\') ',
                                                                demmand: 1,
                                                                skip: 0,
                                                              );

                                                              _shouldSetState =
                                                                  true;
                                                              if ((_model
                                                                      .apiResultxluCliente
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtNomeClienteTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .nome;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtCPFClienteTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .cpfcnpj;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtEnderecoTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .endereco;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtCidadeTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .cidade;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dpdUFValueController
                                                                      ?.value = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .estado;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtComplementoTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .complemento;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtCepTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .cep;
                                                                  _model
                                                                      .edtCepMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .edtCepTextController!
                                                                          .text,
                                                                    ),
                                                                  );
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtBairroTextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .bairro;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .edtIBGETextController
                                                                      ?.text = ClientesCall
                                                                          .value(
                                                                    (_model.apiResultxluCliente
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  )!
                                                                      .firstOrNull!
                                                                      .codibge;
                                                                  _model
                                                                      .edtIBGEMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .edtIBGETextController!
                                                                          .text,
                                                                    ),
                                                                  );
                                                                });
                                                                _model.idCidadeSelected =
                                                                    ClientesCall
                                                                            .value(
                                                                  (_model.apiResultxluCliente
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                        .firstOrNull!
                                                                        .codCidade;
                                                                safeSetState(
                                                                    () {});
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              } else {
                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FocusTraversalGroup(
                                                          policy:
                                                              OrderedTraversalPolicy(),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .edtCPFClienteTextController,
                                                              focusNode: _model
                                                                  .edtCPFClienteFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.edtCPFClienteTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        10),
                                                                () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.edtCPFClienteTextController
                                                                            ?.text =
                                                                        m_s_framework_flutter_p5iajh_functions.formatCPFCNPJ(_model
                                                                            .edtCPFClienteTextController
                                                                            .text);
                                                                    _model
                                                                        .edtCPFClienteFocusNode
                                                                        ?.requestFocus();
                                                                    WidgetsBinding
                                                                        .instance
                                                                        .addPostFrameCallback(
                                                                            (_) {
                                                                      _model.edtCPFClienteTextController
                                                                              ?.selection =
                                                                          TextSelection
                                                                              .collapsed(
                                                                        offset: _model
                                                                            .edtCPFClienteTextController!
                                                                            .text
                                                                            .length,
                                                                      );
                                                                    });
                                                                  });
                                                                },
                                                              ),
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.edtEnderecoTextController
                                                                          ?.text =
                                                                      _model
                                                                          .edtEnderecoTextController
                                                                          .text;
                                                                  _model
                                                                      .edtEnderecoFocusNode
                                                                      ?.requestFocus();
                                                                  WidgetsBinding
                                                                      .instance
                                                                      .addPostFrameCallback(
                                                                          (_) {
                                                                    _model.edtEnderecoTextController
                                                                            ?.selection =
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .edtEnderecoTextController!
                                                                          .text
                                                                          .length,
                                                                    );
                                                                  });
                                                                });
                                                              },
                                                              autofocus: false,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .next,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                hintText:
                                                                    'CPF/CNPJ',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
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
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
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
                                                                              12.0),
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
                                                                              12.0),
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
                                                                              12.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .transparent,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                        .primaryBackground,
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
                                                              maxLength: 18,
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
                                                                      .primary,
                                                              validator: _model
                                                                  .edtCPFClienteTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtEnderecoTextController,
                                                            focusNode: _model
                                                                .edtEnderecoFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              safeSetState(() {
                                                                _model.edtCidadeTextController
                                                                        ?.text =
                                                                    _model
                                                                        .edtCidadeTextController
                                                                        .text;
                                                                _model
                                                                    .edtCidadeFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtCidadeTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtCidadeTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'Endereço',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Color(
                                                                  0x48636F81),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 18,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .streetAddress,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtEnderecoTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x48636F81),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Container(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x610064ED),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                1.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      2.0,
                                                                      0.0,
                                                                      2.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 8.0,
                                                            buttonSize: 45.0,
                                                            icon: Icon(
                                                              FFIcons.kksearch,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 15.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.75,
                                                                        child:
                                                                            SelecionarCidadesWidget(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.actReturnCidade =
                                                                          value));

                                                              if (_model
                                                                      .actReturnCidade !=
                                                                  null) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.edtCidadeTextController
                                                                          ?.text =
                                                                      _model
                                                                          .actReturnCidade!
                                                                          .nome;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.dpdUFValueController
                                                                          ?.value =
                                                                      _model
                                                                          .actReturnCidade!
                                                                          .uf;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.edtIBGETextController
                                                                          ?.text =
                                                                      _model
                                                                          .actReturnCidade!
                                                                          .codmunibge;
                                                                  _model
                                                                      .edtIBGEMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .edtIBGETextController!
                                                                          .text,
                                                                    ),
                                                                  );
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.edtCepTextController
                                                                          ?.text =
                                                                      _model
                                                                          .actReturnCidade!
                                                                          .cep;
                                                                  _model
                                                                      .edtCepMask
                                                                      .updateMask(
                                                                    newValue:
                                                                        TextEditingValue(
                                                                      text: _model
                                                                          .edtCepTextController!
                                                                          .text,
                                                                    ),
                                                                  );
                                                                });
                                                                _model.idCidadeSelected =
                                                                    _model
                                                                        .actReturnCidade!
                                                                        .idCodigo;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (_model
                                                            .idCidadeSelected >=
                                                        1)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: AutoSizeText(
                                                          '${valueOrDefault<String>(
                                                            _model
                                                                .idCidadeSelected
                                                                .toString(),
                                                            '0',
                                                          )}'
                                                              .maybeHandleOverflow(
                                                            maxChars: 35,
                                                            replacement: '…',
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          maxLines: 1,
                                                          minFontSize: 10.0,
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
                                                                    .info,
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
                                                    Expanded(
                                                      flex: 3,
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtCidadeTextController,
                                                            focusNode: _model
                                                                .edtCidadeFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              safeSetState(() {
                                                                _model.edtBairroTextController
                                                                        ?.text =
                                                                    _model
                                                                        .edtBairroTextController
                                                                        .text;
                                                                _model
                                                                    .edtBairroFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtBairroTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtBairroTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'Cidade',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 18,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtCidadeTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    2.0,
                                                                    2.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dpdUFValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dpdUFValue ??=
                                                                FFAppState()
                                                                    .ClienteSelected
                                                                    .estado,
                                                          ),
                                                          options: functions
                                                              .uFList()!,
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.dpdUFValue =
                                                                      val),
                                                          width: 200.0,
                                                          maxHeight: 350.0,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                          searchTextStyle:
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
                                                                        .secondaryBackground,
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
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                          hintText: 'UF',
                                                          searchHintText: '...',
                                                          searchCursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            size: 24.0,
                                                          ),
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          elevation: 0.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 10.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: true,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 5.0)),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x48636F81),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtBairroTextController,
                                                            focusNode: _model
                                                                .edtBairroFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              safeSetState(() {
                                                                _model.edtIBGETextController
                                                                        ?.text =
                                                                    _model
                                                                        .edtIBGETextController
                                                                        .text;
                                                                _model
                                                                    .edtIBGEFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtIBGETextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtIBGETextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                                _model
                                                                    .edtIBGEMask
                                                                    .updateMask(
                                                                  newValue:
                                                                      TextEditingValue(
                                                                    text: _model
                                                                        .edtIBGETextController!
                                                                        .text,
                                                                    selection:
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .edtIBGETextController!
                                                                          .text
                                                                          .length,
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'Bairro',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 18,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            keyboardType:
                                                                TextInputType
                                                                    .streetAddress,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtBairroTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 35.0,
                                                      child: VerticalDivider(
                                                        width: 5.0,
                                                        thickness: 0.5,
                                                        indent: 12.0,
                                                        endIndent: 12.0,
                                                        color:
                                                            Color(0x50FFFFFF),
                                                      ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 30.0,
                                                        icon: Icon(
                                                          FFIcons.kksearch,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 12.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    Expanded(
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtIBGETextController,
                                                            focusNode: _model
                                                                .edtIBGEFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              safeSetState(() {
                                                                _model.edtComplementoTextController
                                                                        ?.text =
                                                                    _model
                                                                        .edtComplementoTextController
                                                                        .text;
                                                                _model
                                                                    .edtComplementoFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtComplementoTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtComplementoTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                              });
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'COD. IBGE',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 9,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtIBGETextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              _model.edtIBGEMask
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x48636F81),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtComplementoTextController,
                                                            focusNode: _model
                                                                .edtComplementoFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              safeSetState(() {
                                                                _model.edtCepTextController
                                                                        ?.text =
                                                                    _model
                                                                        .edtCepTextController
                                                                        .text;
                                                                _model
                                                                    .edtCepFocusNode
                                                                    ?.requestFocus();
                                                                WidgetsBinding
                                                                    .instance
                                                                    .addPostFrameCallback(
                                                                        (_) {
                                                                  _model.edtCepTextController
                                                                          ?.selection =
                                                                      TextSelection
                                                                          .collapsed(
                                                                    offset: _model
                                                                        .edtCepTextController!
                                                                        .text
                                                                        .length,
                                                                  );
                                                                });
                                                                _model
                                                                    .edtCepMask
                                                                    .updateMask(
                                                                  newValue:
                                                                      TextEditingValue(
                                                                    text: _model
                                                                        .edtCepTextController!
                                                                        .text,
                                                                    selection:
                                                                        TextSelection
                                                                            .collapsed(
                                                                      offset: _model
                                                                          .edtCepTextController!
                                                                          .text
                                                                          .length,
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText:
                                                                  'Complemento',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 18,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtComplementoTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 35.0,
                                                      child: VerticalDivider(
                                                        width: 5.0,
                                                        thickness: 0.5,
                                                        indent: 12.0,
                                                        endIndent: 12.0,
                                                        color:
                                                            Color(0x50FFFFFF),
                                                      ),
                                                    ),
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ))
                                                      FlutterFlowIconButton(
                                                        borderRadius: 8.0,
                                                        buttonSize: 30.0,
                                                        icon: Icon(
                                                          FFIcons.kksearch,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 12.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    Expanded(
                                                      child:
                                                          FocusTraversalGroup(
                                                        policy:
                                                            OrderedTraversalPolicy(),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .edtCepTextController,
                                                            focusNode: _model
                                                                .edtCepFocusNode,
                                                            onFieldSubmitted:
                                                                (_) async {
                                                              unawaited(
                                                                () async {
                                                                  await actions
                                                                      .hideKeyboard(
                                                                    context,
                                                                  );
                                                                }(),
                                                              );
                                                            },
                                                            autofocus: false,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                              hintText: 'CEP',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
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
                                                                            12.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors
                                                                  .transparent,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .info,
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
                                                            maxLength: 9,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            validator: _model
                                                                .edtCepTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              _model.edtCepMask
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  if (_model.formKey
                                                              .currentState ==
                                                          null ||
                                                      !_model
                                                          .formKey.currentState!
                                                          .validate()) {
                                                    return;
                                                  }
                                                  FFAppState()
                                                      .updateClienteSelectedStruct(
                                                    (e) => e
                                                      ..nome = _model
                                                          .edtNomeClienteTextController
                                                          .text
                                                      ..cpfcnpj = _model
                                                          .edtCPFClienteTextController
                                                          .text
                                                      ..cidade = _model
                                                          .edtCidadeTextController
                                                          .text
                                                      ..estado =
                                                          _model.dpdUFValue
                                                      ..endereco = _model
                                                          .edtEnderecoTextController
                                                          .text
                                                      ..complemento = _model
                                                          .edtComplementoTextController
                                                          .text
                                                      ..cep = _model
                                                          .edtCepTextController
                                                          .text
                                                      ..codCidade = _model
                                                          .idCidadeSelected,
                                                  );
                                                  safeSetState(() {});
                                                  await Future.wait([
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'formOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'formOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'iconButtonOnActionTriggerAnimation'] !=
                                                          null) {
                                                        animationsMap[
                                                                'iconButtonOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse();
                                                      }
                                                    }),
                                                    Future(() async {
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse();
                                                      }
                                                    }),
                                                  ]);
                                                  _model.activeFormCliente =
                                                      false;
                                                  safeSetState(() {});
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                },
                                                text: 'Confirmar',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          46.0),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ).animateOnActionTrigger(
                                          animationsMap[
                                              'formOnActionTriggerAnimation']!,
                                          hasBeenTriggered: hasFormTriggered),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
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
