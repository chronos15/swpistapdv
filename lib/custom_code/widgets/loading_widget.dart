// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:m_s_framework_flutter_p5iajh/backend/schema/structs/index.dart"
    as m_s_framework_flutter_p5iajh_data_schema;
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.width,
    this.height,
    this.colorLoading,
    required this.iStroke,
  });

  final double? width;
  final double? height;
  final Color? colorLoading;
  final double iStroke;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 100,
      height: widget.height ?? 100,
      child: Center(
        child: FittedBox(
          child: SizedBox(
            width: widget.width ?? 100,
            height: widget.height ?? 100,
            child: CircularProgressIndicator(
              strokeWidth: widget.iStroke,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.colorLoading ?? Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
