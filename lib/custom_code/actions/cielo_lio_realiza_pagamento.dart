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
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> cieloLioRealizaPagamento(
  String? jsonPayment,
  Future Function(dynamic value)? actCompleteTrue,
) async {
  if (jsonPayment == null || jsonPayment.isEmpty) {
    print("Erro: jsonPayment está vazio ou nulo.");
    return false;
  }

  if (!await canLaunchUrl(Uri.parse("lio://payment"))) {
    print("O app Lio NÃO está instalado.");
    return false;
  }

  final completer = Completer<bool>();
  final appLinks = AppLinks();

  final jsonBase64 = base64Encode(utf8.encode(jsonPayment));
  final url = "lio://payment?request=$jsonBase64&urlCallback=order://payment";

  late final StreamSubscription<Uri?> subscription;
  subscription = appLinks.uriLinkStream.listen((uri) {
    if (uri != null && uri.scheme == "order" && uri.host == "payment") {
      final response = uri.queryParameters["response"] ?? '';
      final responseCode = uri.queryParameters["responsecode"] ?? '';

      if (response.isNotEmpty) {
        try {
          final decoded =
              utf8.decode(base64Decode(response.replaceAll("\n", "")));

          print("Resposta decodificada: $decoded");

          final responseJson = jsonDecode(decoded);
          final responseHasError = responseJson.containsKey('code');
          final responseCode = uri.queryParameters["responsecode"] ?? '';

          final isSuccess = responseCode == "0" && !responseHasError;

          if (!isSuccess) {
            final reason = responseJson['reason'] ?? 'Motivo não informado';
            print("Pagamento falhou: $reason");
          } else {
            actCompleteTrue?.call(responseJson);
          }

          completer.complete(isSuccess);
        } catch (e) {
          print("Erro ao decodificar resposta: $e");
          completer.complete(false);
        }
      } else {
        completer.complete(false);
      }
      subscription.cancel();
    }
  }, onError: (err) {
    print("Erro no deep link: $err");
    completer.complete(false);
    subscription.cancel();
  });

  // Tenta abrir o app da Lio
  final launched = await launchUrl(Uri.parse(url));

  if (!launched) {
    print("Erro: não foi possível abrir o app da Lio.");
    return false;
  }

  try {
    // Espera resposta ou timeout rápido (5s)
    return await Future.any([
      completer.future,
      Future.delayed(Duration(seconds: 300), () {
        throw TimeoutException("Sem resposta inicial.");
      }),
    ]);
  } on TimeoutException {
    print("Timeout rápido: sem resposta inicial da Lio.");
    return false;
  }
}
