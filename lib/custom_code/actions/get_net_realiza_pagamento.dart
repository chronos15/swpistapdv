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

import 'package:getnet_payments/getnet_payments.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';

Future<dynamic> getNetRealizaPagamento(
    double amountValue, TpPagamento enumTypePay, int parcelas) async {
  PaymentTypeEnum? paymentType;

  // Printando o tipo de pagamento escolhido para depuração
  debugPrint("Iniciando pagamento. Tipo: $enumTypePay");

  switch (enumTypePay) {
    case TpPagamento.CARTAO_CREDITO:
      paymentType = PaymentTypeEnum.credit;
      break;
    case TpPagamento.CARTAO_DEBITO:
      paymentType = PaymentTypeEnum.debit;
      break;
    case TpPagamento.PIX:
      paymentType = PaymentTypeEnum.pix;
      break;
    case TpPagamento.VOUCHER:
      paymentType = PaymentTypeEnum.voucher;
      break;
    default:
      debugPrint("Tipo de pagamento inválido.");
      return null;
  }

  try {
    debugPrint(
        "Realizando pagamento de $amountValue com o tipo $paymentType e $parcelas parcelas.");

    // Verificando o resultado da transação de forma mais detalhada
    final transaction = await GetnetPayments.deeplink.payment(
      amount: amountValue,
      paymentType: paymentType,
      callerId: Uuid().v4(),
      installments: parcelas,
    );

    if (transaction == null) {
      debugPrint("Transação retornou nula.");
      return null;
    }

    // Printando a resposta da transação
    debugPrint("Resultado da transação: ${transaction.result}");

    final resultado = transaction.result == "0"; // Assuming "0" means success
    debugPrint("Pagamento realizado com sucesso: $resultado");
    //debugPrint(transaction.toJson());

    return jsonDecode(transaction.toJson());
  } catch (e, stack) {
    // Tratamento de exceção aprimorado com detalhes
    debugPrint("Erro ao processar pagamento: $e");
    debugPrint("Stack Trace: $stack");

    // Aqui você pode salvar o erro em um arquivo, enviar para um servidor de log, etc.

    return false;
  }
}
