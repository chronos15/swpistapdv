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

import 'dart:io';

class ImageFromPath extends StatefulWidget {
  const ImageFromPath({
    super.key,
    this.width,
    this.height,
    required this.path,
  });

  final double? width;
  final double? height;
  final String? path;

  @override
  State<ImageFromPath> createState() => _ImageFromPathState();
}

class _ImageFromPathState extends State<ImageFromPath> {
  @override
  Widget build(BuildContext context) {
    if (widget.path == null || widget.path!.isEmpty) {
      return const Center(child: Text('Caminho inválido'));
    }

    final file = File(widget.path!);

    if (!file.existsSync()) {
      return const Center(child: Text('Imagem não encontrada'));
    }

    return Image.file(
      file,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.contain,
    );
  }
}
