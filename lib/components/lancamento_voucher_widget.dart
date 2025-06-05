import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_scanner_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'lancamento_voucher_model.dart';
export 'lancamento_voucher_model.dart';

class LancamentoVoucherWidget extends StatefulWidget {
  const LancamentoVoucherWidget({
    super.key,
    required this.totalPay,
    required this.totalAbastecimento,
  });

  final double? totalPay;
  final double? totalAbastecimento;

  @override
  State<LancamentoVoucherWidget> createState() =>
      _LancamentoVoucherWidgetState();
}

class _LancamentoVoucherWidgetState extends State<LancamentoVoucherWidget>
    with TickerProviderStateMixin {
  late LancamentoVoucherModel _model;

  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LancamentoVoucherModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() {
        _model.edtDescontoTextController?.text =
            functions.edtTextToCurrency('0')!;
      });
      _model.idPay = -1;
      _model.dpdActive = false;
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.edtDescontoTextController ??= TextEditingController();
    _model.edtDescontoFocusNode ??= FocusNode();
    _model.edtDescontoFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.edtDescontoTextController?.text = (functions
                      .stringToDouble(_model.edtDescontoTextController.text)! <=
                  widget.totalAbastecimento!
              ? functions
                  .edtTextToCurrency(_model.edtDescontoTextController.text)!
              : functions.edtTextToCurrency('0')!);
        });
      },
    );
    _model.emailAddressFieldTextController ??= TextEditingController();
    _model.emailAddressFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
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
    _model.maybeDispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.96,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 350.0,
                          maxWidth: 400.0,
                          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
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
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: AutoSizeText(
                                              'Dados Voucher',
                                              maxLines: 1,
                                              minFontSize: 12.0,
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
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                    child:
                                                                        AutoSizeText(
                                                                      'Total Abastecimento',
                                                                      maxLines:
                                                                          1,
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
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.realFormatSCifrao(
                                                                        true,
                                                                        widget
                                                                            .totalAbastecimento
                                                                            ?.toString()),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .success,
                                                                        fontSize:
                                                                            18.0,
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
                                                              ]
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          10.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              12.0))
                                                                  .addToEnd(
                                                                      SizedBox(
                                                                          width:
                                                                              12.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 45.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .edtDescontoTextController,
                                                                    focusNode:
                                                                        _model
                                                                            .edtDescontoFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.edtDescontoTextController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              0),
                                                                      () async {
                                                                        if (functions.stringToDouble(_model.edtDescontoTextController.text)! <=
                                                                            widget.totalAbastecimento!) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.edtDescontoTextController?.text =
                                                                                functions.edtTextToCurrency(_model.edtDescontoTextController.text)!;
                                                                            _model.edtDescontoFocusNode?.requestFocus();
                                                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                                                              _model.edtDescontoTextController?.selection = TextSelection.collapsed(
                                                                                offset: _model.edtDescontoTextController!.text.length,
                                                                              );
                                                                            });
                                                                          });
                                                                        } else {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.edtDescontoTextController?.text =
                                                                                functions.edtTextToCurrency('0')!;
                                                                            _model.edtDescontoFocusNode?.requestFocus();
                                                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                                                              _model.edtDescontoTextController?.selection = TextSelection.collapsed(
                                                                                offset: _model.edtDescontoTextController!.text.length,
                                                                              );
                                                                            });
                                                                          });
                                                                          await m_s_framework_flutter_p5iajh_actions
                                                                              .elegantNotificationCustom(
                                                                            context,
                                                                            'Atenção',
                                                                            'Desconto superior ao total permitido!',
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                            350.0,
                                                                            'bottomcenter',
                                                                            'frombottom',
                                                                            Color(0xFFFF9F04),
                                                                            'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                    onFieldSubmitted:
                                                                        (_) async {
                                                                      if (functions.stringToDouble(_model
                                                                              .edtDescontoTextController
                                                                              .text)! <=
                                                                          widget
                                                                              .totalAbastecimento!) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .edtDescontoTextController
                                                                              ?.text = functions.edtTextToCurrency(_model.edtDescontoTextController.text)!;
                                                                        });
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .emailAddressFieldTextController
                                                                              ?.text = _model.emailAddressFieldTextController.text;
                                                                          _model
                                                                              .emailAddressFieldFocusNode
                                                                              ?.requestFocus();
                                                                          WidgetsBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) {
                                                                            _model.emailAddressFieldTextController?.selection =
                                                                                TextSelection.collapsed(
                                                                              offset: _model.emailAddressFieldTextController!.text.length,
                                                                            );
                                                                          });
                                                                        });
                                                                      } else {
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .edtDescontoTextController
                                                                              ?.text = functions.edtTextToCurrency('0')!;
                                                                          _model
                                                                              .edtDescontoFocusNode
                                                                              ?.requestFocus();
                                                                          WidgetsBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) {
                                                                            _model.edtDescontoTextController?.selection =
                                                                                TextSelection.collapsed(
                                                                              offset: _model.edtDescontoTextController!.text.length,
                                                                            );
                                                                          });
                                                                        });
                                                                        await m_s_framework_flutter_p5iajh_actions
                                                                            .elegantNotificationCustom(
                                                                          context,
                                                                          'Atenção',
                                                                          'Desconto superior ao total permitido!',
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                          350.0,
                                                                          'bottomcenter',
                                                                          'frombottom',
                                                                          Color(
                                                                              0xFFFF9F04),
                                                                          'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                        );
                                                                      }
                                                                    },
                                                                    autofocus:
                                                                        false,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
                                                                      labelText:
                                                                          'Desconto',
                                                                      labelStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FontWeight.w300,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                      alignLabelWithHint:
                                                                          true,
                                                                      hintText:
                                                                          'R\$ 0,00',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.manrope(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customPrimary,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          10.0,
                                                                          14.0,
                                                                          10.0),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kkdiscount,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customPrimary,
                                                                      ),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    maxLength:
                                                                        140,
                                                                    maxLengthEnforcement:
                                                                        MaxLengthEnforcement
                                                                            .none,
                                                                    buildCounter: (context,
                                                                            {required currentLength,
                                                                            required isFocused,
                                                                            maxLength}) =>
                                                                        null,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    validator: _model
                                                                        .edtDescontoTextControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                  ).animateOnPageLoad(
                                                                          animationsMap[
                                                                              'textFieldOnPageLoadAnimation1']!),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 7.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 7.0)),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
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
                                                            onPressed:
                                                                () async {
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
                                                                          if (valueReturn != '') {
                                                                            safeSetState(() {
                                                                              _model.emailAddressFieldTextController?.text = valueReturn;
                                                                            });
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: TextFormField(
                                                          controller: _model
                                                              .emailAddressFieldTextController,
                                                          focusNode: _model
                                                              .emailAddressFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.emailAddressFieldTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    50),
                                                            () => safeSetState(
                                                                () {}),
                                                          ),
                                                          onFieldSubmitted:
                                                              (_) async {
                                                            _model.dpdActive =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          autofocus: false,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelText: 'Código',
                                                            labelStyle:
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
                                                            hintText:
                                                                'Código Voucher',
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
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        10.0,
                                                                        14.0,
                                                                        10.0),
                                                            prefixIcon: Icon(
                                                              FFIcons
                                                                  .kkfilePercent,
                                                              color: Color(
                                                                  0xFF6800FF),
                                                            ),
                                                            suffixIcon: _model
                                                                    .emailAddressFieldTextController!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .emailAddressFieldTextController
                                                                          ?.clear();
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      size:
                                                                          25.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 16.0,
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
                                                                'textFieldOnPageLoadAnimation2']!),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        16.0,
                                                                        5.0),
                                                            child: AutoSizeText(
                                                              'Pagamento',
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
                                                                    fontSize:
                                                                        14.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        7.0,
                                                                        0.0,
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
                                                                _model.dpdActive =
                                                                    !_model
                                                                        .dpdActive;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child:
                                                                  AnimatedContainer(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        100),
                                                                curve: Curves
                                                                    .easeIn,
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight:
                                                                      50.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius: _model
                                                                              .dpdActive
                                                                          ? 3.0
                                                                          : 0.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        _model.dpdActive
                                                                            ? 1.0
                                                                            : 0.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 5.0),
                                                                                child: AutoSizeText(
                                                                                  () {
                                                                                    if (_model.idPay == 0) {
                                                                                      return 'Liquidado';
                                                                                    } else if (_model.idPay == 1) {
                                                                                      return 'Saldo a Pagar';
                                                                                    } else {
                                                                                      return 'Selecione';
                                                                                    }
                                                                                  }(),
                                                                                  textAlign: TextAlign.center,
                                                                                  maxLines: 1,
                                                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        font: GoogleFonts.outfit(
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                        ),
                                                                                        color: valueOrDefault<Color>(
                                                                                          _model.idPay! >= 0 ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).primaryText,
                                                                                          FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          ToggleIcon(
                                                                            onPressed:
                                                                                () async {
                                                                              safeSetState(() => _model.dpdActive = !_model.dpdActive);
                                                                            },
                                                                            value:
                                                                                !_model.dpdActive,
                                                                            onIcon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 20.0,
                                                                            ),
                                                                            offIcon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_up,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (_model
                                                                        .dpdActive)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            ListView(
                                                                          padding:
                                                                              EdgeInsets.fromLTRB(
                                                                            0,
                                                                            4.0,
                                                                            0,
                                                                            4.0,
                                                                          ),
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (widget.totalPay != widget.totalAbastecimento) {
                                                                                  await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
                                                                                    context,
                                                                                    'Atenção',
                                                                                    'Lançamentos fora do voucher. Use \'Saldo a pagar\'.',
                                                                                    FlutterFlowTheme.of(context).primaryText,
                                                                                    FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    350.0,
                                                                                    'bottomcenter',
                                                                                    'frombottom',
                                                                                    Color(0xFFFF9F04),
                                                                                    'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                                                                  );
                                                                                } else {
                                                                                  _model.idPay = 0;
                                                                                  _model.dpdActive = false;
                                                                                  safeSetState(() {});
                                                                                }
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(12.0),
                                                                                    topRight: Radius.circular(12.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 5.0),
                                                                                            child: AutoSizeText(
                                                                                              'Liquidado',
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    font: GoogleFonts.outfit(
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (_model.idPay != 0)
                                                                                        Icon(
                                                                                          Icons.radio_button_off_outlined,
                                                                                          color: Color(0xFFB4B4B4),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      if (_model.idPay == 0)
                                                                                        Icon(
                                                                                          Icons.radio_button_checked,
                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.idPay = 1;
                                                                                _model.dpdActive = false;
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 50.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                    bottomRight: Radius.circular(12.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 16.0, 5.0),
                                                                                            child: AutoSizeText(
                                                                                              'Saldo a Pagar',
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    font: GoogleFonts.outfit(
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      if (_model.idPay != 1)
                                                                                        Icon(
                                                                                          Icons.radio_button_off_outlined,
                                                                                          color: Color(0xFFB4B4B4),
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      if (_model.idPay == 1)
                                                                                        Icon(
                                                                                          Icons.radio_button_checked,
                                                                                          color: FlutterFlowTheme.of(context).success,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ).animateOnPageLoad(animationsMap['listViewOnPageLoadAnimation']!),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xA50064ED),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
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
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Saldo',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      functions.realFormatSCifrao(
                                                                          true,
                                                                          ((widget.totalPay!) -
                                                                                  valueOrDefault<double>(
                                                                                    functions.stringToDouble(valueOrDefault<String>(
                                                                                      _model.edtDescontoTextController.text,
                                                                                      '0',
                                                                                    )),
                                                                                    0.0,
                                                                                  ))
                                                                              .toString()),
                                                                      'R\$ 0,00',
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          fontSize:
                                                                              18.0,
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
                                                                ]
                                                                    .addToStart(
                                                                        SizedBox(
                                                                            width:
                                                                                12.0))
                                                                    .addToEnd(
                                                                        SizedBox(
                                                                            width:
                                                                                12.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ]
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        12.0))
                                                            .addToEnd(SizedBox(
                                                                height: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                          'Dica: Opte por OUTROS PAGAMENTOS se o voucher é inferior a totalização!',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
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
                                                                fontSize: 14.0,
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
                                                          TooltipTriggerMode
                                                              .tap,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Lottie.asset(
                                                            'assets/jsons/voucher.json',
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.contain,
                                                            animate: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    30.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Informe o código do VOUCHER, PAGAMENTO e toque em registrar!',
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
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ].divide(SizedBox(height: 7.0)),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 16.0))
                                            .addToEnd(SizedBox(height: 50.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 10.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context).error,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconButtonOnActionTriggerAnimation']!,
                                ),
                              ),
                            ),
                            if (!(isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible))
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 12.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.idPay! >= 0) {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        Navigator.pop(
                                            context,
                                            ValueVoucherValeStruct(
                                              value: _model
                                                  .emailAddressFieldTextController
                                                  .text,
                                              payTp: _model.idPay == 0
                                                  ? TpPagamento.VAZIO
                                                  : TpPagamento.PIX,
                                              desconto: functions
                                                  .stringToDouble(_model
                                                      .edtDescontoTextController
                                                      .text),
                                              parcela: 1,
                                              idPagReturn: valueOrDefault<int>(
                                                _model.idPay == 0 ? 1 : 99,
                                                1,
                                              ),
                                            ));
                                      } else {
                                        await m_s_framework_flutter_p5iajh_actions
                                            .elegantNotificationCustom(
                                          context,
                                          'Atenção',
                                          'Selecione um tipo de pagamento para prosseguir!',
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          350.0,
                                          'bottomcenter',
                                          'frombottom',
                                          Color(0xFFFF9F04),
                                          'https://cdn-icons-png.flaticon.com/512/595/595067.png',
                                        );
                                        _model.dpdActive = true;
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Registrar',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 45.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
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
                                                .info,
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
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
