import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.actionNotify,
    required this.actionAbastecimento,
    required this.actionDrawer,
    bool? bListaAtiva,
  }) : this.bListaAtiva = bListaAtiva ?? true;

  final Future Function()? actionNotify;
  final Future Function()? actionAbastecimento;
  final Future Function()? actionDrawer;
  final bool bListaAtiva;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());
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

    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 12.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                icon: Icon(
                                  Icons.menu,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await widget.actionDrawer?.call();
                                },
                              ),
                              Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.actionAbastecimento?.call();
                                  },
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    FFAppState().Empresa.nomeFantasia,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        'Registros',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
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
                                              color: Color(0xFFC3C3C3),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    badges.Badge(
                      badgeContent: Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.manrope(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                      ),
                      showBadge: false,
                      shape: badges.BadgeShape.circle,
                      badgeColor: FlutterFlowTheme.of(context).info,
                      elevation: 4.0,
                      padding: EdgeInsets.all(5.0),
                      position: badges.BadgePosition.topEnd(),
                      animationType: badges.BadgeAnimationType.scale,
                      toAnimate: true,
                      child: Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 44.0,
                          height: 44.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            children: [
                              if (widget.bListaAtiva)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.actionNotify?.call();
                                  },
                                  child: Icon(
                                    Icons.local_gas_station_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                              if (!widget.bListaAtiva)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.actionNotify?.call();
                                  },
                                  child: Icon(
                                    FFIcons.kklistDetails,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
