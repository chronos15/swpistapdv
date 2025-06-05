import '/components/un_view_ms_windows_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'un_view_m_s_frame_header_model.dart';
export 'un_view_m_s_frame_header_model.dart';

class UnViewMSFrameHeaderWidget extends StatefulWidget {
  const UnViewMSFrameHeaderWidget({
    super.key,
    required this.drawerAction,
    required this.expanAction,
    required this.actionMenuModal,
    required this.isPrincipal,
    required this.sNamePag,
    required this.sTitulo,
    required this.imgLogo,
    required this.imgEmpresa,
    this.empresaActTap,
    this.sUsuario,
    required this.sideColorBackground,
    required this.sideMenuExpansable,
    bool? modalUserMenu,
    bool? usaContainerPesquisa,
  })  : this.modalUserMenu = modalUserMenu ?? false,
        this.usaContainerPesquisa = usaContainerPesquisa ?? false;

  final Future Function()? drawerAction;
  final Future Function()? expanAction;
  final Future Function()? actionMenuModal;
  final bool? isPrincipal;
  final String? sNamePag;
  final String? sTitulo;
  final String? imgLogo;
  final String? imgEmpresa;
  final Future Function()? empresaActTap;
  final String? sUsuario;
  final Color? sideColorBackground;
  final bool? sideMenuExpansable;
  final bool modalUserMenu;
  final bool usaContainerPesquisa;

  @override
  State<UnViewMSFrameHeaderWidget> createState() =>
      _UnViewMSFrameHeaderWidgetState();
}

