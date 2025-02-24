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

import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomRadialGauge extends StatefulWidget {
  const CustomRadialGauge({
    super.key,
    this.width = 300,
    this.height = 300,
    this.valuePorcentage = 0,
    this.valueString = '0%',
    this.textSize = 0,
    this.bShowLabels = true,
    this.sizeThickness = 0,
    this.minValue = 0,
    this.maxValue = 0,
  });

  final double? width;
  final double? height;
  final double? valuePorcentage;
  final String? valueString;
  final double? textSize;
  final bool? bShowLabels;
  final double? sizeThickness;
  final double? minValue;
  final double? maxValue;

  @override
  State<CustomRadialGauge> createState() => _CustomRadialGaugeState();
}

class _CustomRadialGaugeState extends State<CustomRadialGauge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 180,
            endAngle: 0,
            canScaleToFit: true,
            showLabels: widget.bShowLabels!,
            axisLineStyle: AxisLineStyle(
                thickness: widget.sizeThickness!,
                cornerStyle: CornerStyle.bothCurve),
            minimum: widget.minValue!,
            maximum: widget.maxValue!,
            ranges: <GaugeRange>[
              GaugeRange(
                startValue: widget.minValue!,
                endValue: 0,
                color: Colors.red,
                startWidth: widget.sizeThickness!,
                endWidth: widget.sizeThickness!,
              ),
              GaugeRange(
                startValue: 0,
                endValue: 30,
                color: Colors.orange,
                startWidth: widget.sizeThickness!,
                endWidth: widget.sizeThickness!,
              ),
              GaugeRange(
                startValue: 30,
                endValue: widget.maxValue!,
                color: Colors.green,
                startWidth: widget.sizeThickness!,
                endWidth: widget.sizeThickness!,
              ),
            ],
            /*annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                  widget: Container(
                      child: Text(widget.valueString!,
                          style: TextStyle(
                              fontSize: widget.textSize,
                              fontWeight: FontWeight.w300))),
                  angle: 90,
                  positionFactor: 0.5)
            ],*/
            pointers: <GaugePointer>[
              NeedlePointer(
                  value: widget.valuePorcentage!,
                  lengthUnit: GaugeSizeUnit.factor,
                  needleLength: 0.8,
                  needleEndWidth: 5,
                  gradient: const LinearGradient(colors: <Color>[
                    Color(0xFF0C7FFF),
                    Color(0xFF0C7FFF),
                    Color(0xFF127FFF),
                    Color(0xFF127FFF)
                  ], stops: <double>[
                    0,
                    0.5,
                    0.5,
                    1
                  ]),
                  needleColor: const Color(0xFFF67280),
                  knobStyle: KnobStyle(
                      knobRadius: 0.08,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
