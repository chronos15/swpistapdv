import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'backup_menu_model.dart';
export 'backup_menu_model.dart';

/// backup menu options
class BackupMenuWidget extends StatefulWidget {
  const BackupMenuWidget({
    super.key,
    required this.actionClose,
  });

  final Future Function()? actionClose;

  @override
  State<BackupMenuWidget> createState() => _BackupMenuWidgetState();
}

class _BackupMenuWidgetState extends State<BackupMenuWidget> {
  late BackupMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackupMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Text(
                        'Opções de Backup',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).error,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      await widget.actionClose?.call();
                    },
                  ),
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await actions.backupState();
                },
                child: Material(
                  color: Colors.transparent,
                  child: ListTile(
                    leading: Icon(
                      Icons.sd_card_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    title: Text(
                      'Realizar Backup',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    trailing: Icon(
                      Icons.navigate_next_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                    dense: true,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.returnBkp = await actions.restoreState();
                    if (_model.returnBkp!) {
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: Container(
                              height: 171.0,
                              width: MediaQuery.sizeOf(context).width * 0.95,
                              child: m_s_framework_flutter_p5iajh
                                  .UnViewMSFrameMessageBoxWidget(
                                sTitulo: 'Sucesso',
                                sText:
                                    'Backup restaurado com sucesso. Seu app será fechado!',
                                colorConfirm:
                                    FlutterFlowTheme.of(context).success,
                                colorCancel: Color(0x00000000),
                                enableCancel: false,
                                colorTextButtonConfirm:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                sTextoConfirm: 'Ok',
                                actConfirm: () async {
                                  await m_s_framework_flutter_p5iajh_actions
                                      .handleWindowAction(
                                    0,
                                  );
                                },
                                actCancel: () async {},
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      await showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: Container(
                              height: 171.0,
                              width: MediaQuery.sizeOf(context).width * 0.95,
                              child: m_s_framework_flutter_p5iajh
                                  .UnViewMSFrameMessageBoxWidget(
                                sTitulo: 'Falha',
                                sText:
                                    'Não foi possível restaurar o backup, processo cancelado ou houve falha durante a solicitação! ',
                                colorConfirm:
                                    FlutterFlowTheme.of(context).error,
                                colorCancel: Color(0x00000000),
                                enableCancel: false,
                                colorTextButtonConfirm:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                sTextoConfirm: 'Ok',
                                actConfirm: () async {},
                                actCancel: () async {},
                              ),
                            ),
                          );
                        },
                      );
                    }

                    safeSetState(() {});
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        Icons.manage_history,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      title: Text(
                        'Restaurar Backup',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                      trailing: Icon(
                        Icons.navigate_next_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: true,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
