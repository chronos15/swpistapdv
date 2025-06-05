import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/parcelamento_widget.dart';
import '/components/tp_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'multiplos_pagamentos_widget.dart' show MultiplosPagamentosWidget;
import 'package:flutter/material.dart';

class MultiplosPagamentosModel
    extends FlutterFlowModel<MultiplosPagamentosWidget> {
  ///  Local state fields for this component.

  List<PaymentDataTypeStruct> paymentDt = [];
  void addToPaymentDt(PaymentDataTypeStruct item) => paymentDt.add(item);
  void removeFromPaymentDt(PaymentDataTypeStruct item) =>
      paymentDt.remove(item);
  void removeAtIndexFromPaymentDt(int index) => paymentDt.removeAt(index);
  void insertAtIndexInPaymentDt(int index, PaymentDataTypeStruct item) =>
      paymentDt.insert(index, item);
  void updatePaymentDtAtIndex(
          int index, Function(PaymentDataTypeStruct) updateFn) =>
      paymentDt[index] = updateFn(paymentDt[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - cieloLioRealizaEstorno] action in IconButton widget.
  bool? cieloEstorna;
  // Stores action output result for [Custom Action - getNetEstornaPagamento] action in IconButton widget.
  dynamic returnGetEstorno;
  // Model for TpPagamento component.
  late TpPagamentoModel tpPagamentoModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in TpPagamento widget.
  DTRetornoValorStruct? actReturnValor;

  @override
  void initState(BuildContext context) {
    tpPagamentoModel = createModel(context, () => TpPagamentoModel());
  }

  @override
  void dispose() {
    tpPagamentoModel.dispose();
  }

  /// Action blocks.
  Future<bool?> processaMultiplosPagamentos(
    BuildContext context, {
    required TpPagamento? payEnum,
    required double? vValor,
    double? vOutro,
    String? sDoc,
  }) async {
    int? iParcelasReturnMP;

    if ((functions
                .pesquisaCondPagFromTipo(
                    FFAppState().CondPagamentoList.toList(),
                    functions.iTipoEnumPag(payEnum))!
                .numeroPar >
            1) &&
        (payEnum != TpPagamento.CARTAO_DEBITO)) {
      await actions.hideKeyboard(
        context,
      );
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.95,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: ParcelamentoWidget(
                condPagDt: functions.pesquisaCondPagFromTipo(
                    FFAppState().CondPagamentoList.toList(),
                    functions.iTipoEnumPag(payEnum))!,
                valorTotal: vValor!,
              ),
            ),
          );
        },
      ).then((value) => iParcelasReturnMP = value);

      if (iParcelasReturnMP! >= 1) {
        addToPaymentDt(PaymentDataTypeStruct(
          valor: vValor,
          tPPagEnum: payEnum,
          parcelas: iParcelasReturnMP,
          bModoReg: 1,
          troco: valueOrDefault<double>(
            vOutro,
            0.0,
          ),
        ));
        return false;
      } else {
        return false;
      }
    } else {
      addToPaymentDt(PaymentDataTypeStruct(
        valor: vValor,
        tPPagEnum: payEnum,
        parcelas: 1,
        bModoReg: 1,
        troco: vOutro,
      ));
      return false;
    }
  }
}
