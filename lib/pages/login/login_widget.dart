import '/auth/custom_auth/auth_util.dart';
import '/components/info_senha_dia_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/index.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_ms_windows_bar_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/flutter_flow_util.dart'
    as m_s_framework_flutter_p5iajh_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = 'login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with TickerProviderStateMixin {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (m_s_framework_flutter_p5iajh_app_state.FFAppState()
                  .ConfigGlobaisServer
                  .hostPrimario !=
              '') {
        _model.disableByError = true;
        _model.sMessageError = 'Realizando conexão com o servidor...';
        _model.bTentarNovamente = false;
        safeSetState(() {});
        if (animationsMap['rowOnActionTriggerAnimation'] != null) {
          await animationsMap['rowOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
        _model.actBlockServer =
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
          if (animationsMap['rowOnActionTriggerAnimation'] != null) {
            await animationsMap['rowOnActionTriggerAnimation']!
                .controller
                .reverse();
          }
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
          _model.disableByError = !_model.actReturnTerminal!;
          safeSetState(() {});
        } else {
          if (animationsMap['rowOnActionTriggerAnimation'] != null) {
            await animationsMap['rowOnActionTriggerAnimation']!
                .controller
                .reverse();
          }
          _model.disableByError = true;
          _model.sMessageError =
              'Falha ao estabelecer conexão com o servidor...';
          _model.bTentarNovamente = true;
          safeSetState(() {});
          unawaited(
            () async {
              await m_s_framework_flutter_p5iajh_actions
                  .elegantNotificationError(
                context,
                'Falha',
                'Não foi possível conectar ao servidor da aplicação!!!',
                FlutterFlowTheme.of(context).primaryText,
                FlutterFlowTheme.of(context).secondaryBackground,
                350.0,
                'bottomcenter',
                'frombottom',
              );
            }(),
          );
          await Future.delayed(const Duration(milliseconds: 3000));
          if (animationsMap['rowOnActionTriggerAnimation'] != null) {
            await animationsMap['rowOnActionTriggerAnimation']!
                .controller
                .forward(from: 0.0);
          }
        }
      } else {
        context.pushNamed(
          ConfiguracaoWidget.routeName,
          queryParameters: {
            'adminPass': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.emailAddressFieldTextController ??= TextEditingController(
        text: FFAppState().ConfigLocais.lembrarUsuario
            ? FFAppState().ConfigLocais.usuario
            : '');
    _model.emailAddressFieldFocusNode ??= FocusNode();

    _model.passwordFieldTextController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 830.0.ms,
            color: Colors.white,
            angle: 1.292,
          ),
        ],
      ),
      'textFieldOnPageLoadAnimation1': AnimationInfo(
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
      'textFieldOnPageLoadAnimation2': AnimationInfo(
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
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 160.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFF1F4F8),
            angle: 0.524,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
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
      'rowOnActionTriggerAnimation': AnimationInfo(
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
        ],
      ),
      'buttonOnPageLoadAnimation3': AnimationInfo(
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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 440.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  30.0, 12.0, 30.0, 12.0),
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 24.0),
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Lottie.asset(
                                                'assets/jsons/Animation_-_1706711829998.json',
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.cover,
                                                animate: true,
                                              ).animateOnPageLoad(animationsMap[
                                                  'lottieAnimationOnPageLoadAnimation']!),
                                            ),
                                          ),
                                        ),
                                        SelectionArea(
                                            child: Text(
                                          'Bem-Vindo',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                                lineHeight: 1.2,
                                              ),
                                        )),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 12.0, 4.0, 0.0),
                                            child: SelectionArea(
                                                child: Text(
                                              'Porfavor, Insira seu usuário e senha para acessar o sistema.',
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
                                                    color: FlutterFlowTheme.of(
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
                                                    lineHeight: 1.5,
                                                  ),
                                            )),
                                          ),
                                        ),
                                        Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 4.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        controller: _model
                                                            .emailAddressFieldTextController,
                                                        focusNode: _model
                                                            .emailAddressFieldFocusNode,
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        readOnly: _model
                                                            .disableByError,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Usuário',
                                                          labelStyle:
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
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                          alignLabelWithHint:
                                                              true,
                                                          hintText: 'Usuário',
                                                          hintStyle:
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
                                                                        .secondaryText,
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
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      14.0,
                                                                      10.0,
                                                                      14.0,
                                                                      10.0),
                                                          prefixIcon: Icon(
                                                            FFIcons.kkuser,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.5,
                                                            ),
                                                        maxLength: 140,
                                                        maxLengthEnforcement:
                                                            MaxLengthEnforcement
                                                                .none,
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
                                                            .emailAddressFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textFieldOnPageLoadAnimation1']!),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextFormField(
                                                        controller: _model
                                                            .passwordFieldTextController,
                                                        focusNode: _model
                                                            .passwordFieldFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          Function() _navigate =
                                                              () {};
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          _model.loginBlockCopy =
                                                              await _model
                                                                  .loginActBlock(
                                                                      context);
                                                          if (_model
                                                                  .loginBlockCopy!
                                                                  .idCodigo >=
                                                              1) {
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();
                                                            await authManager
                                                                .signIn(
                                                              authenticationToken:
                                                                  m_s_framework_flutter_p5iajh_app_state
                                                                          .FFAppState()
                                                                      .Token,
                                                              refreshToken:
                                                                  m_s_framework_flutter_p5iajh_app_state
                                                                          .FFAppState()
                                                                      .Token,
                                                              authUid: _model
                                                                  .loginBlockCopy
                                                                  ?.usuario,
                                                              userData: _model
                                                                  .loginBlockCopy,
                                                            );
                                                            _navigate = () =>
                                                                context.goNamedAuth(
                                                                    TelaInicialWidget
                                                                        .routeName,
                                                                    context
                                                                        .mounted);
                                                          }

                                                          _navigate();

                                                          safeSetState(() {});
                                                        },
                                                        autofocus: false,
                                                        textInputAction:
                                                            TextInputAction
                                                                .done,
                                                        readOnly: _model
                                                            .disableByError,
                                                        obscureText: !_model
                                                            .passwordFieldVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Senha',
                                                          labelStyle:
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
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                          hintText: '••••••••',
                                                          hintStyle:
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
                                                                        .secondaryText,
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
                                                                    lineHeight:
                                                                        1.5,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
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
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFFDA29B),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFFDA29B),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      14.0,
                                                                      10.0,
                                                                      14.0,
                                                                      10.0),
                                                          prefixIcon: Icon(
                                                            FFIcons
                                                                .kkshieldLock,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                safeSetState(
                                                              () => _model
                                                                      .passwordFieldVisibility =
                                                                  !_model
                                                                      .passwordFieldVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordFieldVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 22.0,
                                                            ),
                                                          ),
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.5,
                                                            ),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        validator: _model
                                                            .passwordFieldTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'textFieldOnPageLoadAnimation2']!),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model
                                                  .ckbLembraUsuarioValue!) {
                                                safeSetState(() {
                                                  _model.ckbLembraUsuarioValue =
                                                      false;
                                                });
                                              } else {
                                                safeSetState(() {
                                                  _model.ckbLembraUsuarioValue =
                                                      true;
                                                });
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .ckbLembraUsuarioValue ??=
                                                        FFAppState()
                                                                    .ConfigLocais
                                                                    .lembrarUsuario !=
                                                                null
                                                            ? FFAppState()
                                                                .ConfigLocais
                                                                .lembrarUsuario
                                                            : false,
                                                    onChanged:
                                                        (newValue) async {
                                                      safeSetState(() => _model
                                                              .ckbLembraUsuarioValue =
                                                          newValue!);
                                                    },
                                                    side: (FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate !=
                                                            null)
                                                        ? BorderSide(
                                                            width: 2,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          )
                                                        : null,
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Lembrar Usuário',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 25.0, 4.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: _model.disableByError
                                                ? null
                                                : () async {
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    _model.loginBlock =
                                                        await _model
                                                            .loginActBlock(
                                                                context);
                                                    if (_model.loginBlock!
                                                            .idCodigo >=
                                                        1) {
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      await authManager.signIn(
                                                        authenticationToken:
                                                            m_s_framework_flutter_p5iajh_app_state
                                                                    .FFAppState()
                                                                .Token,
                                                        refreshToken:
                                                            m_s_framework_flutter_p5iajh_app_state
                                                                    .FFAppState()
                                                                .Token,
                                                        authUid: _model
                                                            .loginBlock
                                                            ?.idCodigo
                                                            .toString(),
                                                        userData:
                                                            _model.loginBlock,
                                                      );

                                                      context.pushNamedAuth(
                                                        TelaInicialWidget
                                                            .routeName,
                                                        context.mounted,
                                                        queryParameters: {
                                                          'bLogin':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                            text: 'Entrar',
                                            icon: Icon(
                                              Icons.login_rounded,
                                              size: 22.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
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
                                                      .secondaryText,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'buttonOnPageLoadAnimation1']!),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Builder(
                                            builder: (context) => Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 24.0, 16.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (m_s_framework_flutter_p5iajh_app_state
                                                                  .FFAppState()
                                                              .ConfigGlobaisServer
                                                              .chaveacesso !=
                                                          '') {
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
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  InfoSenhaDiaWidget(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() => _model
                                                                .actReturnSenha =
                                                            value));

                                                    _shouldSetState = true;
                                                    if (_model
                                                        .actReturnSenha!) {
                                                      context.pushNamed(
                                                        ConfiguracaoWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'adminPass':
                                                              serializeParam(
                                                            true,
                                                            ParamType.bool,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .bottomToTop,
                                                          ),
                                                        },
                                                      );

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      ConfiguracaoWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'adminPass':
                                                            serializeParam(
                                                          false,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                        ),
                                                      },
                                                    );

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'Não consegue acessar? ',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Colors.transparent,
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
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ).animateOnPageLoad(animationsMap[
                                                  'buttonOnPageLoadAnimation2']!),
                                            ),
                                          ),
                                        ),
                                      ].addToEnd(SizedBox(height: 25.0)),
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
            if ((!isAndroid && !isiOS && !isWeb) &&
                responsiveVisibility(
                  context: context,
                  phone: false,
                ))
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      m_s_framework_flutter_p5iajh_util.wrapWithModel(
                        model: _model.unViewMsWindowsBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: m_s_framework_flutter_p5iajh
                            .UnViewMsWindowsBarWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            if (!(isWeb
                ? MediaQuery.viewInsetsOf(context).bottom > 0
                : _isKeyboardVisible))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 360.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (!_model.bTentarNovamente!)
                                Lottie.asset(
                                  'assets/jsons/circularprogress.json',
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                  animate: true,
                                ),
                              if (_model.bTentarNovamente ?? true)
                                Lottie.asset(
                                  'assets/jsons/alert.json',
                                  width: 35.0,
                                  height: 35.0,
                                  fit: BoxFit.scaleDown,
                                  animate: true,
                                ),
                              Expanded(
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  _model.sMessageError,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  minFontSize: 8.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                )),
                              ),
                              if (_model.bTentarNovamente ?? true)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        LoginWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Tentar Novamente',
                                    options: FFButtonOptions(
                                      width: 120.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.transparent,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF8D00),
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFFF8D00),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'buttonOnPageLoadAnimation3']!),
                                ),
                            ]
                                .divide(SizedBox(width: 10.0))
                                .addToStart(SizedBox(width: 10.0))
                                .addToEnd(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animateOnActionTrigger(
                  animationsMap['rowOnActionTriggerAnimation']!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
