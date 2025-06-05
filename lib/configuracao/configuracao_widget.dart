import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/backup_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_configuracao_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/flutter_flow_util.dart'
    as m_s_framework_flutter_p5iajh_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'configuracao_model.dart';
export 'configuracao_model.dart';

class ConfiguracaoWidget extends StatefulWidget {
  const ConfiguracaoWidget({
    super.key,
    required this.adminPass,
  });

  final bool? adminPass;

  static String routeName = 'Configuracao';
  static String routePath = 'configuracao';

  @override
  State<ConfiguracaoWidget> createState() => _ConfiguracaoWidgetState();
}

class _ConfiguracaoWidgetState extends State<ConfiguracaoWidget>
    with TickerProviderStateMixin {
  late ConfiguracaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguracaoModel());

    animationsMap.addAll({
      'backupMenuOnPageLoadAnimation': AnimationInfo(
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 22.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Configuração',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).cardAlter,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.keyboard_control,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  _model.menuOpen = !_model.menuOpen;
                  safeSetState(() {});
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                    child: FlutterFlowDropDown<GateWay>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<GateWay>(
                        _model.dropDownValue ??=
                            FFAppState().ConfigLocais.gatewayPgto,
                      ),
                      options: List<GateWay>.from(GateWay.values),
                      optionLabels: ['Getnet', 'Cielo', 'Sem Gateway'],
                      onChanged: (val) =>
                          safeSetState(() => _model.dropDownValue = val),
                      width: double.infinity,
                      height: 40.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.manrope(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      hintText: 'Gateway de Pagamento',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 0.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: m_s_framework_flutter_p5iajh_util.wrapWithModel(
                        model: _model.unViewMSConfiguracaoModel,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: m_s_framework_flutter_p5iajh
                            .UnViewMSConfiguracaoWidget(
                          bUsaModoAvancado: true,
                          aApp: m_s_framework_flutter_p5iajh_enums
                              .Aplicacao.SOFTWORKEasy,
                          actCallback: () async {
                            _model.actreturn =
                                await m_s_framework_flutter_p5iajh_actions
                                    .decryptAES256(
                              m_s_framework_flutter_p5iajh_app_state
                                      .FFAppState()
                                  .ConfigGlobaisServer
                                  .chaveacesso,
                            );
                            FFAppState().updateConfigLocaisStruct(
                              (e) => e
                                ..gatewayPgto = GateWay.Getnet
                                ..tPagDisable = functions
                                    .returnTpPagDisables(
                                        m_s_framework_flutter_p5iajh_functions
                                            .readFromValueKey(_model.actreturn)
                                            ?.toList())!
                                    .toList(),
                            );
                            FFAppState().aFiltros =
                                FiltrosAbastecimentoStruct();
                            safeSetState(() {});
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
                            context.pushNamed(
                              LoginWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                ),
                              },
                            );

                            safeSetState(() {});
                          },
                          actSwitchModo: () async {
                            _model.advancedMode = !_model.advancedMode;
                            safeSetState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_model.menuOpen)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: wrapWithModel(
                    model: _model.backupMenuModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BackupMenuWidget(
                      actionClose: () async {
                        _model.menuOpen = false;
                        safeSetState(() {});
                      },
                    ),
                  ).animateOnPageLoad(
                      animationsMap['backupMenuOnPageLoadAnimation']!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
