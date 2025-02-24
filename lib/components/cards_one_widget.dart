import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'cards_one_model.dart';
export 'cards_one_model.dart';

class CardsOneWidget extends StatefulWidget {
  const CardsOneWidget({
    super.key,
    required this.sTit,
    required this.progressValue,
    required this.border,
    required this.foreWave,
    required this.backWave,
    required this.valor,
  });

  final String? sTit;
  final double? progressValue;
  final Color? border;
  final Color? foreWave;
  final Color? backWave;
  final String? valor;

  @override
  State<CardsOneWidget> createState() => _CardsOneWidgetState();
}

class _CardsOneWidgetState extends State<CardsOneWidget> {
  late CardsOneModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardsOneModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 110.0,
          height: 180.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget.foreWave,
              FlutterFlowTheme.of(context).primary,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: custom_widgets.Waveindicator(
                            width: double.infinity,
                            height: double.infinity,
                            progressValue: widget.progressValue!,
                            colorBorder: widget.border!,
                            foreWave: widget.foreWave!,
                            backWave: widget.backWave!,
                            sizeBox: 60.0,
                            borderSize: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget.sTit,
                      '...',
                    ).maybeHandleOverflow(
                      maxChars: 15,
                      replacement: '…',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    minFontSize: 12.0,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 10.0),
                child: AutoSizeText(
                  valueOrDefault<String>(
                    widget.valor,
                    '--',
                  ),
                  maxLines: 1,
                  minFontSize: 10.0,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
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
