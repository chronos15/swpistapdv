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
    this.bReload = false,
  });

  final double? width;
  final double? height;
  final bool bReload;
  final Widget Function() widget; // Função que retorna o widget interno
  final Future<void> Function(bool isScrolling) actionOnScroll;

  @override
  State<WidgetControllerScroll> createState() => _WidgetControllerScrollState();
}

class _WidgetControllerScrollState extends State<WidgetControllerScroll> {
  Timer? _scrollStopTimer;
  Key _contentKey = UniqueKey(); // Adiciona uma chave para o conteúdo interno

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onScrollUpdate() async {
    _scrollStopTimer?.cancel();
    await widget.actionOnScroll(true);

    _scrollStopTimer = Timer(const Duration(milliseconds: 300), () async {
      await widget.actionOnScroll(false);
    });
  }

  @override
  void didUpdateWidget(covariant WidgetControllerScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.bReload != oldWidget.bReload && widget.bReload) {
      setState(() {
        _contentKey =
            UniqueKey(); // Gera uma nova chave para forçar a reconstrução
      });
      print('Widget recarregado devido a bReload ser true!');
    }
  }

  @override
  void dispose() {
    _scrollStopTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Build do WidgetControllerScroll chamado. bReload: ${widget.bReload}');
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
          // Passa a chave para o widget retornado pela função widget()
          child: KeyedSubtree(
            key: _contentKey,
            child: widget.widget(),
          ),
        ),
      ),
    );
  }
}
