import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_lista_vazia_model.dart';
export 'un_view_m_s_frame_lista_vazia_model.dart';

class UnViewMSFrameListaVaziaWidget extends StatefulWidget {
  const UnViewMSFrameListaVaziaWidget({
    super.key,
    String? sTitulo,
    required this.sTexto,
    bool? bIsAction,
    this.sTextAction,
    Color? cColorButton,
    this.aActionButton,
    this.pIcon,
    double? textSize,
    double? vSizeTitulo,
    double? vSizeTexto,
    required this.corTitulo,
    required this.corSubtitulo,
  })  : this.sTitulo = sTitulo ?? 'Nenhum item encontrado',
        this.bIsAction = bIsAction ?? false,
        this.cColorButton = cColorButton ?? const Color(0xFF0059FF),
        this.textSize = textSize ?? 16.0,
        this.vSizeTitulo = vSizeTitulo ?? 24.0,
        this.vSizeTexto = vSizeTexto ?? 14.0;

  final String sTitulo;
  final String? sTexto;
  final bool bIsAction;
  final String? sTextAction;
  final Color cColorButton;
  final Future Function()? aActionButton;
  final Widget? pIcon;
  final double textSize;
  final double vSizeTitulo;
  final double vSizeTexto;
  final Color? corTitulo;
  final Color? corSubtitulo;

  @override
  State<UnViewMSFrameListaVaziaWidget> createState() =>
      _UnViewMSFrameListaVaziaWidgetState();
}

class _UnViewMSFrameListaVaziaWidgetState
    extends State<UnViewMSFrameListaVaziaWidget> {
  late UnViewMSFrameListaVaziaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameListaVaziaModel());
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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Image.asset(
                      'dependencies/m_s_framework_flutter_p5iajh/assets/images/7486744.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                widget!.sTitulo,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Outfit',
                      color: widget!.corTitulo,
                      fontSize: widget!.vSizeTitulo,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 10.0),
              child: Text(
                valueOrDefault<String>(
                  widget!.sTexto,
                  '--',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: widget!.corSubtitulo,
                      fontSize: widget!.vSizeTexto,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ),
            if (widget!.bIsAction)
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.aActionButton?.call();
                  },
                  text: widget!.sTextAction!,
                  icon: widget!.pIcon,
                  options: FFButtonOptions(
                    width: 160.0,
                    height: 44.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: widget!.cColorButton,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                          fontSize: widget!.textSize,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
