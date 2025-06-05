import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animation_status_model.dart';
export 'animation_status_model.dart';

class AnimationStatusWidget extends StatefulWidget {
  const AnimationStatusWidget({
    super.key,
    required this.status,
  });

  final StatusFinalizado? status;

  @override
  State<AnimationStatusWidget> createState() => _AnimationStatusWidgetState();
}

class _AnimationStatusWidgetState extends State<AnimationStatusWidget> {
  late AnimationStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimationStatusModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On component dispose action.
    () async {
      _model.timerController.onResetTimer();
    }();

    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 150.0,
              height: 150.0,
              child: custom_widgets.LottieAnimation(
                width: 150.0,
                height: 150.0,
                lottiePath: valueOrDefault<String>(
                  () {
                    if (widget.status == StatusFinalizado.Sucesso) {
                      return 'assets/jsons/sucessfinish.json';
                    } else if (widget.status == StatusFinalizado.Falha) {
                      return 'assets/jsons/close.json';
                    } else {
                      return 'assets/jsons/pixanim.json';
                    }
                  }(),
                  'assets/jsons/pixanim.json',
                ),
                imilliseconds: 500,
                bRepeat:
                    widget.status == StatusFinalizado.Sucesso ? false : true,
              ),
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: FlutterFlowTimer(
              initialTime: _model.timerInitialTimeMs,
              getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                value,
                hours: false,
                milliSecond: false,
              ),
              controller: _model.timerController,
              updateStateInterval: Duration(milliseconds: 3000),
              onChanged: (value, displayTime, shouldUpdate) {
                _model.timerMilliseconds = value;
                _model.timerValue = displayTime;
                if (shouldUpdate) safeSetState(() {});
              },
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.outfit(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
