import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tanque_monitor_model.dart';
export 'tanque_monitor_model.dart';

class TanqueMonitorWidget extends StatefulWidget {
  const TanqueMonitorWidget({super.key});

  static String routeName = 'TanqueMonitor';
  static String routePath = 'tanqueMonitor';

  @override
  State<TanqueMonitorWidget> createState() => _TanqueMonitorWidgetState();
}

class _TanqueMonitorWidgetState extends State<TanqueMonitorWidget>
    with TickerProviderStateMixin {
  late TanqueMonitorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TanqueMonitorModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 20.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
            ),
          ),
          title: Text(
            'Monitor de Tanques',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.outfit(
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).info,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    FFIcons.kkreload,
                    color: FlutterFlowTheme.of(context).info,
                    size: 18.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0x230D8CFF),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              FFIcons.kkcalendarDue,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                'Seg., 07 de Abril de 2025',
                                maxLines: 1,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.outfit(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 7.0))
                              .addToStart(SizedBox(width: 12.0))
                              .addToEnd(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.navigate_next_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          unselectedLabelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: 'Inventário',
                            ),
                            Tab(
                              text: 'Entregas',
                            ),
                            Tab(
                              text: 'Painel',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: ListView(
                                    padding: EdgeInsets.fromLTRB(
                                      12.0,
                                      0,
                                      12.0,
                                      0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: custom_widgets.Waveindicator(
                                          width: 100.0,
                                          height: 100.0,
                                          progressValue: 75.0,
                                          colorBorder:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          foreWave: Color(0xFF0D16FF),
                                          backWave: FlutterFlowTheme.of(context)
                                              .secondary,
                                          sizeBox: 100.0,
                                          borderSize: 1.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(height: 7.0))
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).cardAlter,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Última atualização: Hoje às 10:22',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.outfit(
                          fontWeight: FontWeight.w300,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontStyle,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
