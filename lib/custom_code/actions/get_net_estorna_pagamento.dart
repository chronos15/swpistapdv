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

Future<dynamic> getNetEstornaPagamento(String callerid) async {
  PaymentTypeEnum? paymentType;
  print("Cancelando pagamento ID:  ${callerid}");
  try {
    // Verificando o resultado da transação de forma mais detalhada
    final refund = await GetnetPayments.deeplink.checkStatus(
      callerId: callerid!,
    );

    if (refund == null) {
      debugPrint("Transação retornou nula.");
      return null;
    }

    // Printando a resposta da transação
    debugPrint("Resultado da transação: ${refund.result}");

    final resultado = refund.result == "0"; // Assuming "0" means success
    debugPrint("estorno realizado com sucesso: $resultado");
    //debugPrint(transaction.toJson());

    return jsonDecode(refund.toJson());
  } catch (e, stack) {
    // Tratamento de exceção aprimorado com detalhes
    debugPrint("Erro ao processar estorno: $e");
    debugPrint("Stack Trace: $stack");
    return false;
  }
}
