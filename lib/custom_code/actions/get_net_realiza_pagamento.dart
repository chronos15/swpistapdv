// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

import 'package:getnet_payments/getnet_payments.dart';
import 'package:uuid/uuid.dart';

import 'dart:async';

Completer<void> _paymentCompleter = Completer<void>();

Future<void> getNetRealizaPagamento(double amountValue, int idTypePay) async {
  if (_paymentCompleter.isCompleted) {
    debugPrint("Pagamento já em andamento. Ignorando chamada duplicada.");
    return;
  }

  _paymentCompleter = Completer<void>();

  PaymentTypeEnum paymentType;

  switch (idTypePay) {
    case 1:
      paymentType = PaymentTypeEnum.credit;
      break;
    case 2:
      paymentType = PaymentTypeEnum.debit;
      break;
    case 3:
      paymentType = PaymentTypeEnum.voucher;
      break;
    case 4:
      paymentType = PaymentTypeEnum.pix;
      break;
    default:
      print("Tipo de pagamento inválido.");
      return;
  }

  try {
    final transaction = await GetnetPayments.deeplink.payment(
      amount: amountValue,
      paymentType: PaymentTypeEnum.credit,
      callerId: Uuid().v4(),
      installments: 1,
    );

    if (transaction != null && transaction.result == "0") {
      debugPrint("Pagamento realizado com sucesso!");
    } else {
      debugPrint("Pagamento cancelado ou falhou.");
    }
  } catch (e) {
    debugPrint("Erro ao processar pagamento: $e");
  } finally {
    _paymentCompleter.complete();
  }
}
