import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/com_autorizacao_widget.dart';
import '/components/filtros_widget.dart';
import '/components/header_widget.dart';
import '/components/selecao_inicial_widget.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'tela_inicial_model.dart';
export 'tela_inicial_model.dart';

class TelaInicialWidget extends StatefulWidget {
  const TelaInicialWidget({
    super.key,
    bool? bLogin,
  }) : this.bLogin = bLogin ?? false;

  final bool bLogin;

  static String routeName = 'TelaInicial';
  static String routePath = '/telaInicial';

  @override
  State<TelaInicialWidget> createState() => _TelaInicialWidgetState();
}

class _TelaInicialWidgetState extends State<TelaInicialWidget>
    with TickerProviderStateMixin {
  late TelaInicialModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaInicialModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      if (!FFAppState().AsConnectPersisted) {
        await m_s_framework_flutter_p5iajh_actions.testConnectionServer();
        _model.getToken = await m_s_framework_flutter_p5iajh_api_calls_util
            .ServerConnectionGroup.getTokenCall
            .call(
          path: m_s_framework_flutter_p5iajh_app_state.FFAppState()
              .ConfigGlobaisServer
              .path,
          cnpj: m_s_framework_flutter_p5iajh_app_state.FFAppState()
              .ConfigGlobaisServer
              .cnpj,
          ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
              .ConfigGlobaisServer
              .host,
        );

        if ((_model.getToken?.succeeded ?? true)) {
          m_s_framework_flutter_p5iajh_app_state.FFAppState().Token =
              m_s_framework_flutter_p5iajh_api_calls_util
                  .ServerConnectionGroup.getTokenCall
                  .token(
                    (_model.getToken?.jsonBody ?? ''),
                  )
                  .toString();
          FFAppState().updateConfigLocaisStruct(
            (e) => e
              ..versaoServer = m_s_framework_flutter_p5iajh_api_calls_util
                  .ServerConnectionGroup.getTokenCall
                  .buildServer(
                    (_model.getToken?.jsonBody ?? ''),
                  )
                  .toString()
              ..versaoMin = m_s_framework_flutter_p5iajh_api_calls_util
                  .ServerConnectionGroup.getTokenCall
                  .buildMin(
                    (_model.getToken?.jsonBody ?? ''),
                  )
                  .toString()
              ..versaoMax = m_s_framework_flutter_p5iajh_api_calls_util
                  .ServerConnectionGroup.getTokenCall
                  .buildMax(
                    (_model.getToken?.jsonBody ?? ''),
                  )
                  .toString(),
          );
          FFAppState().AsConnectPersisted = true;
          safeSetState(() {});
          _model.actReturnTerminal =
              await action_blocks.verificaTerminal(context);
          await action_blocks.verificaVersao(context);
          safeSetState(() {});
        } else {
          await Future.delayed(const Duration(milliseconds: 3000));
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          _navigate =
              () => context.goNamedAuth(LoginWidget.routeName, context.mounted);

          _navigate();
          return;
        }
      }
      _model.combustivelSelected = CombustiveisDataTypeStruct(
        idProduto: 0,
        nome: 'TODOS',
        cor: '\$000064ED',
        cortexto: '\$00FFFFFF',
      );
      safeSetState(() {});
      _model.apiListaCombustivel = await CombustiveisCall.call(
        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
            .ConfigGlobaisServer
            .host,
        token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      );

      if ((_model.apiListaCombustivel?.succeeded ?? true)) {
        _model.valuesCombustiveis = CombustiveisCall.combustiveis(
          (_model.apiListaCombustivel?.jsonBody ?? ''),
        )!
            .toList()
            .cast<CombustiveisDataTypeStruct>();
        safeSetState(() {});
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
      }

      FFAppState().AsConnectPersisted = true;
      safeSetState(() {});

      _navigate();
    });

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
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
      'staggeredViewOnPageLoadAnimation': AnimationInfo(
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
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            angle: 0.524,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOutQuint,
            delay: 5000.0.ms,
            duration: 850.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).info,
            angle: 0.524,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'floatingActionButtonOnPageLoadAnimation': AnimationInfo(
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
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: AnimatedOpacity(
          opacity: _model.btnVisible ? 1.0 : 0.0,
          duration: 300.0.ms,
          curve: Curves.easeInOut,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0,
                0.0,
                0.0,
                valueOrDefault<double>(
                  (FFAppState().AbastecimentosSelecionados.length >= 1) &&
                          FFAppState().AsConnectPersisted
                      ? 160.0
                      : 10.0,
                  160.0,
                )),
            child: FloatingActionButton(
              onPressed: () async {
                FFAppState().aRefreshList = false;
                safeSetState(() {});
                await Future.wait([
                  Future(() async {
                    safeSetState(() =>
                        _model.lvAbastecimentosPagingController?.refresh());
                    await _model.waitForOnePageForLvAbastecimentos(
                        maxWait: 500);
                    _model.bAsUpdated = true;
                    safeSetState(() {});
                    await Future.delayed(const Duration(milliseconds: 150));
                    _model.bAsUpdated = false;
                    safeSetState(() {});
                  }),
                  Future(() async {
                    safeSetState(() => _model.apiRequestCompleter2 = null);
                    await _model.waitForApiRequestCompleted2(maxWait: 1500);
                  }),
                  Future(() async {
                    _model.apiListaCombustivelRelolad =
                        await CombustiveisCall.call(
                      ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                          .ConfigGlobaisServer
                          .host,
                      token: m_s_framework_flutter_p5iajh_app_state.FFAppState()
                          .Token,
                    );

                    if ((_model.apiListaCombustivelRelolad?.succeeded ??
                        true)) {
                      _model.valuesCombustiveis = CombustiveisCall.combustiveis(
                        (_model.apiListaCombustivelRelolad?.jsonBody ?? ''),
                      )!
                          .toList()
                          .cast<CombustiveisDataTypeStruct>();
                      safeSetState(() {});
                    } else {
                      await m_s_framework_flutter_p5iajh_actions
                          .elegantNotificationCustom(
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
                    }
                  }),
                ]);

                safeSetState(() {});
              },
              backgroundColor: FlutterFlowTheme.of(context).warning,
              elevation: 2.0,
              child: Icon(
                FFIcons.kkreload,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ).animateOnPageLoad(
                animationsMap['floatingActionButtonOnPageLoadAnimation']!),
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideBarModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: SideBarWidget(
              enumPage: Pages.Home,
              actCallbackExpand: (bExpand) async {
                if (scaffoldKey.currentState!.isDrawerOpen ||
                    scaffoldKey.currentState!.isEndDrawerOpen) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: wrapWithModel(
                model: _model.headerModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: Hero(
                  tag: 'topBarHome',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: HeaderWidget(
                      bListaAtiva: _model.bListaAtiva,
                      actionNotify: () async {
                        _model.bListaAtiva = !_model.bListaAtiva;
                        safeSetState(() {});
                      },
                      actionAbastecimento: () async {
                        context.pushNamed(
                          ProdutosWidget.routeName,
                          queryParameters: {
                            'bLancamentoDiversos': serializeParam(
                              true,
                              ParamType.bool,
                            ),
                          }.withoutNulls,
                        );
                      },
                      actionDrawer: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ),
              ),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 85.0,
            elevation: 2.0,
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 170),
                curve: Curves.linear,
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      '',
                    ).image,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).primaryText,
                    width: 0.1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 50.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                FFIcons.kkfilterEdit,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 17.0,
                              ),
                              onPressed: () async {
                                FFAppState().updateAFiltrosAbastecimentoStruct(
                                  (e) => e
                                    ..combustivelSelected =
                                        _model.combustivelSelected,
                                );
                                safeSetState(() {});
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          child: FiltrosWidget(
                                            aFiltroSubmite: FFAppState()
                                                .aFiltrosAbastecimento,
                                            combustiveisValues:
                                                _model.valuesCombustiveis,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.vFiltrosReturnBS = value));

                                if (_model.vFiltrosReturnBS != null) {
                                  _model.combustivelSelected = _model
                                      .vFiltrosReturnBS?.combustivelSelected;
                                  safeSetState(() {});
                                  FFAppState().aFiltrosAbastecimento =
                                      _model.vFiltrosReturnBS!;
                                  FFAppState().update(() {});
                                  await Future.wait([
                                    Future(() async {
                                      safeSetState(() => _model
                                          .lvAbastecimentosPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForLvAbastecimentos(
                                              minWait: 300, maxWait: 1500);
                                    }),
                                    Future(() async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model.waitForApiRequestCompleted2(
                                          minWait: 300, maxWait: 1500);
                                    }),
                                  ]);
                                }

                                safeSetState(() {});
                              },
                            ),
                          ),
                          if ((_model.combustivelSelected?.idProduto == 0) &&
                              _model.bListaAtiva)
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 45.0,
                                      child: custom_widgets.ScrollControll(
                                        width: double.infinity,
                                        height: 45.0,
                                        widgetOn: () => SelecaoInicialWidget(
                                          frentistaUpdated: _model.bAsUpdated,
                                          onTapedChoice: () async {
                                            await Future.wait([
                                              Future(() async {
                                                safeSetState(() => _model
                                                    .lvAbastecimentosPagingController
                                                    ?.refresh());
                                                await _model
                                                    .waitForOnePageForLvAbastecimentos(
                                                        maxWait: 2500);
                                              }),
                                              Future(() async {
                                                safeSetState(() => _model
                                                        .apiRequestCompleter2 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted2(
                                                        maxWait: 2500);
                                              }),
                                            ]);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if ((functions.intNotNull(_model.idBicoSelected) >
                                  0) ||
                              (functions.intNotNull(
                                      _model.combustivelSelected?.idProduto) >
                                  0))
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 5.0, 0.0),
                                child: Container(
                                  height: 35.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 250.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: valueOrDefault<Color>(
                                      functions.transcColor(
                                          _model.combustivelSelected?.cor),
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: AutoSizeText(
                                        valueOrDefault<String>(
                                          _model.combustivelSelected?.nome,
                                          '--',
                                        ),
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                functions.transcColor(_model
                                                    .combustivelSelected
                                                    ?.cortexto),
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                              ),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if ((functions.intNotNull(_model.idBicoSelected) >
                                  0) ||
                              (functions.intNotNull(
                                      _model.combustivelSelected?.idProduto) >
                                  0))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.clear_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  _model.combustivelSelected =
                                      CombustiveisDataTypeStruct(
                                    idProduto: 0,
                                    nome: 'TODOS',
                                    cor: '\$000064ED',
                                    cortexto: '\$00FFFFFF',
                                  );
                                  _model.bListaAtiva =
                                      _model.idBicoSelected == 0;
                                  _model.idBicoSelected = 0;
                                  safeSetState(() {});
                                  FFAppState()
                                      .updateAFiltrosAbastecimentoStruct(
                                    (e) => e
                                      ..bico = null
                                      ..tPRegistro = TPRegistro.Todos,
                                  );
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      safeSetState(() => _model
                                          .lvAbastecimentosPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForLvAbastecimentos(
                                              maxWait: 1500);
                                    }),
                                    Future(() async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model.waitForApiRequestCompleted2(
                                          maxWait: 1500);
                                    }),
                                  ]);
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'iconButtonOnPageLoadAnimation']!),
                            ),
                        ].divide(SizedBox(width: 0.0)),
                      ),
                    ),
                    if (!_model.bListaAtiva)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 5.0, 12.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter2 ??=
                                    Completer<ApiCallResponse>()
                                      ..complete(BicosCall.call(
                                        ip: m_s_framework_flutter_p5iajh_app_state
                                                .FFAppState()
                                            .ConfigGlobaisServer
                                            .host,
                                        token:
                                            m_s_framework_flutter_p5iajh_app_state
                                                    .FFAppState()
                                                .Token,
                                        filtro: _model.combustivelSelected
                                                    ?.idProduto !=
                                                0
                                            ? '\$filter=(ID_PRODUTO eq \'${_model.combustivelSelected?.idProduto.toString()}\')'
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                  if (bicos.isEmpty) {
                                    return Center(
                                      child: Container(
                                        width: double.infinity,
                                        height: 250.0,
                                        child: m_s_framework_flutter_p5iajh
                                            .UnViewMSFrameListaVaziaWidget(
                                          sTitulo: 'Lista Vazia',
                                          sTexto:
                                              'Verifique seus filtros ou conexão com a internet e tente novamente!',
                                          bIsAction: false,
                                          vSizeTitulo: 16.0,
                                          vSizeTexto: 14.0,
                                          corTitulo:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          corSubtitulo:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          aActionButton: () async {},
                                        ),
                                      ),
                                    );
                                  }

                                  return RefreshIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    strokeWidth: 1.0,
                                    onRefresh: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter2 = null);
                                      await _model
                                          .waitForApiRequestCompleted2();
                                    },
                                    child: MasonryGridView.builder(
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount: bicos.length,
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        0,
                                      ),
                                      itemBuilder: (context, bicosIndex) {
                                        final bicosItem = bicos[bicosIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.bListaAtiva = true;
                                            _model.combustivelSelected =
                                                functions
                                                    .filterCombustiveisDTByID(
                                                        bicosItem.idProduto,
                                                        _model
                                                            .valuesCombustiveis
                                                            .toList());
                                            _model.idBicoSelected =
                                                bicosItem.idBico;
                                            safeSetState(() {});
                                            FFAppState()
                                                .updateAFiltrosAbastecimentoStruct(
                                              (e) => e
                                                ..bico = bicosItem
                                                ..tPRegistro = TPRegistro.Todos,
                                            );
                                            safeSetState(() {});
                                            safeSetState(() => _model
                                                .lvAbastecimentosPagingController
                                                ?.refresh());
                                          },
                                          child: Container(
                                            height: 145.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: FFAppState()
                                                            .aFiltrosAbastecimento
                                                            .bico ==
                                                        bicosItem
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 7.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 60.0,
                                                      height: 60.0,
                                                      decoration: BoxDecoration(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          functions.transcColor(
                                                              bicosItem.cor),
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Icon(
                                                        Icons
                                                            .local_gas_station_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 32.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Bico ${bicosItem.idBico.toString()}',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .manrope(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                                              .secondaryText,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'staggeredViewOnPageLoadAnimation']!);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (_model.bListaAtiva &&
                        FFAppState().AsConnectPersisted &&
                        !FFAppState().aRefreshList)
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            safeSetState(() {});
                          },
                          child: RefreshIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            strokeWidth: 1.0,
                            onRefresh: () async {
                              safeSetState(() => _model
                                  .lvAbastecimentosPagingController
                                  ?.refresh());
                              await _model.waitForOnePageForLvAbastecimentos(
                                  maxWait: 1500);
                            },
                            child: PagedListView<ApiPagingParams,
                                dynamic>.separated(
                              pagingController:
                                  _model.setLvAbastecimentosController(
                                (nextPageMarker) =>
                                    ListaAbastecimentosCall.call(
                                  ip: m_s_framework_flutter_p5iajh_app_state
                                          .FFAppState()
                                      .ConfigGlobaisServer
                                      .host,
                                  token: m_s_framework_flutter_p5iajh_app_state
                                          .FFAppState()
                                      .Token,
                                  demmand: 30,
                                  skip: valueOrDefault<int>(
                                        nextPageMarker.nextPageNumber,
                                        0,
                                      ) *
                                      30,
                                  filtro: functions.addFilterAbastecimento(
                                      FFAppState()
                                          .aFiltrosAbastecimento
                                          .frentista
                                          .idFrentista,
                                      functions.dataTimeToTimeStamp(
                                          m_s_framework_flutter_p5iajh_functions
                                              .dateNullFormate(FFAppState()
                                                  .aFiltrosAbastecimento
                                                  .dateInitial),
                                          FFAppState()
                                              .aFiltrosAbastecimento
                                              .dateFinal),
                                      valueOrDefault<int>(
                                        _model.combustivelSelected?.idProduto,
                                        0,
                                      ),
                                      FFAppState()
                                          .aFiltrosAbastecimento
                                          .bico
                                          .idBico, () {
                                    if (FFAppState()
                                            .aFiltrosAbastecimento
                                            .tPRegistro ==
                                        TPRegistro.Diversos) {
                                      return 0;
                                    } else if (FFAppState()
                                            .aFiltrosAbastecimento
                                            .tPRegistro ==
                                        TPRegistro.Abastecimentos) {
                                      return 1;
                                    } else {
                                      return null;
                                    }
                                  }()),
                                ),
                              ),
                              padding: EdgeInsets.fromLTRB(
                                0,
                                10.0,
                                0,
                                10.0,
                              ),
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 5.0),
                              builderDelegate:
                                  PagedChildBuilderDelegate<dynamic>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: SpinKitRipple(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 70.0,
                                    ),
                                  ),
                                ),
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
                                  child: SizedBox(
                                    width: 70.0,
                                    height: 70.0,
                                    child: SpinKitRipple(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 70.0,
                                    ),
                                  ),
                                ),
                                noItemsFoundIndicatorBuilder: (_) => Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 220.0,
                                    child: m_s_framework_flutter_p5iajh
                                        .UnViewMSFrameListaVaziaWidget(
                                      sTitulo: 'Lista Vazia',
                                      sTexto:
                                          'Verifique seus filtros ou utilize o botão atualizar para carregar novos registros.',
                                      bIsAction: false,
                                      vSizeTitulo: 16.0,
                                      vSizeTexto: 14.0,
                                      corTitulo: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      corSubtitulo: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      aActionButton: () async {},
                                    ),
                                  ),
                                ),
                                itemBuilder:
                                    (context, _, ultimosAbastecimentoIndex) {
                                  final ultimosAbastecimentoItem = _model
                                      .lvAbastecimentosPagingController!
                                      .itemList![ultimosAbastecimentoIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          functions.transcColor(
                                              valueOrDefault<String>(
                                            ultimosAbastecimentoItem.cor,
                                            '--',
                                          )),
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState()
                                                              .AbastecimentosSelecionados
                                                              .where((e) =>
                                                                  e.codAbastecimento ==
                                                                  ultimosAbastecimentoItem
                                                                      .codAbastecimento)
                                                              .toList()
                                                              .length >=
                                                          1
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .cardSelection
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (valueOrDefault<int>(
                                                          ultimosAbastecimentoItem
                                                              .idBico,
                                                          0,
                                                        ) ==
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    40.0),
                                                        child: Icon(
                                                          FFIcons.kkboxSeam,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.transcColor(
                                                                ultimosAbastecimentoItem
                                                                    .cor),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    if (valueOrDefault<int>(
                                                          ultimosAbastecimentoItem
                                                              .idBico,
                                                          0,
                                                        ) !=
                                                        0)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    40.0),
                                                        child: Icon(
                                                          Icons
                                                              .local_gas_station_rounded,
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.transcColor(
                                                                ultimosAbastecimentoItem
                                                                    .cor),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
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
                                                            AutoSizeText(
                                                              valueOrDefault<
                                                                  String>(
                                                                ultimosAbastecimentoItem
                                                                    .combustivel,
                                                                '--',
                                                              ).maybeHandleOverflow(
                                                                maxChars: 24,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .manrope(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            AutoSizeText(
                                                              '${valueOrDefault<String>(
                                                                ultimosAbastecimentoItem
                                                                    .frentista,
                                                                '--',
                                                              )}',
                                                              maxLines: 1,
                                                              minFontSize: 8.0,
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
                                                                        .secondaryText,
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
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                dateTimeFormat(
                                                                  "dd/MM/yyyy  • HH:mm",
                                                                  m_s_framework_flutter_p5iajh_functions
                                                                      .dateNullFormate(
                                                                          functions
                                                                              .dataHoraJsonToDate(valueOrDefault<String>(
                                                                    ultimosAbastecimentoItem
                                                                        .datahora,
                                                                    '--',
                                                                  ))),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                '15/03/2022  • 10:12',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .manrope(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'TESTE'),
                                                                  content: Text(
                                                                      '\$filter=(DATA EQ \'${dateTimeFormat(
                                                                    "yyyy-MM-dd",
                                                                    getCurrentTimestamp,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}\')'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      ultimosAbastecimentoItem
                                                                          .quantidade,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '##0.000',
                                                                      locale:
                                                                          'pt_br',
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style:
                                                                      GoogleFonts
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
                                                                ),
                                                                TextSpan(
                                                                  text: ' ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: valueOrDefault<
                                                                      String>(
                                                                    ultimosAbastecimentoItem
                                                                        .unidade,
                                                                    'L',
                                                                  ),
                                                                  style:
                                                                      GoogleFonts
                                                                          .outfit(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
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
                                                                          valueOrDefault<String>(
                                                                            ultimosAbastecimentoItem.vlrtotal.toString(),
                                                                            '0',
                                                                          )),
                                                                      '0,00',
                                                                    ),
                                                                    style: GoogleFonts
                                                                        .manrope(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: '  ',
                                                                    style:
                                                                        TextStyle(),
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
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 1.0),
                                            child: Container(
                                              width: 40.0,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions.transcColor(
                                                      valueOrDefault<String>(
                                                    ultimosAbastecimentoItem
                                                        .cor,
                                                    '--',
                                                  )),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(7.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  topLeft: Radius.circular(7.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  '#${valueOrDefault<String>(
                                                    ultimosAbastecimentoItem
                                                        .idBico
                                                        .toString(),
                                                    '0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.outfit(
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
                                                        color: ultimosAbastecimentoItem
                                                                    .cortexto ==
                                                                '\$00000000'
                                                            ? Colors.black
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
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
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed: () async {
                                                if (FFAppState()
                                                    .AbastecimentosSelecionados
                                                    .contains(
                                                        ultimosAbastecimentoItem)) {
                                                  unawaited(
                                                    () async {
                                                      _model.actaRemoveOnly =
                                                          await AddRemoveVerificaAbastecimentoCall
                                                              .call(
                                                        ip: m_s_framework_flutter_p5iajh_app_state
                                                                .FFAppState()
                                                            .ConfigGlobaisServer
                                                            .host,
                                                        token:
                                                            m_s_framework_flutter_p5iajh_app_state
                                                                    .FFAppState()
                                                                .Token,
                                                        aparamsJson: _model
                                                            .aDataParamsCT
                                                            ?.toMap(),
                                                      );
                                                    }(),
                                                  );
                                                  FFAppState()
                                                      .removeFromAbastecimentosSelecionados(
                                                          ultimosAbastecimentoItem);
                                                  safeSetState(() {});
                                                } else {
                                                  if ((ultimosAbastecimentoItem
                                                              .idFrentista ==
                                                          FFAppState()
                                                              .FrentistaSelecionado
                                                              .idFrentista) ||
                                                      (FFAppState()
                                                              .ConfigRemota
                                                              .solicitaSenha ==
                                                          'N') ||
                                                      (ultimosAbastecimentoItem
                                                              .idFrentista ==
                                                          FFAppState()
                                                              .aFiltrosAbastecimento
                                                              .frentista
                                                              .idFrentista)) {
                                                    FFAppState()
                                                        .addToAbastecimentosSelecionados(
                                                            ultimosAbastecimentoItem);
                                                    safeSetState(() {});
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
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
                                                                  1.0,
                                                              width: 350.0,
                                                              child:
                                                                  ComAutorizacaoWidget(
                                                                idFrentista:
                                                                    ultimosAbastecimentoItem
                                                                        .idFrentista,
                                                                sNomeFrentista:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  ultimosAbastecimentoItem
                                                                      .frentista,
                                                                  '--',
                                                                ),
                                                                tpSelecao:
                                                                    TpSelecaoFrentista
                                                                        .seComparative,
                                                                cancelAction:
                                                                    () async {},
                                                                confirmAction:
                                                                    () async {
                                                                  FFAppState()
                                                                      .addToAbastecimentosSelecionados(
                                                                          ultimosAbastecimentoItem);
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                }

                                                safeSetState(() {});
                                              },
                                              text: '',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: double.infinity,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Colors.transparent,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.transparent,
                                                      fontSize: 0.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!),
                      ),
                    if ((FFAppState().AbastecimentosSelecionados.length <= 0) &&
                        FFAppState().AsConnectPersisted &&
                        !FFAppState().aRefreshList)
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: AutoSizeText(
                                'v. ${valueOrDefault<String>(
                                  FFAppState().ConfigLocais.versaoClienteAtual,
                                  '1.0.0',
                                )}',
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['rowOnPageLoadAnimation']!),
                    if ((FFAppState().AbastecimentosSelecionados.length >= 1) &&
                        FFAppState().AsConnectPersisted)
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        child: Container(
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
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                            ),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).cardTotalizacao,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AutoSizeText(
                                'Totalização',
                                maxLines: 1,
                                minFontSize: 10.0,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: AutoSizeText(
                                          'N° Selecionado(s)',
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          minFontSize: 10.0,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: valueOrDefault<String>(
                                                formatNumber(
                                                  functions.sumListDoubleQtd(
                                                      FFAppState()
                                                          .AbastecimentosSelecionados
                                                          .map((e) =>
                                                              e.quantidade)
                                                          .toList()),
                                                  formatType: FormatType.custom,
                                                  format: '##0.000',
                                                  locale: 'pt_br',
                                                ),
                                                '0',
                                              ),
                                              style: GoogleFonts.manrope(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Qtde',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            TextSpan(
                                              text: valueOrDefault<double>(
                                                        functions.sumListDouble(
                                                            FFAppState()
                                                                .AbastecimentosSelecionados
                                                                .map((e) => e
                                                                    .quantidade)
                                                                .toList()),
                                                        0.0,
                                                      ) >
                                                      0.0
                                                  ? 's'
                                                  : '',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.outfit(
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
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 12.0, 2.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.9, -0.9),
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: valueOrDefault<Color>(
                                              _model.mouseRegionHovered
                                                  ? Color(0x5EE0E3E7)
                                                  : Colors.transparent,
                                              Colors.transparent,
                                            ),
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Atenção'),
                                                              content: Text(
                                                                  'Deseja limpar os itens selecionados!?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  _model.aDataParamsCT =
                                                      AParamCTRegStruct(
                                                    idcodigo: FFAppState()
                                                        .AbastecimentosSelecionados
                                                        .map((e) =>
                                                            e.codAbastecimento)
                                                        .toList(),
                                                    terminal:
                                                        m_s_framework_flutter_p5iajh_app_state
                                                                .FFAppState()
                                                            .ConfigGlobaisServer
                                                            .terminal,
                                                    usuario: currentUserData
                                                        ?.usuario,
                                                    modo: TEOpcao.ARemove,
                                                  );
                                                  safeSetState(() {});
                                                  _model.actReturnLoop =
                                                      await AddRemoveVerificaAbastecimentoCall
                                                          .call(
                                                    ip: m_s_framework_flutter_p5iajh_app_state
                                                            .FFAppState()
                                                        .ConfigGlobaisServer
                                                        .host,
                                                    token:
                                                        m_s_framework_flutter_p5iajh_app_state
                                                                .FFAppState()
                                                            .Token,
                                                    aparamsJson: _model
                                                        .aDataParamsCT
                                                        ?.toMap(),
                                                  );

                                                  FFAppState()
                                                      .AbastecimentosSelecionados = [];
                                                  FFAppState()
                                                          .FrentistaSelecionado =
                                                      FrentistasDataTypeStruct();
                                                  FFAppState()
                                                      .paymmentsConfirmed = [];
                                                  safeSetState(() {});
                                                }

                                                safeSetState(() {});
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.close_rounded,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 75.0,
                                                height: 38.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 10.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                iconColor:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                color: Color(0x130064ED),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Container(
                                              width: 20.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
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
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionHovered = false);
                                      }),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'R\$ ',
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 10.0,
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
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      functions.realFormatSCifrao(
                                                          false,
                                                          functions
                                                              .sumListDouble(FFAppState()
                                                                  .AbastecimentosSelecionados
                                                                  .map((e) => e
                                                                      .vlrtotal)
                                                                  .toList())
                                                              .toString()),
                                                      '0',
                                                    ),
                                                    style: GoogleFonts.manrope(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 30.0,
                                                    ),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
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
                                              maxLines: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          children: [
                                            Builder(
                                              builder: (context) => Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    _model.aIDsInUses = [];
                                                    safeSetState(() {});
                                                    _model.aDataParamsCT =
                                                        AParamCTRegStruct(
                                                      idcodigo: FFAppState()
                                                          .AbastecimentosSelecionados
                                                          .map((e) => e
                                                              .codAbastecimento)
                                                          .toList(),
                                                      terminal:
                                                          m_s_framework_flutter_p5iajh_app_state
                                                                  .FFAppState()
                                                              .ConfigGlobaisServer
                                                              .terminal,
                                                      usuario: currentUserData
                                                          ?.usuario,
                                                      modo: TEOpcao.AAdd,
                                                    );
                                                    safeSetState(() {});
                                                    _model.actReturnCTAdd =
                                                        await AddRemoveVerificaAbastecimentoCall
                                                            .call(
                                                      ip: m_s_framework_flutter_p5iajh_app_state
                                                              .FFAppState()
                                                          .ConfigGlobaisServer
                                                          .host,
                                                      token:
                                                          m_s_framework_flutter_p5iajh_app_state
                                                                  .FFAppState()
                                                              .Token,
                                                      aparamsJson: _model
                                                          .aDataParamsCT
                                                          ?.toMap(),
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.actReturnCTAdd
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (AddRemoveVerificaAbastecimentoCall
                                                          .result(
                                                        (_model.actReturnCTAdd
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!) {
                                                        context.pushNamed(
                                                            CheckoutWidget
                                                                .routeName);
                                                      } else {
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
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 171.0,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.95,
                                                                  child: m_s_framework_flutter_p5iajh
                                                                      .UnViewMSFrameMessageBoxWidget(
                                                                    sTitulo:
                                                                        'Atenção',
                                                                    sText:
                                                                        '${AddRemoveVerificaAbastecimentoCall.mensagem(
                                                                      (_model.actReturnCTAdd
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )}',
                                                                    colorConfirm:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    colorCancel:
                                                                        Color(
                                                                            0x00000000),
                                                                    enableCancel:
                                                                        false,
                                                                    colorTextButtonConfirm:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                    sTextoConfirm:
                                                                        'Ok',
                                                                    actConfirm:
                                                                        () async {},
                                                                    actCancel:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );

                                                        for (int loop1Index = 0;
                                                            loop1Index <
                                                                AddRemoveVerificaAbastecimentoCall
                                                                        .abastinuso(
                                                                  (_model.actReturnCTAdd
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                    .length;
                                                            loop1Index++) {
                                                          final currentLoop1Item =
                                                              AddRemoveVerificaAbastecimentoCall
                                                                  .abastinuso(
                                                            (_model.actReturnCTAdd
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )![loop1Index];
                                                          FFAppState().removeFromAbastecimentosSelecionados(FFAppState()
                                                              .AbastecimentosSelecionados
                                                              .where((e) =>
                                                                  currentLoop1Item ==
                                                                  e.codAbastecimento)
                                                              .toList()
                                                              .firstOrNull!);
                                                          safeSetState(() {});
                                                        }
                                                        for (int loop2Index = 0;
                                                            loop2Index <
                                                                AddRemoveVerificaAbastecimentoCall
                                                                        .abastindisponiveis(
                                                                  (_model.actReturnCTAdd
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!
                                                                    .length;
                                                            loop2Index++) {
                                                          final currentLoop2Item =
                                                              AddRemoveVerificaAbastecimentoCall
                                                                  .abastindisponiveis(
                                                            (_model.actReturnCTAdd
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )![loop2Index];
                                                          FFAppState().removeFromAbastecimentosSelecionados(FFAppState()
                                                              .AbastecimentosSelecionados
                                                              .where((e) =>
                                                                  currentLoop2Item ==
                                                                  e.codAbastecimento)
                                                              .toList()
                                                              .firstOrNull!);
                                                          safeSetState(() {});
                                                        }
                                                        FFAppState()
                                                                .FrentistaSelecionado =
                                                            FrentistasDataTypeStruct();
                                                        safeSetState(() {});
                                                        safeSetState(() => _model
                                                            .lvAbastecimentosPagingController
                                                            ?.refresh());
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child:
                                                                GestureDetector(
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
                                                                height: 171.0,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.95,
                                                                child: m_s_framework_flutter_p5iajh
                                                                    .UnViewMSFrameMessageBoxWidget(
                                                                  sTitulo:
                                                                      'Atenção',
                                                                  sText:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    functions.resultMessagesFromCode((_model
                                                                            .actReturnCTAdd
                                                                            ?.statusCode ??
                                                                        200)),
                                                                    'Falha ao realizar comunicação com o servidor!',
                                                                  ),
                                                                  colorConfirm:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  colorCancel:
                                                                      Color(
                                                                          0x00000000),
                                                                  enableCancel:
                                                                      false,
                                                                  colorTextButtonConfirm:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                  sTextoConfirm:
                                                                      'Ok',
                                                                  actConfirm:
                                                                      () async {},
                                                                  actCancel:
                                                                      () async {},
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: 'Avançar',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconAlignment:
                                                        IconAlignment.end,
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
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .fontStyle,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.navigate_next_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 5.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                  ].addToStart(SizedBox(height: 12.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
