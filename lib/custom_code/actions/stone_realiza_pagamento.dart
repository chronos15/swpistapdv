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

/*import 'package:stone_payments/stone_payments.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:stone_payments/enums/type_transaction_enum.dart';
*/
Future<bool> stoneRealizaPagamento(
  double amountValue,
  TpPagamento enumTypePay,
  int parcelas,
  Future Function(String? qrBase64)?
      qrPixCallBack, // função opcional para receber o QRCode do PIX
) async {
  return true;
  /* TypeTransactionEnum? paymentType;

  debugPrint("Iniciando pagamento. Tipo: $enumTypePay");

  // Define o tipo da transação
  switch (enumTypePay) {
    case TpPagamento.CARTAO_CREDITO:
      paymentType = TypeTransactionEnum.credit;
      break;
    case TpPagamento.CARTAO_DEBITO:
      paymentType = TypeTransactionEnum.debit;
      break;
    case TpPagamento.PIX:
      paymentType = TypeTransactionEnum.pix;
      break;
    case TpPagamento.VOUCHER:
      paymentType = TypeTransactionEnum.voucher;
      break;
    default:
      debugPrint("Tipo de pagamento inválido.");
      return false;
  }

  try {
    debugPrint(
        "Realizando pagamento de R\$ $amountValue com $parcelas parcela(s).");

    final transactionResult = await StonePayments.transaction(
      value: amountValue,
      typeTransaction: paymentType,
      installment: parcelas,
      printReceipt: true,
      onPixQrCode: (base64Qr) {
        debugPrint("Recebido QRCode PIX base64.");
        if (qrPixCallBack != null) {
          qrPixCallBack(base64Qr);
        }
      },
    );

    if (transactionResult == null) {
      debugPrint("Transação retornou nula.");
      return false;
    }

    debugPrint(
        "Resultado da transação: ${transactionResult.transactionStatus}");

    final sucesso = transactionResult.transactionStatus == "APPROVED";
    debugPrint("Pagamento realizado com sucesso: $sucesso");

    return sucesso;
  } catch (e, stack) {
    debugPrint("Erro ao processar pagamento: $e");
    debugPrint("Stack Trace: $stack");
    return false;
  }*/
}
