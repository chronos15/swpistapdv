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

import 'index.dart'; // Imports other custom actions

import 'package:getnet_payments/getnet_payments.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;

Future<dynamic> getNetRealizaPagamento(BuildContext context, double amountValue,
    TpPagamento enumTypePay, int parcelas) async {
  PaymentTypeEnum? paymentType;
  String? creditType;

  // Printando o tipo de pagamento escolhido para depuração
  debugPrint("Iniciando pagamento. Tipo: $enumTypePay");

  switch (enumTypePay) {
    case TpPagamento.CARTAO_CREDITO:
      paymentType = PaymentTypeEnum.credit;
      creditType = 'creditMerchant';
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
      creditType: creditType,
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
  } on PlatformException catch (e) {
    debugPrint("Erro de plataforma: ${e.code} - ${e.message}");

    await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
      context,
      'Erro',
      'Falha ao abrir plugin/deeplink, verifique seu terminal e tente novamente!',
      FlutterFlowTheme.of(context).primaryText,
      FlutterFlowTheme.of(context).secondaryBackground,
      350.0,
      'topcenter',
      'fromtop',
      FlutterFlowTheme.of(context).error,
      'https://upload.wikimedia.org/wikipedia/commons/3/34/ErrorMessage.png',
    );

    final jsonReturnError = {
      'result': "99",
      'error':
          'Aplicativo Getnet não encontrado. Por favor, instale o app e tente novamente.'
    };

    print(jsonReturnError);

    return jsonReturnError;
  } catch (e, stack) {
    debugPrint("Erro inesperado ao processar pagamento: $e");
    debugPrint("Stack Trace: $stack");

    return {'result': "99", 'error': 'Erro inesperado: $e'};
  }
}
