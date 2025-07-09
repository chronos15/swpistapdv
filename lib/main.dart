import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/custom_auth/auth_util.dart';
import 'auth/custom_auth/custom_auth_user_provider.dart';

import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/internationalization.dart'
    as m_s_framework_flutter_p5iajh_internationalization;

import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;






//import para o registro de log interno.
import 'dart:async';
import 'custom_code/actions/logger_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await authManager.initialize();

  runZonedGuarded(() {
    // Captura erros de widgets Flutter
    FlutterError.onError = (FlutterErrorDetails details) {
      final exceptionStr = details.exceptionAsString();
      final stackStr = details.stack?.toString() ?? '';

      // Padrões de erro irrelevantes
      final ignoredMessages = [
        'A RenderFlex overflowed',
        'setState() called after dispose',
        'Invalid argument(s)',
        'Bad state: Future already completed',
        'LateInitializationError',
        'NoSuchMethodError',
      ];

      final ignoredStackParts = [
        'package:flutter/src/widgets/',
        'package:flutter/src/rendering/',
        'package:flutter/src/scheduler/',
      ];

      final shouldIgnore = ignoredMessages.any(exceptionStr.contains) ||
          ignoredStackParts.any(stackStr.contains);

      if (shouldIgnore) return;

      // Classificação do erro
      final isAssertionError = details.exception is AssertionError;
      final isTypeError = details.exception is TypeError;
      final isFormatError = details.exception is FormatException;

      int logLevel = 3; // ERROR padrão
      if (isAssertionError) logLevel = 4; // CRITICAL
      if (isTypeError) logLevel = 2; // WARNING
      if (isFormatError) logLevel = 1; // INFO

      loggerRegister(
        exceptionStr,
        stackStr,
        logLevel,
      );
    };

    runApp(MyApp());
  }, (error, stack) {
    final exceptionStr = error.toString();
    final stackStr = stack.toString();

    // Mesmos filtros aplicados à zona assíncrona
    final ignoredMessages = [
      'A RenderFlex overflowed',
      'setState() called after dispose',
      'Invalid argument(s)',
      'Bad state: Future already completed',
      'LateInitializationError',
      'NoSuchMethodError',
    ];

    final ignoredStackParts = [
      'package:flutter/src/widgets/',
      'package:flutter/src/rendering/',
      'package:flutter/src/scheduler/',
    ];

    final shouldIgnore = ignoredMessages.any(exceptionStr.contains) ||
        ignoredStackParts.any(stackStr.contains);

    if (shouldIgnore) return;

    final isAssertionError = error is AssertionError;
    final isTypeError = error is TypeError;
    final isFormatError = error is FormatException;

    int logLevel = 3; // ERROR padrão
    if (isAssertionError) logLevel = 4; // CRITICAL
    if (isTypeError) logLevel = 2; // WARNING
    if (isFormatError) logLevel = 1; // INFO

    loggerRegister(
      exceptionStr,
      stackStr,
      logLevel,
    );
  });

  // Start initial custom actions code
  await actions.portraitAction();
  await m_s_framework_flutter_p5iajh_actions.defineTransparentBar();
  // End initial custom actions code

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  final m_s_framework_flutter_p5iajhAppState =
      m_s_framework_flutter_p5iajh_app_state.FFAppState();
  await m_s_framework_flutter_p5iajhAppState.initializePersistedState();
  //await m_s_framework_flutter_p5iajh_actions.testConnectionServer();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => appState,
      ),
      ChangeNotifierProvider(
        create: (context) => m_s_framework_flutter_p5iajhAppState,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<SOFTWORKPistaAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = sOFTWORKPistaAuthUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });

    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SOFTWORK Pista',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        m_s_framework_flutter_p5iajh_internationalization
            .FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          interactive: true,
          thickness: WidgetStateProperty.all(5.0),
          radius: Radius.circular(20.0),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(1509975277);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(1509975277);
            }
            return Color(1509975277);
          }),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          interactive: true,
          thickness: WidgetStateProperty.all(5.0),
          radius: Radius.circular(20.0),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(1509975277);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(1509975277);
            }
            return Color(1509975277);
          }),
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}
