import '/flutter_flow/flutter_flow_util.dart';
import 'lancamento_voucher_widget.dart' show LancamentoVoucherWidget;
import 'package:flutter/material.dart';

class LancamentoVoucherModel extends FlutterFlowModel<LancamentoVoucherWidget> {
  ///  Local state fields for this component.

  int? idPay = -1;

  bool dpdActive = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for edtDesconto widget.
  FocusNode? edtDescontoFocusNode;
  TextEditingController? edtDescontoTextController;
  String? Function(BuildContext, String?)? edtDescontoTextControllerValidator;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode;
  TextEditingController? emailAddressFieldTextController;
  String? Function(BuildContext, String?)?
      emailAddressFieldTextControllerValidator;
  String? _emailAddressFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o código do voucher!';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressFieldTextControllerValidator =
        _emailAddressFieldTextControllerValidator;
  }

  @override
  void dispose() {
    edtDescontoFocusNode?.dispose();
    edtDescontoTextController?.dispose();

    emailAddressFieldFocusNode?.dispose();
    emailAddressFieldTextController?.dispose();
  }
}
