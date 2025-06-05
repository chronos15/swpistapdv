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

import 'dart:async';

class WidgetControllerScroll extends StatefulWidget {
  const WidgetControllerScroll({
    super.key,
    this.width,
    this.height,
    required this.widget,
    required this.actionOnScroll,
  });

  final double? width;
  final double? height;
  final Widget Function() widget;
  final Future Function(bool isScrolling) actionOnScroll;

  @override
  State<WidgetControllerScroll> createState() => _WidgetControllerScrollState();
}

class _WidgetControllerScrollState extends State<WidgetControllerScroll> {
  Timer? _scrollStopTimer;

  Future<void> _onScrollUpdate() async {
    _scrollStopTimer?.cancel();
    await widget.actionOnScroll(true);

    _scrollStopTimer = Timer(const Duration(milliseconds: 300), () async {
      await widget.actionOnScroll(false);
    });
  }

  @override
  void dispose() {
    _scrollStopTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _onScrollUpdate();
          }
          return false;
        },
        child: SingleChildScrollView(
          child: widget.widget(),
        ),
      ),
    );
  }
}
