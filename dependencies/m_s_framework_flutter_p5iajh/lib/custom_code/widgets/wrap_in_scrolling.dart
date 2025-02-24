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

import 'package:flutter/gestures.dart';

class WrapInScrolling extends StatefulWidget {
  const WrapInScrolling({
    super.key,
    this.width,
    this.height,
    required this.compToScroll,
    required this.enableScrolling,
    required this.bIsHorizontal,
  });

  final double? width;
  final double? height;
  final Widget Function() compToScroll;
  final bool enableScrolling;
  final bool bIsHorizontal;

  @override
  State<WrapInScrolling> createState() => _WrapInScrollingState();
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      axisDirection: axisDirection,
      color: Colors.blue,
      child: child,
    );
  }
}

class _WrapInScrollingState extends State<WrapInScrolling> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calcula tamanho dinâmico baseado no tamanho máximo disponível.
        double dynamicWidth = widget.width ?? constraints.maxWidth;
        double dynamicHeight = widget.height ?? constraints.maxHeight;

        return SizedBox(
          width: widget.enableScrolling
              ? (widget.bIsHorizontal ? constraints.maxWidth : dynamicWidth)
              : dynamicWidth,
          height: widget.enableScrolling
              ? (widget.bIsHorizontal ? dynamicHeight : constraints.maxHeight)
              : dynamicHeight,
          child: widget.enableScrolling
              ? ScrollConfiguration(
                  behavior: CustomScrollBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection:
                        widget.bIsHorizontal ? Axis.horizontal : Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: widget.bIsHorizontal
                            ? dynamicWidth
                            : constraints.maxWidth,
                        minHeight: widget.bIsHorizontal
                            ? constraints.maxHeight
                            : dynamicHeight,
                      ),
                      child: widget.compToScroll(),
                    ),
                  ),
                )
              : widget.compToScroll(),
        );
      },
    );
  }
}
