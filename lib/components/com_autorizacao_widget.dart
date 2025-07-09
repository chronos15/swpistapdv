import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'com_autorizacao_model.dart';
export 'com_autorizacao_model.dart';

class ComAutorizacaoWidget extends StatefulWidget {
  const ComAutorizacaoWidget({
    super.key,
    this.cancelAction,
    this.confirmAction,
    int? idFrentista,
    this.sNomeFrentista,
    this.tpSelecao,
  }) : this.idFrentista = idFrentista ?? 0;

  final Future Function()? cancelAction;
  final Future Function()? confirmAction;
  final int idFrentista;
  final String? sNomeFrentista;
  final TpSelecaoFrentista? tpSelecao;

  @override
  State<ComAutorizacaoWidget> createState() => _ComAutorizacaoWidgetState();
}

class _ComAutorizacaoWidgetState extends State<ComAutorizacaoWidget>
    with TickerProviderStateMixin {
  late ComAutorizacaoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComAutorizacaoModel());

    _model.pinCodeFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
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
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 90.0),
                  child: Container(
                    width: double.infinity,
                    height: 230.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 40.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  'Por favor, informe a senha do frentista',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                )),
                              ),
                              if (widget.sNomeFrentista != null &&
                                  widget.sNomeFrentista != '')
                                SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    widget.sNomeFrentista,
                                    'Lançamento',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                )),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: PinCodeTextField(
                                    autoDisposeControllers: false,
                                    appContext: context,
                                    length: 6,
                                    textStyle: FlutterFlowTheme.of(context)
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    enableActiveFill: false,
                                    autoFocus: true,
                                    focusNode: _model.pinCodeFocusNode,
                                    enablePinAutofill: false,
                                    errorTextSpace: 16.0,
                                    showCursor: true,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    obscureText: true,
                                    obscuringCharacter: '●',
                                    hintCharacter: '-',
                                    keyboardType: TextInputType.number,
                                    pinTheme: PinTheme(
                                      fieldHeight: 44.0,
                                      fieldWidth: 44.0,
                                      borderWidth: 2.0,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                      shape: PinCodeFieldShape.box,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      inactiveColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      selectedColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    controller: _model.pinCodeController,
                                    onChanged: (_) {},
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: _model.pinCodeControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (widget.idFrentista > 0) {
                                      _model.resultFrentistaAct =
                                          await FrentistasCall.call(
                                        filtro:
                                            '\$filter=(ID_FRENTISTA eq \'${widget.idFrentista.toString()}\')',
                                        ip: m_s_framework_flutter_p5iajh_app_state
                                                .FFAppState()
                                            .ConfigGlobaisServer
                                            .host,
                                        token:
                                            m_s_framework_flutter_p5iajh_app_state
                                                    .FFAppState()
                                                .Token,
                                      );

                                      _shouldSetState = true;
                                      if ((_model
                                              .resultFrentistaAct?.succeeded ??
                                          true)) {
                                        if (_model.pinCodeController!.text ==
                                            FrentistasCall.frentistas(
                                              (_model.resultFrentistaAct
                                                      ?.jsonBody ??
                                                  ''),
                                            )?.firstOrNull?.password) {
                                          if (widget.tpSelecao !=
                                              TpSelecaoFrentista.seFiltro) {
                                            FFAppState().FrentistaSelecionado =
                                                FrentistasCall.frentistas(
                                              (_model.resultFrentistaAct
                                                      ?.jsonBody ??
                                                  ''),
                                            )!
                                                    .firstOrNull!;
                                            safeSetState(() {});
                                          }
                                          await widget.confirmAction?.call();
                                          Navigator.pop(context, true);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  height: 180.0,
                                                  width: 320.0,
                                                  child: m_s_framework_flutter_p5iajh
                                                      .UnViewMSFrameMessageBoxWidget(
                                                    sTitulo: 'Atenção',
                                                    sText:
                                                        'Senha do frentista incorreta, verifique o dado informado e tente novamente!',
                                                    colorConfirm:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                    colorCancel:
                                                        Color(0x00000000),
                                                    enableCancel: false,
                                                    actConfirm: () async {
                                                      safeSetState(() {
                                                        _model.pinCodeController
                                                            ?.clear();
                                                      });
                                                    },
                                                    actCancel: () async {},
                                                  ),
                                                ),
                                              );
                                            },
                                          );

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await m_s_framework_flutter_p5iajh_actions
                                            .elegantNotificationCustom(
                                          context,
                                          'Falha',
                                          'Falha ao realizar conexão, verifique sua rede e tente novamente!',
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          350.0,
                                          'bottomcenter',
                                          'frombottom',
                                          FlutterFlowTheme.of(context).error,
                                          'https://cdn-icons-png.flaticon.com/512/1828/1828843.png',
                                        );
                                        if (_model.actReturnFrentistaModal!) {
                                          await widget.confirmAction?.call();
                                          Navigator.pop(context, true);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    } else {
                                      _model.actReturnFrentistaModal =
                                          await action_blocks.buscaCartaoID(
                                        context,
                                        sIDCartao:
                                            _model.pinCodeController!.text,
                                      );
                                      _shouldSetState = true;
                                      if (_model.actReturnFrentistaModal!) {
                                        Navigator.pop(context,
                                            _model.actReturnFrentistaModal);
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        safeSetState(() {
                                          _model.pinCodeController?.clear();
                                        });
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Confirmar',
                                  icon: Icon(
                                    FFIcons.kkuserCheck,
                                    size: 18.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 45.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconAlignment: IconAlignment.end,
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    color: FlutterFlowTheme.of(context).primary,
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
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'buttonOnPageLoadAnimation']!),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 16.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
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
