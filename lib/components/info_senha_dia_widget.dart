import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'info_senha_dia_model.dart';
export 'info_senha_dia_model.dart';

class InfoSenhaDiaWidget extends StatefulWidget {
  const InfoSenhaDiaWidget({super.key});

  @override
  State<InfoSenhaDiaWidget> createState() => _InfoSenhaDiaWidgetState();
}

class _InfoSenhaDiaWidgetState extends State<InfoSenhaDiaWidget> {
  late InfoSenhaDiaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoSenhaDiaModel());

    _model.pinCodeFocusNode ??= FocusNode();
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: 320.0,
                      height: MediaQuery.sizeOf(context).height * 0.99,
                      constraints: BoxConstraints(
                        maxWidth: 320.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 320.0,
                          height: 150.0,
                          constraints: BoxConstraints(
                            maxWidth: 320.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 0.0),
                                        child: PinCodeTextField(
                                          autoDisposeControllers: false,
                                          appContext: context,
                                          length: 6,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.manrope(
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
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
                                              bottomRight:
                                                  Radius.circular(12.0),
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(12.0),
                                            ),
                                            shape: PinCodeFieldShape.box,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            selectedColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                          controller: _model.pinCodeController,
                                          onChanged: (_) {},
                                          onCompleted: (_) async {
                                            if (m_s_framework_flutter_p5iajh_functions
                                                    .getPasswordSW(
                                                        getCurrentTimestamp) ==
                                                _model
                                                    .pinCodeController!.text) {
                                              Navigator.pop(context, true);
                                            } else {
                                              safeSetState(() {
                                                _model.pinCodeController
                                                    ?.clear();
                                              });
                                              safeSetState(() {
                                                _model.pinCodeController?.text =
                                                    '';
                                              });
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
                                                      height: 171.0,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.95,
                                                      child: m_s_framework_flutter_p5iajh
                                                          .UnViewMSFrameMessageBoxWidget(
                                                        sTitulo: 'Falha',
                                                        sText:
                                                            'Senha do dia incorreta, verifique e tente novamente!',
                                                        colorConfirm:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        colorCancel:
                                                            Color(0x00000000),
                                                        enableCancel: false,
                                                        colorTextButtonConfirm:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        sTextoConfirm: 'Ok',
                                                        actConfirm: () async {},
                                                        actCancel: () async {},
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: _model
                                              .pinCodeControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 5.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context).error,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      Navigator.pop(context, false);
                                    },
                                  ),
                                ),
                              ),
                            ],
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
