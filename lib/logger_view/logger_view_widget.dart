import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_lista_vazia_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logger_view_model.dart';
export 'logger_view_model.dart';

/// lista de registro de log de error
class LoggerViewWidget extends StatefulWidget {
  const LoggerViewWidget({super.key});

  static String routeName = 'LoggerView';
  static String routePath = 'loggerView';

  @override
  State<LoggerViewWidget> createState() => _LoggerViewWidgetState();
}

class _LoggerViewWidgetState extends State<LoggerViewWidget> {
  late LoggerViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoggerViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.actReturnLogger = await actions.loggerRead();
      _model.listInfo = _model.actReturnLogger!.toList().cast<dynamic>();
      safeSetState(() {});
    });
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.chevron_left_outlined,
                                color: Colors.white,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                          Text(
                            'Logs',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Visualize e gerencie os erros do sistema',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FontWeight.w300,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 200.0,
                      child: Builder(
                        builder: (context) {
                          final logger = _model.listInfo.toList();
                          if (logger.isEmpty) {
                            return Center(
                              child: Container(
                                height: 220.0,
                                child: m_s_framework_flutter_p5iajh
                                    .UnViewMSFrameListaVaziaWidget(
                                  sTitulo: 'Logger Vazio',
                                  sTexto:
                                      'Lista de logs vazia, o app está em perfeito funcionamento :)',
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
                            );
                          }

                          return FlutterFlowDataTable<dynamic>(
                            controller: _model.paginatedDataTableController,
                            data: logger,
                            columnsBuilder: (onSortChanged) => [
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    'Erro',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Data',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                fixedWidth: 90.0,
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Level',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                fixedWidth: 100.0,
                              ),
                            ],
                            dataRowBuilder: (loggerItem, loggerIndex, selected,
                                    onSelectChanged) =>
                                DataRow(
                              color: WidgetStateProperty.all(
                                loggerIndex % 2 == 0
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                              ),
                              cells: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Detalhes'),
                                          content: Text(
                                              functions.getValueJsonByCampo(
                                                  loggerItem, 'error')!),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.getValueJsonByCampo(
                                          loggerItem, 'error'),
                                      '--',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
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
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      functions.getValueJsonByCampo(
                                          loggerItem, 'timestamp'),
                                      'S/Data',
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
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
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Detalhes'),
                                          content: Text(
                                              functions.getValueJsonByCampo(
                                                  loggerItem, 'stacktrace')!),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (functions.getValueJsonByCampo(
                                                loggerItem, 'logLevel') ==
                                            '4') {
                                          return Color(0xFFC700FF);
                                        } else if (functions
                                                .getValueJsonByCampo(
                                                    loggerItem, 'logLevel') ==
                                            '3') {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else if (functions
                                                .getValueJsonByCampo(
                                                    loggerItem, 'logLevel') ==
                                            '2') {
                                          return Color(0xFFFFBF00);
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primary;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: AutoSizeText(
                                          () {
                                            if (functions.getValueJsonByCampo(
                                                    loggerItem, 'logLevel') ==
                                                '4') {
                                              return 'CRITICAL';
                                            } else if (functions
                                                    .getValueJsonByCampo(
                                                        loggerItem,
                                                        'logLevel') ==
                                                '3') {
                                              return 'ERROR';
                                            } else if (functions
                                                    .getValueJsonByCampo(
                                                        loggerItem,
                                                        'logLevel') ==
                                                '2') {
                                              return 'WARNING';
                                            } else {
                                              return 'INFO';
                                            }
                                          }(),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          minFontSize: 1.0,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
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
                                      ),
                                    ),
                                  ),
                                ),
                              ].map((c) => DataCell(c)).toList(),
                            ),
                            emptyBuilder: () => Center(
                              child: Container(
                                height: 220.0,
                                child: m_s_framework_flutter_p5iajh
                                    .UnViewMSFrameListaVaziaWidget(
                                  sTitulo: 'Logger Vazio',
                                  sTexto:
                                      'Lista de logs vazia, o app está em perfeito funcionamento :)',
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
                            paginated: true,
                            selectable: false,
                            hidePaginator: false,
                            showFirstLastButtons: false,
                            height: double.infinity,
                            headingRowHeight: 48.0,
                            dataRowHeight: 48.0,
                            columnSpacing: 20.0,
                            borderRadius: BorderRadius.circular(0.0),
                            addHorizontalDivider: true,
                            addTopAndBottomDivider: false,
                            hideDefaultHorizontalDivider: true,
                            horizontalDividerColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            horizontalDividerThickness: 1.0,
                            addVerticalDivider: false,
                          );
                        },
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 45.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.refresh,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          _model.actReturnLoggerUpdate =
                              await actions.loggerRead();
                          _model.listInfo = _model.actReturnLoggerUpdate!
                              .toList()
                              .cast<dynamic>();
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                      ),
                      Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 45.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.clear_sharp,
                            color: FlutterFlowTheme.of(context).error,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Container(
                                      height: 171.0,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.95,
                                      child: m_s_framework_flutter_p5iajh
                                          .UnViewMSFrameMessageBoxWidget(
                                        sTitulo: 'Atenção',
                                        sText:
                                            'Deseja limpar os registros de logs!?',
                                        colorConfirm:
                                            FlutterFlowTheme.of(context).error,
                                        colorCancel:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        enableCancel: true,
                                        colorTextButtonConfirm:
                                            FlutterFlowTheme.of(context).info,
                                        sTextoConfirm: 'Ok',
                                        sTextoCancel: 'Cancelar',
                                        colorTextButtonCancel:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        actConfirm: () async {
                                          await actions.loggerClear();
                                          _model.listInfo = [];
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
                          },
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
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
