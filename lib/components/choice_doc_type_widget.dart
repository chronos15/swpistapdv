import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choice_doc_type_model.dart';
export 'choice_doc_type_model.dart';

class ChoiceDocTypeWidget extends StatefulWidget {
  const ChoiceDocTypeWidget({super.key});

  @override
  State<ChoiceDocTypeWidget> createState() => _ChoiceDocTypeWidgetState();
}

class _ChoiceDocTypeWidgetState extends State<ChoiceDocTypeWidget> {
  late ChoiceDocTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceDocTypeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
              child: FlutterFlowChoiceChips(
                options: [
                  ChipData('NF-e', FontAwesomeIcons.fileAlt),
                  ChipData('NFC-e', FontAwesomeIcons.stickyNote),
                  ChipData('Orçamento', Icons.format_list_bulleted)
                ],
                onChanged: (val) => safeSetState(
                    () => _model.choiceChipsValue = val?.firstOrNull),
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).info,
                  iconSize: 18.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(5.0, 3.0, 15.0, 3.0),
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.manrope(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  iconSize: 18.0,
                  labelPadding:
                      EdgeInsetsDirectional.fromSTEB(7.0, 3.0, 10.0, 3.0),
                  elevation: 1.0,
                  borderWidth: 0.0,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                chipSpacing: 5.0,
                rowSpacing: 12.0,
                multiselect: false,
                initialized: _model.choiceChipsValue != null,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsValueController ??=
                    FormFieldController<List<String>>(
                  ['NF-e'],
                ),
                wrapped: true,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context, _model.choiceChipsValue);
                  },
                  text: 'Selecionar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.outfit(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
