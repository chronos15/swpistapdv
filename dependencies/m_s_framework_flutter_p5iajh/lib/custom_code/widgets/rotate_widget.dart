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

class RotateWidget extends StatefulWidget {
  const RotateWidget({
    super.key,
    this.width,
    this.height,
    this.iGrau = 0,
    required this.widgetRotate,
  });

  final double? width;
  final double? height;
  final double? iGrau;
  final Widget Function() widgetRotate;

  @override
  State<RotateWidget> createState() => _RotateWidgetState();
}

class _RotateWidgetState extends State<RotateWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Transform.rotate(
        angle: (widget.iGrau ?? 0) *
            (3.141592653589793 / 180), // Convertendo para radianos
        child: widget.widgetRotate(),
      ),
    );
  }
}
