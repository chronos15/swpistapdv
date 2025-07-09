import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'altera_produto_model.dart';
export 'altera_produto_model.dart';

/// um bottomsheet com alteração de quantidade, valor e desconto do produto em
/// pt-br em card
class AlteraProdutoWidget extends StatefulWidget {
  const AlteraProdutoWidget({
    super.key,
    required this.dtProduto,
    required this.bLancDiversos,
  });

  final ProdutoDataTypeStruct? dtProduto;
  final bool? bLancDiversos;

  @override
  State<AlteraProdutoWidget> createState() => _AlteraProdutoWidgetState();
}

class _AlteraProdutoWidgetState extends State<AlteraProdutoWidget> {
  late AlteraProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlteraProdutoModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false);
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: FlutterFlowTheme.of(context).primaryBackground,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.unknown,
                  },
                ),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Adicionar Produto',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).error,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Opacity(
                            opacity: widget.dtProduto?.imagemUrl == null ||
                                    widget.dtProduto?.imagemUrl == ''
                                ? 0.7
                                : 1.0,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        valueOrDefault<String>(
                                          widget.dtProduto?.imagemUrl !=
                                                      null &&
                                                  widget.dtProduto
                                                          ?.imagemUrl !=
                                                      ''
                                              ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(widget.dtProduto?.imagemUrl, '')}'
                                              : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                        ),
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      allowRotation: false,
                                      tag: valueOrDefault<String>(
                                        widget.dtProduto?.imagemUrl != null &&
                                                widget.dtProduto?.imagemUrl !=
                                                    ''
                                            ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(widget.dtProduto?.imagemUrl, '')}'
                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                      ),
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: valueOrDefault<String>(
                                  widget.dtProduto?.imagemUrl != null &&
                                          widget.dtProduto?.imagemUrl != ''
                                      ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(widget.dtProduto?.imagemUrl, '')}'
                                      : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                ),
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      widget.dtProduto?.imagemUrl != null &&
                                              widget.dtProduto?.imagemUrl != ''
                                          ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(widget.dtProduto?.imagemUrl, '')}'
                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                    ),
                                    fit: BoxFit.scaleDown,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Color(0x00000000),
                          child: ExpandableNotifier(
                            controller: _model.expandableExpandableController,
                            child: ExpandablePanel(
                              header: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      valueOrDefault<String>(
                                        widget.dtProduto?.nompro,
                                        '--',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 14.0,
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
                                ],
                              ),
                              collapsed: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'R\$ ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              functions.realFormatSCifrao(
                                                  false,
                                                  valueOrDefault<String>(
                                                    widget.dtProduto?.pravista
                                                        .toString(),
                                                    '0',
                                                  )),
                                              '0',
                                            ),
                                            style: GoogleFonts.outfit(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0,
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
                                              fontSize: 18.0,
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
                                      textAlign: TextAlign.end,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        'GTIN: ${valueOrDefault<String>(
                                          widget.dtProduto?.codigogtin,
                                          '000',
                                        )}',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
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
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 0.0, 2.0),
                                        child: Text(
                                          'MARCA: ${valueOrDefault<String>(
                                            widget.dtProduto?.marca,
                                            '--',
                                          )}',
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                font: GoogleFonts.urbanist(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        'ESTQ.: ${formatNumber(
                                          widget.dtProduto?.estoque,
                                          formatType: FormatType.custom,
                                          format: '##.##',
                                          locale: 'pt_br',
                                        )}',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 8.0,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12.0,
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
                                    ],
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: true,
                                iconColor: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Valor Unitário',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.manrope(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'R\$ ',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 8.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  functions.realFormatSCifrao(
                                                      false,
                                                      valueOrDefault<String>(
                                                        widget
                                                            .dtProduto?.pravista
                                                            .toString(),
                                                        '0',
                                                      )),
                                                  '0',
                                                ),
                                                style: GoogleFonts.outfit(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20.0,
                                                ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.manrope(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                          textAlign: TextAlign.end,
                                          maxLines: 1,
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantidade',
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 100.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.remove_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              _model.aQuant = _model.aQuant! +
                                                  (_model.aQuant! <= 0.0
                                                      ? 0.0
                                                      : -1.0);
                                              safeSetState(() {});
                                            },
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                _model.aQuant,
                                                formatType: FormatType.custom,
                                                format: '##.##',
                                                locale: 'pt_br',
                                              ),
                                              '1',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  font: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderRadius: 100.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            icon: Icon(
                                              Icons.add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              _model.aQuant =
                                                  _model.aQuant! + 1.0;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ].divide(SizedBox(width: 12.0)),
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 10.0, 12.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts.outfit(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      functions.realFormatSCifrao(
                                          true,
                                          valueOrDefault<String>(
                                            (valueOrDefault<double>(
                                                      widget
                                                          .dtProduto?.pravista,
                                                      0.0,
                                                    ) *
                                                    (_model.aQuant!))
                                                .toString(),
                                            '0',
                                          )),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.outfit(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 16.0)),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                child: FFButtonWidget(
                  onPressed: (_model.aQuant! <= 0.0)
                      ? null
                      : () async {
                          if (!widget.bLancDiversos!) {
                            Navigator.pop(context, _model.aQuant);
                          } else {
                            FFAppState().addToListaLancamentoDiversos(
                                ListaAddAbastecimentoDataTypeStruct(
                              idCodigo: valueOrDefault<int>(
                                valueOrDefault<int>(
                                      widget.dtProduto?.idCodigo,
                                      0,
                                    ) *
                                    (-1),
                                0,
                              ),
                              dataenvio: dateTimeFormat(
                                "yyyy-MM-dd",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              horaenvio: dateTimeFormat(
                                "HH:mm:ss",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              quantidade: _model.aQuant,
                              valor: valueOrDefault<double>(
                                widget.dtProduto?.pravista,
                                0.0,
                              ),
                              total: valueOrDefault<double>(
                                valueOrDefault<double>(
                                      widget.dtProduto?.pravista,
                                      0.0,
                                    ) *
                                    (_model.aQuant!),
                                0.0,
                              ),
                              numid:
                                  random_data.randomInteger(10, 10).toString(),
                              datetime: dateTimeFormat(
                                "yyyy-MM-dd HH:mm:ss",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              numseqitem:
                                  FFAppState().ListaLancamentoDiversos.length,
                              modo: 'D',
                              regtipo: 'I',
                              idloja: FFAppState().Empresa.idKey,
                              idfrentista: FFAppState()
                                  .FrentistaSelecionado
                                  .idFrentista
                                  .toString(),
                              cartao:
                                  FFAppState().FrentistaSelecionado.idCartao,
                            ));
                            safeSetState(() {});
                            Navigator.pop(context);
                            return;
                          }
                        },
                  text: widget.bLancDiversos! ? 'Adicionar' : 'Adicionar',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.manrope(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(25.0),
                    disabledColor: FlutterFlowTheme.of(context).alternate,
                    disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
