// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:wave_loading_indicator/wave_progress.dart';

class Waveindicator extends StatefulWidget {
  const Waveindicator({
    Key? key,
    this.width,
    this.height,
    required this.progressValue,
    required this.colorBorder,
    required this.foreWave,
    required this.backWave,
    required this.sizeBox,
    required this.borderSize,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double progressValue;
  final Color colorBorder;
  final Color foreWave;
  final Color backWave;
  final double sizeBox;
  final double borderSize;

  @override
  _WaveindicatorState createState() => _WaveindicatorState();
}

class _WaveindicatorState extends State<Waveindicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: WaveProgress(
        borderSize: widget.borderSize,
        size: widget.sizeBox,
        borderColor: widget.colorBorder,
        foregroundWaveColor: widget.foreWave,
        backgroundWaveColor: widget.backWave,
        progress: widget.progressValue, // [0-100]
        innerPadding: 10, // padding between border and waves
      ),
    );
  }
}
