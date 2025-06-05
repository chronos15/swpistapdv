import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tp_pagamento_model.dart';
export 'tp_pagamento_model.dart';

class TpPagamentoWidget extends StatefulWidget {
  const TpPagamentoWidget({
    super.key,
    this.tapCondPag,
    this.enumSelected,
    required this.bModoPagMP,
  });

  final Future Function(TpPagamento enumTaped)? tapCondPag;
  final TpPagamento? enumSelected;
  final bool? bModoPagMP;

  @override
  State<TpPagamentoWidget> createState() => _TpPagamentoWidgetState();
}

class _TpPagamentoWidgetState extends State<TpPagamentoWidget> {
  late TpPagamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TpPagamentoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<m_s_framework_flutter_p5iajh_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: 330.0,
      decoration: BoxDecoration(),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return [
            () => Padding(
                  padding: EdgeInsets.all(3.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await widget.tapCondPag?.call(
                        TpPagamento.DINHEIRO,
                      );
                    },
                    child: Container(
                      width: 110.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: widget.enumSelected == TpPagamento.DINHEIRO
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 12.0, 5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 7.0, 0.0, 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/639365.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Dinheiro',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ]
                              .divide(SizedBox(height: 0.0))
                              .addToStart(SizedBox(height: 5.0))
                              .addToEnd(SizedBox(height: 5.0)),
                        ),
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: FFAppState()
                          .CondPagamentoList
                          .where((e) =>
                              (e.tipoPagamento == '3') && (e.status == 'S'))
                          .toList()
                          .length >=
                      1,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.tapCondPag?.call(
                          TpPagamento.PIX,
                        );
                      },
                      child: Container(
                        width: 110.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: widget.enumSelected == TpPagamento.PIX
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 10.0, 12.0, 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/pix.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Pix',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(height: 0.0))
                                .addToStart(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: FFAppState()
                      .CondPagamentoList
                      .where(
                          (e) => (e.tipoPagamento == '4') && (e.status == 'S'))
                      .toList()
                      .isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.tapCondPag?.call(
                          TpPagamento.CARTAO_CREDITO,
                        );
                      },
                      child: Container(
                        width: 110.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: widget.enumSelected ==
                                    TpPagamento.CARTAO_CREDITO
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 5.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 3.0, 0.0, 3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/8786060.png',
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Cartão\n',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Crédito',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                                .divide(SizedBox(height: 0.0))
                                .addToStart(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: FFAppState()
                      .CondPagamentoList
                      .where(
                          (e) => (e.tipoPagamento == '4') && (e.status == 'S'))
                      .toList()
                      .isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.tapCondPag?.call(
                          TpPagamento.CARTAO_DEBITO,
                        );
                      },
                      child: Container(
                        width: 110.0,
                        height: 90.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: widget.enumSelected ==
                                    TpPagamento.CARTAO_DEBITO
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 10.0, 12.0, 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/893081.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Cartão\n',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Débito',
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.manrope(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                                .divide(SizedBox(height: 0.0))
                                .addToStart(SizedBox(height: 5.0))
                                .addToEnd(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: (FFAppState()
                          .CondPagamentoList
                          .where((e) =>
                              (e.tipoPagamento == '4') && (e.status == 'S'))
                          .toList()
                          .isNotEmpty) &&
                      (FFAppState().ClienteSelected.idCodigo > 1) &&
                      !FFAppState()
                          .ConfigLocais
                          .tPagDisable
                          .contains(TpPagamento.CREDIARIO),
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Container(
                      width: 110.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: widget.enumSelected == TpPagamento.CREDIARIO
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 3.0, 0.0, 3.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/wallet-icon-2048x1839-pdylzo6e.png',
                                          width: 50.0,
                                          height: 50.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Crediário',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 0.0))
                                    .addToStart(SizedBox(height: 5.0))
                                    .addToEnd(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: FFAppState()
                                      .ConfigLocais
                                      .tPagDisable
                                      .contains(TpPagamento.CREDIARIO)
                                  ? null
                                  : () async {
                                      await widget.tapCondPag?.call(
                                        TpPagamento.CREDIARIO,
                                      );
                                    },
                              text: '',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: double.infinity,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                                disabledColor: Color(0xD1F1F4F8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: (FFAppState()
                          .CondPagamentoList
                          .where((e) =>
                              (e.tipoPagamento == '2') && (e.status == 'S'))
                          .toList()
                          .isNotEmpty) &&
                      (FFAppState().ClienteSelected.idCodigo > 1) &&
                      !FFAppState()
                          .ConfigLocais
                          .tPagDisable
                          .contains(TpPagamento.CHEQUE),
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Container(
                      width: 110.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/check-icon.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Cheque',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.manrope(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 0.0))
                                    .addToStart(SizedBox(height: 5.0))
                                    .addToEnd(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: true
                                ? null
                                : () {
                                    print('Button pressed ...');
                                  },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor: Color(0xD1F1F4F8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: (FFAppState()
                          .CondPagamentoList
                          .where((e) =>
                              (e.tipoPagamento == '10') && (e.status == 'S'))
                          .toList()
                          .isNotEmpty) &&
                      !FFAppState()
                          .ConfigLocais
                          .tPagDisable
                          .contains(TpPagamento.VALECOMBUSTIVEL) &&
                      !widget.bModoPagMP! &&
                      (FFAppState().ConfigRemota.valecombClicad == 'S'
                          ? (FFAppState().ClienteSelected.idCodigo != 1)
                          : true),
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Container(
                      width: 110.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: widget.enumSelected ==
                                  TpPagamento.VALECOMBUSTIVEL
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/3787673.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Vale\n',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Combústivel',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                          ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ]
                                    .divide(SizedBox(height: 0.0))
                                    .addToStart(SizedBox(height: 5.0))
                                    .addToEnd(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await widget.tapCondPag?.call(
                                  TpPagamento.VALECOMBUSTIVEL,
                                );
                              },
                              text: '',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: double.infinity,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            () => Visibility(
                  visible: (FFAppState()
                          .CondPagamentoList
                          .where((e) =>
                              (e.tipoPagamento == '13') && (e.status == 'S'))
                          .toList()
                          .isNotEmpty) &&
                      !FFAppState()
                          .ConfigLocais
                          .tPagDisable
                          .contains(TpPagamento.VOUCHER) &&
                      !widget.bModoPagMP! &&
                      (FFAppState()
                              .AbastecimentosSelecionados
                              .where((e) => e.idBico > 1)
                              .toList()
                              .length >=
                          1),
                  child: Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Container(
                      width: 110.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: widget.enumSelected == TpPagamento.VOUCHER
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/unnamed.png',
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Shellbox',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.manrope(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 0.0))
                                    .addToStart(SizedBox(height: 5.0))
                                    .addToEnd(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await widget.tapCondPag?.call(
                                TpPagamento.VOUCHER,
                              );
                            },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: double.infinity,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.manrope(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ][index]();
        },
      ),
    );
  }
}
