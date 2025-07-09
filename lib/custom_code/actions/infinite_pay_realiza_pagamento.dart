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
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> infinitePayRealizaPagamento(
  double? amount,
  String? paymentMethod,
  int? installments,
  String? orderId,
  String? resultUrl,
  String? appClientReferrer,
  bool? afForceDeeplink,
  Future Function()? actReturnCallback,
) async {
  if (amount == null ||
      paymentMethod == null ||
      orderId == null ||
      resultUrl == null) {
    print("Erro: parâmetros obrigatórios ausentes.");
    return false;
  }

  final uri = Uri(
    scheme: 'infinitepaydash',
    host: 'infinitetap-app',
    queryParameters: {
      'amount': amount.toStringAsFixed(2),
      'payment_method': paymentMethod,
      'installments': (installments ?? 1).toString(),
      'order_id': orderId,
      'result_url': resultUrl,
      'app_client_referrer': appClientReferrer ?? 'MeuApp',
      'af_force_deeplink': (afForceDeeplink ?? true).toString(),
    },
  );

  final appLinks = AppLinks();
  final completer = Completer<bool>();

  print(uri.toString());

  late final StreamSubscription<Uri?> subscription;
  subscription = appLinks.uriLinkStream.listen((Uri? uri) async {
    if (uri == null || !uri.toString().startsWith(resultUrl)) return;

    final failure = uri.queryParameters['failure'];
    final orderIdResult = uri.queryParameters['order_id'];
    final nsu = uri.queryParameters['nsu'];
    final aut = uri.queryParameters['aut'];

    print("📥 Callback recebido da InfinitePay: $uri");

    await actReturnCallback?.call(); // executa ação externa se existir

    if (failure != null) {
      print("❌ Transação falhou: $failure | Order ID: $orderIdResult");
      completer.complete(false);
    } else if (orderIdResult != null && nsu != null && aut != null) {
      print(
          "✅ Transação aprovada: order_id=$orderIdResult, nsu=$nsu, aut=$aut");
      completer.complete(true);
    } else {
      print("⚠️ Callback inesperado: parâmetros incompletos.");
      completer.complete(false);
    }

    await subscription.cancel();
  }, onError: (err) {
    print("Erro ao ouvir o callback: $err");
    completer.complete(false);
    subscription.cancel();
  });

  final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!launched) {
    print("Erro: não foi possível abrir o app InfinitePay.");
    await subscription.cancel();
    return false;
  }

  try {
    return await Future.any([
      completer.future,
      Future.delayed(const Duration(seconds: 300), () {
        throw TimeoutException(
            "⏰ Tempo excedido aguardando resposta da InfinitePay.");
      }),
    ]);
  } on TimeoutException catch (e) {
    print(e.message);
    await subscription.cancel();
    return false;
  }
}
