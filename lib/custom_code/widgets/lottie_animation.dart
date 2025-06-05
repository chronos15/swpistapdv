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

import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({
    super.key,
    this.width,
    this.height,
    this.lottiePath,
    required this.imilliseconds,
    required this.bRepeat,
  });

  final double? width;
  final double? height;
  final String? lottiePath;
  final int imilliseconds;
  final bool bRepeat;

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation> {
  bool _showAnimation = false;

  @override
  void initState() {
    super.initState();
    _delayAnimation();
  }

  void _delayAnimation() async {
    await Future.delayed(Duration(milliseconds: widget.imilliseconds));
    if (mounted) {
      setState(() {
        _showAnimation = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_showAnimation || widget.lottiePath == null) {
      return const SizedBox(); // Pode trocar por um loader se quiser
    }

    return Lottie.asset(
      widget.lottiePath!,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.fitHeight,
      repeat: widget.bRepeat,
    );
  }
}
