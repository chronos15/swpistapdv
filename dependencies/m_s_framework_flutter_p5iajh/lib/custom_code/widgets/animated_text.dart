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

import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    super.key,
    this.width,
    this.height,
    required this.textValues,
    required this.textFixed,
    this.fixedFontSize = 10,
    this.fontAnimatedSize = 10,
    required this.colorText,
  });

  final double? width;
  final double? height;
  final List<String> textValues;
  final String textFixed;
  final double fixedFontSize;
  final double fontAnimatedSize;
  final Color colorText;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          widget.textFixed,
          style: TextStyle(
              fontSize: widget.fixedFontSize, color: widget.colorText),
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: widget.fontAnimatedSize,
            fontFamily: 'Horizon',
            color: widget.colorText,
          ),
          child: AnimatedTextKit(
            animatedTexts: widget.textValues.map((text) {
              return RotateAnimatedText(text);
            }).toList(),
            onTap: () {
              print("Tap Event");
            },
            isRepeatingAnimation: true, // Define se a animação deve repetir
          ),
        ),
      ],
    );
  }
}
