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

class WidgetFocusPolicy extends StatefulWidget {
  const WidgetFocusPolicy({
    super.key,
    this.width,
    this.height,
    required this.widgetGroup, // Recebe o widget group como função
  });

  final double? width;
  final double? height;
  final Widget Function() widgetGroup; // Remove os índices do widget group

  @override
  State<WidgetFocusPolicy> createState() => _WidgetFocusPolicyState();
}

class _WidgetFocusPolicyState extends State<WidgetFocusPolicy> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FocusTraversalGroup(
        policy:
            OrderedTraversalPolicy(), // Define a política de navegação ordenada
        child: widget.widgetGroup(), // Renderiza o widget group sem os índices
      ),
    );
  }
}
