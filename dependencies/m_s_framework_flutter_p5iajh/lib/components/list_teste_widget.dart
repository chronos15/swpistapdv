import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_teste_model.dart';
export 'list_teste_model.dart';

class ListTesteWidget extends StatefulWidget {
  const ListTesteWidget({super.key});

  @override
  State<ListTesteWidget> createState() => _ListTesteWidgetState();
}

class _ListTesteWidgetState extends State<ListTesteWidget> {
  late ListTesteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListTesteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final test = List.generate(
              random_data.randomInteger(100, 200),
              (index) => random_data.randomImageUrl(
                    200,
                    200,
                  )).toList();

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(test.length, (testIndex) {
              final testItem = test[testIndex];
              return ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/996/600',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              );
            }).divide(SizedBox(height: 10.0)),
          );
        },
      ),
    );
  }
}
