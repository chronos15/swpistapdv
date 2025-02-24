import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_scanner_model.dart';
export 'un_view_m_s_frame_scanner_model.dart';

class UnViewMSFrameScannerWidget extends StatefulWidget {
  const UnViewMSFrameScannerWidget({super.key});

  @override
  State<UnViewMSFrameScannerWidget> createState() =>
      _UnViewMSFrameScannerWidgetState();
}

class _UnViewMSFrameScannerWidgetState
    extends State<UnViewMSFrameScannerWidget> {
  late UnViewMSFrameScannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameScannerModel());
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
      height: double.infinity,
      child: custom_widgets.ScannerWidget(
        width: double.infinity,
        height: double.infinity,
        actReturn: (sReturn) async {
          Navigator.pop(context, sReturn);
        },
      ),
    );
  }
}
