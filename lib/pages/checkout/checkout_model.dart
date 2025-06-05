import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/animation_status_widget.dart';
import '/components/multiplos_pagamentos_widget.dart';
import '/components/tp_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'checkout_widget.dart' show CheckoutWidget;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:expandable/expandable.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  Local state fields for this page.

  bool finishsucess = false;

  bool pgtoSucess = false;

  bool activeFormCliente = false;

  TpPagamento? enumSelected = TpPagamento.VAZIO;

  bool bWait = false;

  int? iLoopPay = 0;

  int iParcelasCount = 1;

  bool bGatWaySucessPgto = false;

  int? idVendaRem;

  int idCidadeSelected = 0;

  bool nfdisponivel = false;

  dynamic aJsonTransation;

  bool bModoPgMult = false;

  bool bExecutinNF = false;

  VendasStruct? aVendaRem;
  void updateAVendaRemStruct(Function(VendasStruct) updateFn) {
    updateFn(aVendaRem ??= VendasStruct());
  }

  int? iNovoDoc;

  int? iModoReg = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Action Block - ConfirmaVenda] action in PageView widget.
  bool? actReturnVenda;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Action Block - ProcessaMultiplosPagamento] action in ChoiceChips widget.
  bool? actReturnMPSelected;
  // Stores action output result for [Action Block - ProcessaMultiplosPagamento] action in IconButton widget.
  bool? actReturnMPPlus;
  // Stores action output result for [Custom Action - cieloLioRealizaEstorno] action in IconButton widget.
  bool? cieloEstorna;
  // Stores action output result for [Custom Action - getNetEstornaPagamento] action in IconButton widget.
  dynamic returnGetEstorno;
  // Stores action output result for [Action Block - ProcessaMultiplosPagamento] action in IconButton widget.
  bool? actReturnMPPlusdELETE;
  // Model for TpPagamento component.
  late TpPagamentoModel tpPagamentoModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in TpPagamento widget.
  int? iParcelasReturned;
  // Stores action output result for [Action Block - ProcessaVoucherVale] action in TpPagamento widget.
  PaymentDataTypeStruct? processaShelVale;
  // Stores action output result for [Action Block - ProcessaMultiplosPagamento] action in TpPagamento widget.
  bool? actReturnMPPlusVoucher;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in TpPagamento widget.
  int? iParcelasReturn;
  // Model for AnimationStatus component.
  late AnimationStatusModel animationStatusModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Action Block - VerificaStatusNFe] action in btnNFe widget.
  StatusNFDataTypeStruct? actReturnStatus;
  // Stores action output result for [Custom Action - geraComprovante] action in btnNFe widget.
  FFUploadedFile? returnComprovante;
  // Stores action output result for [Action Block - ConfirmaVenda] action in Button widget.
  bool? actReturnVendaNovamente;
  // Stores action output result for [Bottom Sheet - SelecionarCliente] action in IconButton widget.
  ClienteListaDataTypeStruct? actClienteReturn;
  // State field(s) for edtNomeCliente widget.
  FocusNode? edtNomeClienteFocusNode;
  TextEditingController? edtNomeClienteTextController;
  String? Function(BuildContext, String?)?
      edtNomeClienteTextControllerValidator;
  // Stores action output result for [Backend Call - API (ConsultaCNPJ)] action in IconButton widget.
  m_s_framework_flutter_p5iajh_api_calls_util.ApiCallResponse? apiResultj0x;
  // Stores action output result for [Backend Call - API (Clientes)] action in IconButton widget.
  ApiCallResponse? apiResultxluCliente;
  // State field(s) for edtCPFCliente widget.
  FocusNode? edtCPFClienteFocusNode;
  TextEditingController? edtCPFClienteTextController;
  String? Function(BuildContext, String?)? edtCPFClienteTextControllerValidator;
  // State field(s) for edtEndereco widget.
  FocusNode? edtEnderecoFocusNode;
  TextEditingController? edtEnderecoTextController;
  String? Function(BuildContext, String?)? edtEnderecoTextControllerValidator;
  // Stores action output result for [Bottom Sheet - SelecionarCidades] action in IconButton widget.
  CidadesDataTypeStruct? actReturnCidade;
  // State field(s) for edtCidade widget.
  FocusNode? edtCidadeFocusNode;
  TextEditingController? edtCidadeTextController;
  String? Function(BuildContext, String?)? edtCidadeTextControllerValidator;
  // State field(s) for dpdUF widget.
  String? dpdUFValue;
  FormFieldController<String>? dpdUFValueController;
  // State field(s) for edtBairro widget.
  FocusNode? edtBairroFocusNode;
  TextEditingController? edtBairroTextController;
  String? Function(BuildContext, String?)? edtBairroTextControllerValidator;
  // State field(s) for edtIBGE widget.
  FocusNode? edtIBGEFocusNode;
  TextEditingController? edtIBGETextController;
  final edtIBGEMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? edtIBGETextControllerValidator;
  // State field(s) for edtComplemento widget.
  FocusNode? edtComplementoFocusNode;
  TextEditingController? edtComplementoTextController;
  String? Function(BuildContext, String?)?
      edtComplementoTextControllerValidator;
  // State field(s) for edtCep widget.
  FocusNode? edtCepFocusNode;
  TextEditingController? edtCepTextController;
  final edtCepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? edtCepTextControllerValidator;

  @override
  void initState(BuildContext context) {
    tpPagamentoModel = createModel(context, () => TpPagamentoModel());
    animationStatusModel = createModel(context, () => AnimationStatusModel());
  }

  @override
  void dispose() {
    tpPagamentoModel.dispose();
    animationStatusModel.dispose();
    expandableExpandableController.dispose();
    edtNomeClienteFocusNode?.dispose();
    edtNomeClienteTextController?.dispose();

    edtCPFClienteFocusNode?.dispose();
    edtCPFClienteTextController?.dispose();

    edtEnderecoFocusNode?.dispose();
    edtEnderecoTextController?.dispose();

    edtCidadeFocusNode?.dispose();
    edtCidadeTextController?.dispose();

    edtBairroFocusNode?.dispose();
    edtBairroTextController?.dispose();

    edtIBGEFocusNode?.dispose();
    edtIBGETextController?.dispose();

    edtComplementoFocusNode?.dispose();
    edtComplementoTextController?.dispose();

    edtCepFocusNode?.dispose();
    edtCepTextController?.dispose();
  }

  /// Action blocks.
  Future<bool> confirmaVenda(BuildContext context) async {
    List<ListaAddAbastecimentoDataTypeStruct>? abastecimentosToRecord;
    ApiCallResponse? returnVendaAPI;

    abastecimentosToRecord = await actions.addListToDTLancmento(
      FFAppState().AbastecimentosSelecionados.toList(),
      0,
    );
    FFAppState().VendaObj = VendaDTObjStruct(
      idcliente: valueOrDefault<int>(
        FFAppState().ClienteSelected.idCodigo,
        1,
      ),
      nomecliente: valueOrDefault<String>(
        FFAppState().ClienteSelected.nome,
        'CONSUMIDOR',
      ),
      cpfcnpj: FFAppState().ClienteSelected.cpfcnpj,
      endereco: FFAppState().ClienteSelected.endereco,
      complemento: FFAppState().ClienteSelected.complemento,
      bairro: FFAppState().ClienteSelected.bairro,
      cidade: FFAppState().ClienteSelected.cidade,
      uf: FFAppState().ClienteSelected.estado,
      cep: FFAppState().ClienteSelected.cep,
      codcid: FFAppState().ClienteSelected.codCidade,
      codibge: FFAppState().ClienteSelected.codibge,
      idvendedor: FFAppState().FrentistaSelecionado.idFrentista,
      usuario: currentUserData?.usuario,
      numterminal: m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .terminal
          .toString(),
      chaveunica: functions.strToInt(
          m_s_framework_flutter_p5iajh_functions.getChaveUnica(
              m_s_framework_flutter_p5iajh_app_state.FFAppState()
                  .ConfigGlobaisServer
                  .terminal,
              valueOrDefault<int>(
                valueOrDefault<int>(
                      FFAppState().HistoricoVendas.length,
                      0,
                    ) +
                    1,
                1,
              ))),
      totalprodutos: functions.sumListDouble(
          abastecimentosToRecord.map((e) => e.total).toList().toList()),
      abastecimentos: abastecimentosToRecord,
      pagamentos: functions
          .returnDadosFromPay(FFAppState().paymmentsConfirmed.toList()),
      idvendamob: valueOrDefault<int>(
        valueOrDefault<int>(
              FFAppState().HistoricoVendas.length,
              0,
            ) +
            1,
        1,
      ),
    );
    if (abastecimentosToRecord.length >= 0) {
      returnVendaAPI = await VendaCall.call(
        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
            .ConfigGlobaisServer
            .host,
        token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
        vendajsonJson: FFAppState().VendaObj.toMap(),
      );

      if ((returnVendaAPI.succeeded ?? true)) {
        if (VendaCall.result(
          (returnVendaAPI.jsonBody ?? ''),
        )!) {
          pgtoSucess = false;
          idVendaRem = valueOrDefault<int>(
            VendaCall.idretorno(
              (returnVendaAPI.jsonBody ?? ''),
            ),
            0,
          );
          nfdisponivel = false;
          aVendaRem = VendasStruct.maybeFromMap(VendaCall.vendaRem(
            (returnVendaAPI.jsonBody ?? ''),
          ));
          iNovoDoc = VendaCall.novodoc(
            (returnVendaAPI.jsonBody ?? ''),
          );
          updateAVendaRemStruct(
            (e) => e
              ..pagamentos = FFAppState().paymmentsConfirmed.toList()
              ..abastecimentos =
                  FFAppState().AbastecimentosSelecionados.toList(),
          );
          FFAppState().addToHistoricoVendas(aVendaRem!);
          FFAppState().updateClienteSelectedStruct(
            (e) => e
              ..nome = 'CONSUMIDOR'
              ..idCodigo = 1
              ..denome = 'CONSUMIDOR'
              ..tppessoa = null
              ..cpfcnpj = null
              ..cidade = null
              ..estado = null
              ..endereco = null
              ..complemento = null
              ..cep = null
              ..codCidade = null
              ..bairro = null
              ..codibge = null,
          );
          FFAppState().AbastecimentosSelecionados = [];
          FFAppState().paymmentsConfirmed = [];
          return VendaCall.result(
            (returnVendaAPI.jsonBody ?? ''),
          )!;
        } else {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Container(
                    height: 171.0,
                    width: MediaQuery.sizeOf(context).width * 0.95,
                    child: m_s_framework_flutter_p5iajh
                        .UnViewMSFrameMessageBoxWidget(
                      sTitulo: 'Erro',
                      sText: VendaCall.error(
                        (returnVendaAPI?.jsonBody ?? ''),
                      )!,
                      colorConfirm:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      colorCancel: Color(0x00000000),
                      enableCancel: false,
                      colorTextButtonConfirm:
                          FlutterFlowTheme.of(context).primary,
                      sTextoConfirm: 'Ok',
                      actConfirm: () async {},
                      actCancel: () async {},
                    ),
                  ),
                ),
              );
            },
          );

          return false;
        }
      } else {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 171.0,
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  child: m_s_framework_flutter_p5iajh
                      .UnViewMSFrameMessageBoxWidget(
                    sTitulo: 'Erro',
                    sText:
                        'Falha ao realizar comunicação com o servidor... Verifique sua conexão e tente novamente!${(returnVendaAPI?.jsonBody ?? '').toString()}',
                    colorConfirm:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    colorCancel: Color(0x00000000),
                    enableCancel: false,
                    colorTextButtonConfirm:
                        FlutterFlowTheme.of(context).primary,
                    sTextoConfirm: 'Ok',
                    actConfirm: () async {},
                    actCancel: () async {},
                  ),
                ),
              ),
            );
          },
        );

        return false;
      }
    } else {
      return false;
    }
  }

  Future paymentCheck(
    BuildContext context, {
    required bool? bParceado,
  }) async {}

  Future<bool?> processaPagamento(
    BuildContext context, {
    required PaymentDataTypeStruct? tpPag,
    required int? iIndexUpdate,
  }) async {
    dynamic getNetPayChecked;
    bool? cieloPgto;

    pgtoSucess = valueOrDefault<bool>(
      functions.verifyAllConfirmed(
          FFAppState().paymmentsConfirmed.toList(),
          functions.sumListDouble(FFAppState()
              .AbastecimentosSelecionados
              .map((e) => e.vlrtotal)
              .toList()
              .toList())),
      false,
    );
    if (!functions.enumDefaultApp(tpPag?.tPPagEnum)!) {
      if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Getnet) {
        getNetPayChecked = await actions.getNetRealizaPagamento(
          tpPag!.valor,
          tpPag.tPPagEnum!,
          tpPag.parcelas,
        );
        if (functions.getValueJsonByCampo(getNetPayChecked, 'result') == '0') {
          FFAppState().updatePaymmentsConfirmedAtIndex(
            iIndexUpdate!,
            (e) => e
              ..tefProcessado = DadosTEFStruct(
                administradora:
                    functions.getValueJsonByCampo(getNetPayChecked, 'brand'),
                rede: 'GETNET',
                operacao: () {
                  if (tpPag.tPPagEnum == TpPagamento.CARTAO_DEBITO) {
                    return 'D';
                  } else if (tpPag.tPPagEnum == TpPagamento.CARTAO_CREDITO) {
                    return 'C';
                  } else {
                    return null;
                  }
                }(),
                nsu: m_s_framework_flutter_p5iajh_functions.stringToIntValue(
                    functions.getValueJsonByCampo(getNetPayChecked, 'nsu')),
                aut: m_s_framework_flutter_p5iajh_functions.stringToIntValue(
                    functions.getValueJsonByCampo(
                        getNetPayChecked, 'authorizationCode')),
                parc: tpPag.parcelas,
                valor: tpPag.valor,
                tpparc: 'Administradora',
                codadm: null,
                cnpjadm: functions.getValueJsonByCampo(
                    getNetPayChecked, 'ecDocument'),
                modoequip: 2,
                modoreg: iModoReg,
                numpag: functions.enumClienteToServer(tpPag.tPPagEnum),
                jsonretorno: getNetPayChecked?.toString(),
                callerid:
                    functions.getValueJsonByCampo(getNetPayChecked, 'callerId'),
              ),
          );
        }
        bGatWaySucessPgto =
            functions.getValueJsonByCampo(getNetPayChecked, 'result') == '0';
      } else {
        if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Cielo) {
          cieloPgto = await actions.cieloLioRealizaPagamento(
            functions
                .formaJsonCieloFunction(
                    'multsoftautomacaoipora@gmail.com',
                    tpPag!.parcelas,
                    FFAppState().AbastecimentosSelecionados.toList(),
                    tpPag.tPPagEnum,
                    tpPag.valor.toString())
                .toString(),
            (value) async {
              aJsonTransation = value;
            },
          );
          if (cieloPgto) {
            await Future.delayed(const Duration(milliseconds: 1000));
            FFAppState().updatePaymmentsConfirmedAtIndex(
              iIndexUpdate!,
              (e) => e
                ..tefProcessado = DadosTEFStruct(
                  administradora:
                      functions.getValueJsonByCampo(aJsonTransation, 'brand'),
                  rede: 'CIELO',
                  operacao: () {
                    if (tpPag.tPPagEnum == TpPagamento.CARTAO_DEBITO) {
                      return 'D';
                    } else if (tpPag.tPPagEnum == TpPagamento.CARTAO_CREDITO) {
                      return 'C';
                    } else {
                      return null;
                    }
                  }(),
                  nsu: m_s_framework_flutter_p5iajh_functions.stringToIntValue(
                      functions.getValueJsonByCampo(
                          aJsonTransation, 'cieloCode')),
                  aut: m_s_framework_flutter_p5iajh_functions.stringToIntValue(
                      functions.getValueJsonByCampo(
                          aJsonTransation, 'authCode')),
                  parc: tpPag.parcelas,
                  valor: tpPag.valor,
                  tpparc: 'Administradora',
                  codadm: null,
                  cnpjadm: '01.027.058/0001-91',
                  modoequip: 2,
                  modoreg: iModoReg,
                  numpag: functions.enumClienteToServer(tpPag.tPPagEnum),
                  jsonretorno: aJsonTransation?.toString(),
                  callerid:
                      functions.getValueJsonByCampo(aJsonTransation, 'id'),
                ),
            );
          }
          bGatWaySucessPgto = cieloPgto;
        } else {
          await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
            context,
            'Falha',
            'Nenhum Gateway de pagamento identificado...',
            FlutterFlowTheme.of(context).primaryText,
            FlutterFlowTheme.of(context).secondaryBackground,
            350.0,
            'bottomcenter',
            'frombottom',
          );
          bGatWaySucessPgto = false;
        }
      }

      if (bGatWaySucessPgto) {
        pgtoSucess = bGatWaySucessPgto;
        if (bModoPgMult) {
          pgtoSucess = valueOrDefault<bool>(
            functions.verifyAllConfirmed(
                FFAppState().paymmentsConfirmed.toList(),
                functions.sumListDouble(FFAppState()
                    .AbastecimentosSelecionados
                    .map((e) => e.vlrtotal)
                    .toList()
                    .toList())),
            false,
          );
        }
        return true;
      } else {
        if (bModoPgMult) {
          pgtoSucess = valueOrDefault<bool>(
            functions.verifyAllConfirmed(
                FFAppState().paymmentsConfirmed.toList(),
                functions.sumListDouble(FFAppState()
                    .AbastecimentosSelecionados
                    .map((e) => e.vlrtotal)
                    .toList()
                    .toList())),
            false,
          );
        }
        return false;
      }
    } else {
      pgtoSucess = true;
      FFAppState().updatePaymmentsConfirmedAtIndex(
        iIndexUpdate!,
        (e) => e
          ..tefProcessado = DadosTEFStruct(
            valor: tpPag?.valor,
            modoreg: bModoPgMult ? 1 : 0,
            parc: tpPag?.parcelas,
            numpag: functions.enumClienteToServer(tpPag?.tPPagEnum),
          ),
      );
      return true;
    }
  }

  Future<bool?> processaMultiplosPagamento(BuildContext context) async {
    List<PaymentDataTypeStruct>? actListReturnBlockMP;

    if (!bModoPgMult) {
      enumSelected = TpPagamento.VAZIO;
      FFAppState().paymmentsConfirmed = [];
    }
    pgtoSucess = false;
    bModoPgMult = choiceChipsValue == 'Multiplos Pagamentos';
    iModoReg = 1;
    if (bModoPgMult) {
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 1.0,
                width: MediaQuery.sizeOf(context).width * 0.95,
                child: MultiplosPagamentosWidget(
                  valueTotal: functions.sumListDouble(FFAppState()
                      .AbastecimentosSelecionados
                      .map((e) => e.vlrtotal)
                      .toList()
                      .toList())!,
                  aListRegistrados: FFAppState()
                      .paymmentsConfirmed
                      .where((e) => e.bModoReg != 0)
                      .toList(),
                ),
              ),
            ),
          );
        },
      ).then((value) => actListReturnBlockMP = value);

      if ((actListReturnBlockMP != null &&
              (actListReturnBlockMP)!.isNotEmpty) ||
          (FFAppState().paymmentsConfirmed.isNotEmpty)) {
        enumSelected = TpPagamento.VAZIO;
        if (actListReturnBlockMP != null &&
            (actListReturnBlockMP)!.isNotEmpty) {
          FFAppState().paymmentsConfirmed =
              actListReturnBlockMP!.toList().cast<PaymentDataTypeStruct>();
          return false;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      enumSelected = TpPagamento.VAZIO;
      FFAppState().paymmentsConfirmed = [];
      return true;
    }
  }

  Future<StatusNFDataTypeStruct?> verificaStatusNFe(
      BuildContext context) async {
    dynamic returnStatus;

    returnStatus = await actions.buscaStatusNFe(
      m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .host,
      idVendaRem,
      m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    );
    return StatusNFDataTypeStruct.maybeFromMap(returnStatus);
  }

  Future loopMultiplosPagamentos(BuildContext context) async {
    bool? pgSucessMP;

    for (int loop1Index = 0;
        loop1Index < FFAppState().paymmentsConfirmed.length;
        loop1Index++) {
      final currentLoop1Item = FFAppState().paymmentsConfirmed[loop1Index];
      if (!FFAppState()
          .paymmentsConfirmed
          .elementAtOrNull(iLoopPay!)!
          .confirmado) {
        pgSucessMP = await processaPagamento(
          context,
          tpPag: FFAppState().paymmentsConfirmed.elementAtOrNull(iLoopPay!),
          iIndexUpdate: iLoopPay,
        );
        FFAppState().updatePaymmentsConfirmedAtIndex(
          iLoopPay!,
          (e) => e..confirmado = pgSucessMP,
        );
      }
      iLoopPay = iLoopPay! + 1;
      pgtoSucess = valueOrDefault<bool>(
        functions.verifyAllConfirmed(
            FFAppState().paymmentsConfirmed.toList(),
            valueOrDefault<double>(
              functions.sumListDouble(FFAppState()
                  .AbastecimentosSelecionados
                  .map((e) => e.vlrtotal)
                  .toList()
                  .toList()),
              0.0,
            )),
        false,
      );
    }
    pgtoSucess = valueOrDefault<bool>(
      functions.verifyAllConfirmed(
          FFAppState().paymmentsConfirmed.toList(),
          functions.sumListDouble(FFAppState()
              .AbastecimentosSelecionados
              .map((e) => e.vlrtotal)
              .toList()
              .toList())),
      false,
    );
  }

  Future realizaImpressaoNF(BuildContext context) async {
    FFUploadedFile? actReturnNFeUpload;
    bool? returnNFe;

    actReturnNFeUpload =
        await m_s_framework_flutter_p5iajh_actions.bodyImgApiToUploaded(
      '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/entities/VENDANFE(${idVendaRem?.toString()})/IMAGEM_NFE',
      m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    );
    if ((actReturnNFeUpload.bytes?.isNotEmpty ?? false)) {
      if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Cielo) {
        unawaited(
          () async {
            returnNFe = await actions.cieloLioRealizaImpressaoImage(
              context,
              actReturnNFeUpload,
            );
          }(),
        );
        return;
      } else {
        unawaited(
          () async {
            await actions.getNetRealizaImpressaoImage(
              context,
              actReturnNFeUpload,
            );
          }(),
        );
        return;
      }
    } else {
      await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
        context,
        'Falha',
        'Não foi possível identificar a NF-e, verifique sua conexão ou tente novamente!',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondaryBackground,
        350.0,
        'bottomcenter',
        'frombottom',
      );
      return;
    }
  }

  Future realizaImpressaoNFBase(
    BuildContext context, {
    required String? base64Value,
  }) async {
    if (base64Value != null && base64Value != '') {
      if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Cielo) {
        await actions.cieloLioRealizaImpressaoBase64(
          context,
          base64Value,
        );
        return;
      } else {
        await actions.getNetRealizaImpressaoBase64(
          context,
          base64Value,
        );
        return;
      }
    } else {
      await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
        context,
        'Falha',
        'Não foi possível identificar a NF-e, verifique sua conexão ou tente novamente!',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondaryBackground,
        350.0,
        'bottomcenter',
        'frombottom',
      );
      return;
    }
  }
}
