import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/altera_produto_widget.dart';
import '/components/com_autorizacao_widget.dart';
import '/components/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ff_commons/api_requests/api_paging_params.dart';
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_lista_vazia_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_scanner_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'produtos_model.dart';
export 'produtos_model.dart';

class ProdutosWidget extends StatefulWidget {
  const ProdutosWidget({
    super.key,
    bool? bLancamentoDiversos,
  }) : this.bLancamentoDiversos = bLancamentoDiversos ?? false;

  final bool bLancamentoDiversos;

  static String routeName = 'Produtos';
  static String routePath = '/produtos';

  @override
  State<ProdutosWidget> createState() => _ProdutosWidgetState();
}

class _ProdutosWidgetState extends State<ProdutosWidget>
    with TickerProviderStateMixin {
  late ProdutosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProdutosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.aGrupoSearch = GrupoDataTypeStruct(
        idCodigo: 0,
        descricao: 'TODOS',
        datacadastro: '',
        idCategoria: 0,
        qtdProd: 0,
      );
      safeSetState(() {});
    });

    _model.pesquisaTextController ??= TextEditingController();
    _model.pesquisaFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-40.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 120.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).info,
            angle: 0.524,
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<m_s_framework_flutter_p5iajh_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.sideBarModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: SideBarWidget(
              enumPage: Pages.Produtos,
              actCallbackExpand: (bExpand) async {
                if (scaffoldKey.currentState!.isDrawerOpen ||
                    scaffoldKey.currentState!.isEndDrawerOpen) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.bLancamentoDiversos)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.menu_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 22.0,
                        ),
                        onPressed: () async {
                          scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                  if (!widget.bLancamentoDiversos)
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.chevron_left_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                ],
              ),
            ),
            title: AutoSizeText(
              valueOrDefault<String>(
                widget.bLancamentoDiversos
                    ? 'Lançamento Diversos'
                    : 'Produtos',
                '--',
              ),
              maxLines: 1,
              minFontSize: 10.0,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: GoogleFonts.outfit(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).cardAlter,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
            ),
            actions: [
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      FFIcons.kkqrcode,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                child: m_s_framework_flutter_p5iajh
                                    .UnViewMSFrameScannerWidget(
                                  bActiveClose: true,
                                  actReturnCallBack: (valueReturn) async {
                                    if (valueReturn != '') {
                                      safeSetState(() {
                                        _model.pesquisaTextController?.text =
                                            valueReturn;
                                      });
                                      safeSetState(() => _model
                                          .staggeredViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForStaggeredView(
                                              maxWait: 1500);
                                      await actions.hideKeyboard(
                                        context,
                                      );
                                    } else {
                                      return;
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.bListGrid = !_model.bListGrid;
                      safeSetState(() {});
                      if (_model.bListGrid) {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap[
                                  'containerOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                      } else {
                        if (animationsMap[
                                'containerOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap[
                                  'containerOnActionTriggerAnimation']!
                              .controller
                              .reverse();
                        }
                      }
                    },
                    child: Container(
                      width: 80.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.9, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.list,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 6.0, 0.0),
                                child: Icon(
                                  Icons.view_module,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  width: 36.0,
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x430B0D0F),
                                        offset: Offset(
                                          1.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'containerOnActionTriggerAnimation']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: false,
            toolbarHeight: 80.0,
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 40.0,
                              constraints: BoxConstraints(
                                minWidth: 200.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(50.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 0.0, 2.0),
                                      child: Container(
                                        width: 220.0,
                                        child: TextFormField(
                                          controller:
                                              _model.pesquisaTextController,
                                          focusNode: _model.pesquisaFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.pesquisaTextController',
                                            Duration(milliseconds: 50),
                                            () => safeSetState(() {}),
                                          ),
                                          onFieldSubmitted: (_) async {
                                            safeSetState(() => _model
                                                .staggeredViewPagingController
                                                ?.refresh());
                                          },
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction:
                                              TextInputAction.search,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                            alignLabelWithHint: true,
                                            hintText:
                                                'Pesquisar por nome, gtin...',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                  lineHeight: 1.5,
                                                ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 10.0, 14.0, 10.0),
                                            prefixIcon: Icon(
                                              FFIcons.kklistDetails,
                                              color: Color(0x7957636C),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                lineHeight: 1.5,
                                              ),
                                          maxLength: 140,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.none,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          validator: _model
                                              .pesquisaTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [
                                            if (!isAndroid && !isiOS)
                                              TextInputFormatter.withFunction(
                                                  (oldValue, newValue) {
                                                return TextEditingValue(
                                                  selection: newValue.selection,
                                                  text: newValue.text
                                                      .toCapitalization(
                                                          TextCapitalization
                                                              .words),
                                                );
                                              }),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (_model.pesquisaTextController.text != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 12.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.clear_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          safeSetState(() {
                                            _model.pesquisaTextController
                                                ?.clear();
                                          });
                                          safeSetState(() => _model
                                              .staggeredViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForStaggeredView();
                                        },
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 2.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 12.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      icon: Icon(
                                        Icons.search_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        safeSetState(() => _model
                                            .staggeredViewPagingController
                                            ?.refresh());
                                        await actions.hideKeyboard(
                                          context,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    children: [
                      Container(
                        width: double.infinity,
                        height: 45.0,
                        decoration: BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().grupoData(
                            requestFn: () => GruposCall.call(
                              ip: m_s_framework_flutter_p5iajh_app_state
                                      .FFAppState()
                                  .ConfigGlobaisServer
                                  .host,
                              token: m_s_framework_flutter_p5iajh_app_state
                                      .FFAppState()
                                  .Token,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 70.0,
                                  ),
                                ),
                              );
                            }
                            final listViewGruposResponse = snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final grupoa = functions
                                        .addTodosOnGrupos(GruposCall.grupos(
                                          listViewGruposResponse.jsonBody,
                                        )?.toList())
                                        ?.toList() ??
                                    [];

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    5.0,
                                    0,
                                    40.0,
                                    0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: grupoa.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 5.0),
                                  itemBuilder: (context, grupoaIndex) {
                                    final grupoaItem = grupoa[grupoaIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 7.0, 0.0, 7.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.aGrupoSearch = grupoaItem;
                                          safeSetState(() {});
                                          safeSetState(() => _model
                                              .staggeredViewPagingController
                                              ?.refresh());
                                          await _model
                                              .waitForOnePageForStaggeredView(
                                                  maxWait: 1500);
                                        },
                                        child: Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              grupoaItem == _model.aGrupoSearch
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 3.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  1.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: AutoSizeText(
                                                grupoaItem.descricao,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          valueOrDefault<Color>(
                                                        grupoaItem ==
                                                                _model
                                                                    .aGrupoSearch
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  controller: _model.listViewController,
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (_model.aGrupoSearch != null
                          ? (_model.aGrupoSearch!.idCodigo >= 1)
                          : false)
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 35.0,
                            fillColor: Color(0x95FFFFFF),
                            icon: Icon(
                              Icons.clear_outlined,
                              color: FlutterFlowTheme.of(context).error,
                              size: 15.0,
                            ),
                            onPressed: () async {
                              _model.aGrupoSearch = GrupoDataTypeStruct(
                                idCodigo: 0,
                                descricao: 'TODOS',
                                datacadastro: '',
                                idCategoria: 0,
                                qtdProd: 0,
                              );
                              safeSetState(() {});
                              unawaited(
                                () async {
                                  await _model.listViewController?.animateTo(
                                    0,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                }(),
                              );
                              safeSetState(() => _model
                                  .staggeredViewPagingController
                                  ?.refresh());
                              await _model.waitForOnePageForStaggeredView(
                                  maxWait: 1500);
                            },
                          ),
                        ),
                    ],
                  ),
                  if (!_model.bFavorite)
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: RefreshIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          strokeWidth: 1.0,
                          onRefresh: () async {
                            safeSetState(() => _model
                                .staggeredViewPagingController
                                ?.refresh());
                            await _model.waitForOnePageForStaggeredView();
                          },
                          child: PagedMasonryGridView<ApiPagingParams,
                              dynamic>.count(
                            pagingController: _model.setStaggeredViewController(
                              (nextPageMarker) => ProdutosCall.call(
                                ip: m_s_framework_flutter_p5iajh_app_state
                                        .FFAppState()
                                    .ConfigGlobaisServer
                                    .host,
                                token: m_s_framework_flutter_p5iajh_app_state
                                        .FFAppState()
                                    .Token,
                                demmand: 50,
                                skip: nextPageMarker.nextPageNumber * 50,
                                pesquisa: functions.pesquisaProdutos(
                                    _model.pesquisaTextController.text,
                                    valueOrDefault<int>(
                                      _model.aGrupoSearch?.idCodigo,
                                      0,
                                    )),
                              ),
                            ),
                            crossAxisCount: _model.bListGrid
                                ? valueOrDefault<int>(
                                    () {
                                      if (MediaQuery.sizeOf(context).width <
                                          280.0) {
                                        return 1;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          680.0) {
                                        return 2;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          880.0) {
                                        return 3;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          1280.0) {
                                        return 4;
                                      } else {
                                        return 6;
                                      }
                                    }(),
                                    1,
                                  )
                                : 1,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              (FFAppState().ListaLancamentoDiversos.length >=
                                          1) ||
                                      (_model.produtosabastecimentos.length >=
                                          1)
                                  ? 150.0
                                  : 10.0,
                            ),
                            builderDelegate: PagedChildBuilderDelegate<dynamic>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 70.0,
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Center(
                                child: Container(
                                  height: 250.0,
                                  child: m_s_framework_flutter_p5iajh
                                      .UnViewMSFrameListaVaziaWidget(
                                    sTitulo: 'Lista Vazia',
                                    sTexto:
                                        'Verifique seus filtros ou conexão com a internet e tente novamente!',
                                    bIsAction: true,
                                    vSizeTitulo: 16.0,
                                    vSizeTexto: 14.0,
                                    corTitulo: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    corSubtitulo: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    sTextAction: 'Atualizar',
                                    cColorButton:
                                        FlutterFlowTheme.of(context).primary,
                                    pIcon: Icon(
                                      FFIcons.kkrefresh,
                                      size: 18.0,
                                    ),
                                    textSize: 14.0,
                                    aActionButton: () async {
                                      safeSetState(() => _model
                                          .staggeredViewPagingController
                                          ?.refresh());
                                      await _model
                                          .waitForOnePageForStaggeredView(
                                              maxWait: 1500);
                                    },
                                  ),
                                ),
                              ),
                              itemBuilder: (context, _, teteIndex) {
                                final teteItem = _model
                                    .staggeredViewPagingController!
                                    .itemList![teteIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (teteItem.combustivel != 'S') {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: 600.0,
                                                child: AlteraProdutoWidget(
                                                  dtProduto: teteItem,
                                                  bLancDiversos: widget
                                                      .bLancamentoDiversos,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.actReturnAltProduto = value));

                                      if (!widget.bLancamentoDiversos &&
                                          (_model.actReturnAltProduto! >=
                                              1.0)) {
                                        await _model.addProdutoOnList(
                                          context,
                                          dtProduto: teteItem,
                                          iQuant: _model.actReturnAltProduto,
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: valueOrDefault<double>(
                                        _model.bListGrid ? 300.0 : 85.0,
                                        85.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: widget.bLancamentoDiversos &&
                                                  (FFAppState()
                                                          .ListaLancamentoDiversos
                                                          .where((e) =>
                                                              e.idCodigo ==
                                                              (teteItem
                                                                      .idCodigo *
                                                                  (-1)))
                                                          .toList()
                                                          .length >=
                                                      1)
                                              ? FlutterFlowTheme.of(context)
                                                  .customPrimary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (!_model.bListGrid)
                                            Container(
                                              height: 100.0,
                                              child: Stack(
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Opacity(
                                                          opacity: teteItem
                                                                          .imagemUrl ==
                                                                      null ||
                                                                  teteItem.imagemUrl ==
                                                                      ''
                                                              ? 0.7
                                                              : 1.0,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        teteItem.imagemUrl != null &&
                                                                                teteItem.imagemUrl != ''
                                                                            ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      teteItem.imagemUrl != null &&
                                                                              teteItem.imagemUrl != ''
                                                                          ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png' +
                                                                          '$teteIndex',
                                                                    ),
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                teteItem.imagemUrl !=
                                                                            null &&
                                                                        teteItem.imagemUrl !=
                                                                            ''
                                                                    ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                    : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png' +
                                                                    '$teteIndex',
                                                              ),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    teteItem.imagemUrl !=
                                                                                null &&
                                                                            teteItem.imagemUrl !=
                                                                                ''
                                                                        ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .scaleDown,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      2.0,
                                                                      12.0,
                                                                      2.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          60.0,
                                                                          0.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        '${valueOrDefault<String>(
                                                                          teteItem
                                                                              .idCodigo
                                                                              .toString(),
                                                                          '0',
                                                                        )}-${valueOrDefault<String>(
                                                                          teteItem
                                                                              .nompro,
                                                                          '--',
                                                                        )}',
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.outfit(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        AutoSizeText(
                                                                      'GTIN: ${valueOrDefault<String>(
                                                                        teteItem
                                                                            .codigogtin,
                                                                        '0',
                                                                      )}',
                                                                      maxLines:
                                                                          1,
                                                                      minFontSize:
                                                                          8.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        AutoSizeText(
                                                                      'ESTOQUE: ${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          teteItem
                                                                              .estoque,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '##.##',
                                                                          locale:
                                                                              'pt_Br',
                                                                        ),
                                                                        '0',
                                                                      )}',
                                                                      maxLines:
                                                                          1,
                                                                      minFontSize:
                                                                          8.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.outfit(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                'R\$',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.outfit(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              functions.realFormatSCifrao(
                                                                                  false,
                                                                                  valueOrDefault<String>(
                                                                                    teteItem.pravista.toString(),
                                                                                    '0',
                                                                                  )),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                GoogleFonts.outfit(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  3.0,
                                                                  3.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: badges.Badge(
                                                              badgeContent:
                                                                  Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    _model
                                                                        .produtosabastecimentos
                                                                        .where((e) =>
                                                                            e.produtoDT ==
                                                                            teteItem)
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.quantidade,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format:
                                                                        '##.##',
                                                                    locale:
                                                                        'pt_Br',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .manrope(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              showBadge: _model
                                                                      .produtosabastecimentos
                                                                      .where((e) =>
                                                                          e.produtoDT ==
                                                                          teteItem)
                                                                      .toList()
                                                                      .length >=
                                                                  1,
                                                              shape: badges
                                                                  .BadgeShape
                                                                  .circle,
                                                              badgeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              elevation: 4.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          8.0,
                                                                          8.0,
                                                                          8.0),
                                                              position: badges
                                                                      .BadgePosition
                                                                  .topEnd(),
                                                              animationType: badges
                                                                  .BadgeAnimationType
                                                                  .scale,
                                                              toAnimate: true,
                                                              child: Visibility(
                                                                visible: !widget
                                                                    .bLancamentoDiversos,
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onLongPress:
                                                                      () async {
                                                                    if ((teteItem.combustivel !=
                                                                            'S') &&
                                                                        !widget
                                                                            .bLancamentoDiversos) {
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(context).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                Padding(
                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                              child: Container(
                                                                                height: 600.0,
                                                                                child: AlteraProdutoWidget(
                                                                                  dtProduto: teteItem,
                                                                                  bLancDiversos: widget.bLancamentoDiversos,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  },
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        8.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kkplaylistAdd,
                                                                      color: functions.verifyProductInList(
                                                                              teteItem,
                                                                              _model.produtosabastecimentos
                                                                                  .toList())!
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    showLoadingIndicator:
                                                                        true,
                                                                    onPressed: (teteItem.combustivel ==
                                                                            'S')
                                                                        ? null
                                                                        : () async {
                                                                            if ((teteItem.combustivel != 'S') &&
                                                                                !widget.bLancamentoDiversos) {
                                                                              await _model.addProdutoOnList(
                                                                                context,
                                                                                dtProduto: teteItem,
                                                                                iQuant: 1.0,
                                                                              );
                                                                              safeSetState(() {});
                                                                            }
                                                                          },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          if (_model.bListGrid)
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                12.0),
                                                        topRight:
                                                            Radius.circular(
                                                                12.0),
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Opacity(
                                                          opacity: teteItem
                                                                          .imagemUrl ==
                                                                      null ||
                                                                  teteItem.imagemUrl ==
                                                                      ''
                                                              ? 0.7
                                                              : 1.0,
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        teteItem.imagemUrl != null &&
                                                                                teteItem.imagemUrl != ''
                                                                            ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) =>
                                                                          Image
                                                                              .asset(
                                                                        'assets/images/error_image.png',
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      teteItem.imagemUrl != null &&
                                                                              teteItem.imagemUrl != ''
                                                                          ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png' +
                                                                          '$teteIndex',
                                                                    ),
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  valueOrDefault<
                                                                      String>(
                                                                teteItem.imagemUrl !=
                                                                            null &&
                                                                        teteItem.imagemUrl !=
                                                                            ''
                                                                    ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                    : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png' +
                                                                    '$teteIndex',
                                                              ),
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          12.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          12.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    teteItem.imagemUrl !=
                                                                                null &&
                                                                            teteItem.imagemUrl !=
                                                                                ''
                                                                        ? '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(teteItem.imagemUrl, '')}'
                                                                        : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
                                                                  ),
                                                                  width: double
                                                                      .infinity,
                                                                  height: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'imageOnPageLoadAnimation']!),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              badges.Badge(
                                                                badgeContent:
                                                                    Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    formatNumber(
                                                                      _model
                                                                          .produtosabastecimentos
                                                                          .where((e) =>
                                                                              e.produtoDT ==
                                                                              teteItem)
                                                                          .toList()
                                                                          .firstOrNull
                                                                          ?.quantidade,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '##.##',
                                                                      locale:
                                                                          'pt_Br',
                                                                    ),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .manrope(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                showBadge: _model
                                                                        .produtosabastecimentos
                                                                        .where((e) =>
                                                                            e.produtoDT ==
                                                                            teteItem)
                                                                        .toList()
                                                                        .length >=
                                                                    1,
                                                                shape: badges
                                                                    .BadgeShape
                                                                    .circle,
                                                                badgeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                elevation: 4.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
                                                                position: badges
                                                                        .BadgePosition
                                                                    .topEnd(),
                                                                animationType:
                                                                    badges
                                                                        .BadgeAnimationType
                                                                        .scale,
                                                                toAnimate: true,
                                                                child:
                                                                    Visibility(
                                                                  visible: !widget
                                                                      .bLancamentoDiversos,
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onLongPress:
                                                                        () async {
                                                                      if ((teteItem.combustivel !=
                                                                              'S') &&
                                                                          !widget
                                                                              .bLancamentoDiversos) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: Container(
                                                                                  height: 600.0,
                                                                                  child: AlteraProdutoWidget(
                                                                                    dtProduto: teteItem,
                                                                                    bLancDiversos: widget.bLancamentoDiversos,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      }
                                                                    },
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          8.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kkplaylistAdd,
                                                                        color: functions.verifyProductInList(teteItem,
                                                                                _model.produtosabastecimentos.toList())!
                                                                            ? FlutterFlowTheme.of(context).primary
                                                                            : FlutterFlowTheme.of(context).secondaryText,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed: (teteItem.combustivel ==
                                                                              'S')
                                                                          ? null
                                                                          : () async {
                                                                              if ((teteItem.combustivel != 'S') && !widget.bLancamentoDiversos) {
                                                                                await _model.addProdutoOnList(
                                                                                  context,
                                                                                  dtProduto: teteItem,
                                                                                  iQuant: 1.0,
                                                                                );
                                                                                safeSetState(() {});
                                                                              }
                                                                            },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  color: Colors.transparent,
                                                  elevation: 0.0,
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 120.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  '${valueOrDefault<String>(
                                                                    teteItem
                                                                        .idCodigo
                                                                        .toString(),
                                                                    '0',
                                                                  )}-${valueOrDefault<String>(
                                                                    teteItem
                                                                        .nompro,
                                                                    '--',
                                                                  )}',
                                                                  maxLines: 2,
                                                                  minFontSize:
                                                                      14.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  'GTIN: ${valueOrDefault<String>(
                                                                    teteItem
                                                                        .codigogtin,
                                                                    '--',
                                                                  )}',
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      8.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  'ESTOQUE: ${valueOrDefault<String>(
                                                                    formatNumber(
                                                                      teteItem
                                                                          .estoque,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      format:
                                                                          '##.##',
                                                                      locale:
                                                                          'pt_br',
                                                                    ),
                                                                    '0',
                                                                  )}',
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      8.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    AutoSizeText(
                                                                  'MARCA: ${valueOrDefault<String>(
                                                                    teteItem
                                                                        .marca,
                                                                    '--',
                                                                  )}',
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      8.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .outfit(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          5.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                'R\$',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.outfit(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 8.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              functions.realFormatSCifrao(
                                                                                  false,
                                                                                  valueOrDefault<String>(
                                                                                    teteItem.pravista.toString(),
                                                                                    '0',
                                                                                  )),
                                                                              '0',
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.manrope(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      maxLines:
                                                                          5,
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(height: 5.0))
                                                  .addToEnd(
                                                      SizedBox(height: 12.0)),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                ]
                    .addToStart(SizedBox(height: 12.0))
                    .addToEnd(SizedBox(height: 12.0)),
              ),
            ),
            if (widget.bLancamentoDiversos
                ? (FFAppState().ListaLancamentoDiversos.length >= 1)
                : (_model.produtosabastecimentos.length >= 1))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  width: double.infinity,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).cardTotalizacao,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AutoSizeText(
                        'Totalização',
                        maxLines: 1,
                        minFontSize: 10.0,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.outfit(
                                fontWeight: FontWeight.normal,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  'N° Selecionado(s)',
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        formatNumber(
                                          functions.sumListDouble((widget
                                                      .bLancamentoDiversos
                                                  ? FFAppState()
                                                      .ListaLancamentoDiversos
                                                      .map((e) => e.quantidade)
                                                      .toList()
                                                  : _model
                                                      .produtosabastecimentos
                                                      .map((e) => e.quantidade)
                                                      .toList())
                                              .toList()),
                                          formatType: FormatType.custom,
                                          format: '##.###',
                                          locale: 'pt_br',
                                        ),
                                        '0',
                                      ),
                                      style: GoogleFonts.manrope(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'x',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                      ),
                                    )
                                  ],
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            badges.Badge(
                              badgeContent: Text(
                                widget.bLancamentoDiversos
                                    ? valueOrDefault<String>(
                                        FFAppState()
                                            .ListaLancamentoDiversos
                                            .length
                                            .toString(),
                                        '0',
                                      )
                                    : _model.produtosabastecimentos.length
                                        .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                              showBadge: true,
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 4.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              position: badges.BadgePosition.topEnd(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: FlutterFlowIconButton(
                                borderRadius: 8.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Atenção'),
                                                content: Text(
                                                    'Deseja limpar os itens da sua lista!?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            false),
                                                    child: Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext,
                                                            true),
                                                    child: Text('Confirmar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    if (widget.bLancamentoDiversos) {
                                      FFAppState().ListaLancamentoDiversos = [];
                                      FFAppState().FrentistaSelecionado =
                                          FrentistasDataTypeStruct();
                                      safeSetState(() {});
                                    } else {
                                      FFAppState().FrentistaSelecionado =
                                          FrentistasDataTypeStruct();
                                      safeSetState(() {});
                                      _model.produtosabastecimentos = [];
                                      safeSetState(() {});
                                    }
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
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
                                                  font: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                                                  functions
                                                      .sumListDouble((widget
                                                                  .bLancamentoDiversos
                                                              ? FFAppState()
                                                                  .ListaLancamentoDiversos
                                                                  .map((e) =>
                                                                      e.total)
                                                                  .toList()
                                                              : _model
                                                                  .produtosabastecimentos
                                                                  .map((e) => e
                                                                      .vlrtotal)
                                                                  .toList())
                                                          .toList())
                                                      .toString()),
                                              '0',
                                            ),
                                            style: GoogleFonts.manrope(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30.0,
                                            ),
                                          )
                                        ],
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
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 5.0, 12.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      if (widget.bLancamentoDiversos) {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  width: 350.0,
                                                  child: ComAutorizacaoWidget(
                                                    tpSelecao:
                                                        TpSelecaoFrentista
                                                            .seNone,
                                                    cancelAction: () async {},
                                                    confirmAction: () async {},
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() =>
                                            _model.returnFrentista = value));

                                        _shouldSetState = true;
                                        if (_model.returnFrentista!) {
                                          _model.bLoadActive = true;
                                          safeSetState(() {});
                                          _model.actUpdateDTLista =
                                              await actions.updateDTListaAdd(
                                            FFAppState()
                                                .ListaLancamentoDiversos
                                                .toList(),
                                            FFAppState().FrentistaSelecionado,
                                          );
                                          _shouldSetState = true;
                                          FFAppState().ListaLancamentoDiversos =
                                              _model.actUpdateDTLista!
                                                  .toList()
                                                  .cast<
                                                      ListaAddAbastecimentoDataTypeStruct>();
                                          FFAppState().update(() {});
                                          _model.lancReturn =
                                              await action_blocks
                                                  .lancamentoDiversos(context);
                                          _shouldSetState = true;
                                          if (_model.lancReturn!) {
                                            _model.bLoadActive = false;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            _model.bLoadActive = false;
                                            safeSetState(() {});
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }
                                        } else {
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Container(
                                                  height: 171.0,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.95,
                                                  child: m_s_framework_flutter_p5iajh
                                                      .UnViewMSFrameMessageBoxWidget(
                                                    sTitulo: 'Confirmar',
                                                    sText:
                                                        'Deseja registrar o lançamento à lista de diversos?',
                                                    colorConfirm:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    colorCancel:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    enableCancel: true,
                                                    colorTextButtonConfirm:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    sTextoConfirm: 'Confirmar',
                                                    sTextoCancel: 'Cancelar',
                                                    colorTextButtonCancel:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .error,
                                                    actConfirm: () async {
                                                      _model.iLoopAdd = 0;
                                                      _model.bResultLoop =
                                                          false;
                                                      safeSetState(() {});
                                                      _model.actReturnToREgister =
                                                          await actions
                                                              .addListToDTLancmento(
                                                        _model
                                                            .produtosabastecimentos
                                                            .toList(),
                                                        -1,
                                                      );
                                                      await _model
                                                          .lancamentoDiversosOnly(
                                                        context,
                                                        listRegister: _model
                                                            .actReturnToREgister,
                                                      );
                                                      if (_model.bResultLoop) {
                                                        FFAppState()
                                                            .ListaLancamentoDiversos = [];
                                                        safeSetState(() {});
                                                        _model.produtosabastecimentos =
                                                            [];
                                                        _model.iLoopAdd = 0;
                                                        safeSetState(() {});

                                                        context.pushNamed(
                                                            CheckoutWidget
                                                                .routeName);
                                                      }
                                                    },
                                                    actCancel: () async {
                                                      unawaited(
                                                        () async {}(),
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        if (!_model.bResultLoop) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Container(
                                                    height: 171.0,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.95,
                                                    child: m_s_framework_flutter_p5iajh
                                                        .UnViewMSFrameMessageBoxWidget(
                                                      sTitulo: 'Atenção',
                                                      sText:
                                                          'Falha ao registrar lançamento, verifique sua conexão e tente novamente...',
                                                      colorConfirm:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      colorCancel:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      enableCancel: false,
                                                      sTextoConfirm: 'Ok',
                                                      actConfirm: () async {},
                                                      actCancel: () async {},
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Registrar',
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w300,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 3.0,
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
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ].addToStart(SizedBox(height: 5.0)),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation']!),
              ),
            if (_model.bLoadActive)
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Lottie.asset(
                            'assets/jsons/Animation_-_1730114846312.json',
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.contain,
                            animate: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
