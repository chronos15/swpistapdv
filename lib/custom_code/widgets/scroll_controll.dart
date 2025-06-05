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

class ScrollControll extends StatefulWidget {
  const ScrollControll({
    super.key,
    this.width,
    this.height,
    required this.widgetOn,
  });

  final double? width;
  final double? height;
  final Widget Function() widgetOn;

  @override
  State<ScrollControll> createState() => _ScrollControllState();
}

class _ScrollControllState extends State<ScrollControll> {
  final ScrollController _scrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = false;

  void _checkScrollPosition() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final current = _scrollController.offset;

    setState(() {
      _showLeftArrow = current > 0;
      _showRightArrow = current < maxScroll;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_checkScrollPosition);
    // Delay para garantir que o ScrollController já tenha contexto
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkScrollPosition());
  }

  @override
  void dispose() {
    _scrollController.removeListener(_checkScrollPosition);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 100,
      child: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: widget.widgetOn(),
            ),
          ),
          if (_showLeftArrow)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: _buildArrowButton(Icons.arrow_back_ios, _scrollLeft),
            ),
          if (_showRightArrow)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: _buildArrowButton(Icons.arrow_forward_ios, _scrollRight),
            ),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon, VoidCallback onTap) {
    return Container(
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: icon == Icons.arrow_back_ios
              ? Alignment.centerLeft
              : Alignment.centerRight,
          end: icon == Icons.arrow_back_ios
              ? Alignment.centerRight
              : Alignment.centerLeft,
          colors: [
            Colors.white.withOpacity(0.9),
            Colors.white.withOpacity(0.0)
          ],
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, size: 16, color: Colors.blue),
      ),
    );
  }
}