class _UnViewMSFrameHeaderWidgetState extends State<UnViewMSFrameHeaderWidget>
    with TickerProviderStateMixin {
  late UnViewMSFrameHeaderModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UnViewMSFrameHeaderModel());

    _model.pesquisaTextController ??= TextEditingController();
    _model.pesquisaFocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 800.0.ms,
            hz: 7,
            offset: Offset(0.0, 0.0),
            rotation: 0.035,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms,
            duration: 600.0.ms,
            begin: Offset(-10.0, 0.0),
            end: Offset(0.0, 0.0),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          height: isAndroid ? 100.0 : 75.0,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              widget!.sideColorBackground,
              FlutterFlowTheme.of(context).primaryBackground,
            ),
            border: Border.all(
              color: valueOrDefault<Color>(
                widget!.sideColorBackground,
                FlutterFlowTheme.of(context).primaryBackground,
              ),
              width: 0.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
                0.0,
                valueOrDefault<double>(
                  () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 20.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 0.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 0.0;
                    } else {
                      return 0.0;
                    }
                  }(),
                  0.0,
                ),
                0.0,
                0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Container(
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if ((widget!.isPrincipal ?? true) &&
                                          responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.menu,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            await widget.drawerAction?.call();
                                          },
                                        ),
                                      if (!widget!.isPrincipal!)
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 12.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.chevron_left_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((widget!.sideMenuExpansable! ||
                                                    (MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointSmall)) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    widget!.imgLogo!,
                                                    width: 30.0,
                                                    height: 30.0,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'imageOnPageLoadAnimation1']!),
                                              ),
                                            if (widget!.sideMenuExpansable! ||
                                                (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    widget!.imgEmpresa!,
                                                    width: 135.0,
                                                    height: 35.0,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'imageOnPageLoadAnimation2']!),
                                              ),
                                            if ((widget!.isPrincipal ?? true) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await widget.expanAction
                                                      ?.call();
                                                  HapticFeedback
                                                      .selectionClick();
                                                  _model.drawerIsAnimated =
                                                      !_model.drawerIsAnimated;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 48.0,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(),
                                                  child: MouseRegion(
                                                    opaque: false,
                                                    cursor: MouseCursor.defer ??
                                                        MouseCursor.defer,
                                                    child: Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Icon(
                                                            Icons.menu,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                        if (!_model
                                                            .drawerIsAnimated)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget!
                                                                      .sideColorBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!,
                                                            ),
                                                          ),
                                                        if (_model
                                                            .drawerIsAnimated)
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Container(
                                                              width: 25.0,
                                                              height: 25.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  widget!
                                                                      .sideColorBackground,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ).animateOnActionTrigger(
                                                              animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    onEnter: ((event) async {
                                                      safeSetState(() => _model
                                                              .mouseRegionHovered1 =
                                                          true);
                                                      if (_model
                                                          .drawerIsAnimated) {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward();
                                                        }
                                                      } else {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward();
                                                        }
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                      }
                                                    }),
                                                    onExit: ((event) async {
                                                      safeSetState(() => _model
                                                              .mouseRegionHovered1 =
                                                          false);
                                                      if (!_model
                                                          .drawerIsAnimated) {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .forward();
                                                        }
                                                      } else {
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation1'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation1']!
                                                              .controller
                                                              .forward();
                                                        }
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation2']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                      }
                                                    }),
                                                  ),
                                                ),
                                              ),
                                            if ((widget!.isPrincipal! &&
                                                    !_model.openSearch) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await widget.empresaActTap
                                                          ?.call();
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        AutoSizeText(
                                                          valueOrDefault<
                                                              String>(
                                                            widget!.sTitulo,
                                                            'Inicio',
                                                          ),
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          AutoSizeText(
                                                            '000.000.0000/0000-00',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .outfit(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFFC3C3C3),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (!widget!.isPrincipal!)
                                          Text(
                                            valueOrDefault<String>(
                                              widget!.sNamePag,
                                              'Inicio',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.outfit(
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
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
                                      ].addToStart(SizedBox(height: 5.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 8.0)).addToStart(SizedBox(
                              width: widget!.sideMenuExpansable! ? 0.0 : 13.0)),
                        ),
                      ),
                      if (widget!.isPrincipal ?? true)
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MouseRegion(
                                opaque: true,
                                cursor: SystemMouseCursors.click ??
                                    MouseCursor.defer,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.actionMenuModal?.call();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (widget!.usaContainerPesquisa &&
                                            responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                          Material(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: _model.openSearch
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .info
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (_model.openSearch)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  2.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Container(
                                                        width: 180.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .pesquisaTextController,
                                                          focusNode: _model
                                                              .pesquisaFocusNode,
                                                          autofocus: true,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .words,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .search,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                            alignLabelWithHint:
                                                                true,
                                                            hintText:
                                                                'Pesquisar',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .readexPro(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        10.0,
                                                                        14.0,
                                                                        10.0),
                                                            prefixIcon: Icon(
                                                              Icons
                                                                  .search_rounded,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .outfit(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.5,
                                                              ),
                                                          maxLength: 140,
                                                          maxLengthEnforcement:
                                                              MaxLengthEnforcement
                                                                  .none,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          validator: _model
                                                              .pesquisaTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            if (!isAndroid &&
                                                                !isiOS)
                                                              TextInputFormatter
                                                                  .withFunction(
                                                                      (oldValue,
                                                                          newValue) {
                                                                return TextEditingValue(
                                                                  selection:
                                                                      newValue
                                                                          .selection,
                                                                  text: newValue
                                                                      .text
                                                                      .toCapitalization(
                                                                          TextCapitalization
                                                                              .words),
                                                                );
                                                              }),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  if (_model.openSearch)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  2.0,
                                                                  2.0,
                                                                  2.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 12.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.search_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
                                                  if (!_model.openSearch)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  2.0,
                                                                  2.0,
                                                                  2.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 12.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.search_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.openSearch =
                                                              !_model
                                                                  .openSearch;
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  if (_model.openSearch)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  2.0,
                                                                  2.0,
                                                                  2.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 12.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.close_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          _model.openSearch =
                                                              !_model
                                                                  .openSearch;
                                                          safeSetState(() {});
                                                          safeSetState(() {
                                                            _model
                                                                .pesquisaTextController
                                                                ?.clear();
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        if (widget!.isPrincipal! &&
                                            !_model.openSearch)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: AutoSizeText(
                                                    valueOrDefault<String>(
                                                      widget!.sUsuario,
                                                      'Usuario',
                                                    ).maybeHandleOverflow(
                                                      maxChars: 8,
                                                    ),
                                                    maxLines: 1,
                                                    minFontSize: 8.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .outfit(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
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
                                                ),
                                              ),
                                              if (!widget!.modalUserMenu)
                                                Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                              if (widget!.modalUserMenu)
                                                Icon(
                                                  Icons.keyboard_arrow_up_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  size: 24.0,
                                                ),
                                            ],
                                          ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                  ),
                                ),
                                onEnter: ((event) async {
                                  safeSetState(
                                      () => _model.mouseRegionHovered2 = true);
                                }),
                                onExit: ((event) async {
                                  safeSetState(
                                      () => _model.mouseRegionHovered2 = false);
                                }),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            width: 5.0,
                            thickness: 1.0,
                            indent: 22.0,
                            endIndent: 22.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      if ((!isAndroid &&
                              !isiOS &&
                              !isWeb &&
                              widget!.isPrincipal!) &&
                          responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                        wrapWithModel(
                          model: _model.unViewMsWindowsBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: UnViewMsWindowsBarWidget(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
