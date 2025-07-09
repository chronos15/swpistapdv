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

import 'dart:convert';
import 'dart:typed_data';

class ImageFromBase64 extends StatefulWidget {
  const ImageFromBase64({
    super.key,
    this.width,
    this.height,
    this.base64,
  });

  final double? width;
  final double? height;
  final String? base64;

  @override
  State<ImageFromBase64> createState() => _ImageFromBase64State();
}

class _ImageFromBase64State extends State<ImageFromBase64> {
  Uint8List? imageBytes;

  @override
  void initState() {
    super.initState();
    _decodeBase64();
  }

  void _decodeBase64() {
    try {
      if (widget.base64 != null && widget.base64!.isNotEmpty) {
        imageBytes = base64Decode(widget.base64!);
      }
    } catch (e) {
      debugPrint('Erro ao decodificar base64: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (imageBytes == null) {
      return const SizedBox(); // ou CircularProgressIndicator(), ou Container com placeholder
    }

    return Image.memory(
      imageBytes!,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.contain,
    );
  }
}
