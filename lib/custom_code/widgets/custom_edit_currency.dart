// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

import 'package:intl/intl.dart';
import 'dart:async';

class CustomEditCurrency extends StatefulWidget {
  const CustomEditCurrency({
    super.key,
    this.width,
    this.height,
    this.sLabel,
    this.icon,
    required this.actReturn,
    this.initialValue,
    required this.sizeText,
    required this.colorStyleText,
  });

  final double? width;
  final double? height;
  final String? sLabel;
  final Widget? icon;
  final Future Function(String? sValorFormatado) actReturn;
  final String? initialValue;
  final double sizeText;
  final Color colorStyleText;

  @override
  State<CustomEditCurrency> createState() => _CustomEditCurrencyState();
}

class _CustomEditCurrencyState extends State<CustomEditCurrency> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      String filteredValue = _filterDigits(widget.initialValue!);
      String formattedValue = _formatCurrency(filteredValue);
      _controller.text = formattedValue;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 35.0,
      alignment: Alignment.center,
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (_debounce?.isActive ?? false) _debounce!.cancel();

          _debounce = Timer(const Duration(milliseconds: 50), () {
            String filteredValue = _filterDigits(value);
            String formattedValue = _formatCurrency(filteredValue);

            widget.actReturn(formattedValue);
            setState(() {
              _controller.value = TextEditingValue(
                text: formattedValue,
                selection: TextSelection.collapsed(
                  offset: formattedValue.length,
                ),
              );
            });
          });
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 8.0,
          ),
          hintText: widget.sLabel,
          hintStyle: TextStyle(
            color: Colors.grey[300],
            fontSize: widget.sizeText,
          ),
          prefixIcon: widget.icon,
        ),
        style: TextStyle(
          fontSize: widget.sizeText,
          color: widget.colorStyleText,
          fontWeight: FontWeight.w400,
        ),
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.start,
      ),
    );
  }

  String _filterDigits(String value) {
    return value.replaceAll(
        RegExp(r'\D'), ''); // Remove caracteres não numéricos
  }

  String _formatCurrency(String value) {
    if (value.isEmpty) {
      return "R\$ 0,00";
    }

    double valueAsDouble = double.tryParse(value) ?? 0.0;
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return "R\$ " + formatter.format(valueAsDouble / 100);
  }
}
