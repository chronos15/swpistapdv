import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/lancamento_voucher_widget.dart';
import '/components/vale_combustivel_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
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
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

Future<bool?> lancamentoDiversos(
  BuildContext context, {
  String? listaDiversos,
}) async {
  ApiCallResponse? apiResultAdd;

  apiResultAdd = await AddListaAbastecimentoCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    listaAbastecimentoJson:
        FFAppState().ListaLancamentoDiversos.map((e) => e.toMap()).toList(),
  );

  if ((apiResultAdd.succeeded ?? true)) {
    if (AddListaAbastecimentoCall.resultCall(
      (apiResultAdd.jsonBody ?? ''),
    )!) {
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
              height: 171.0,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                sTitulo: 'Sucesso',
                sText: 'Produto(s) registrado com sucesso à lista de diversos!',
                colorConfirm: FlutterFlowTheme.of(context).primary,
                colorCancel: Color(0x00000000),
                enableCancel: false,
                sTextoConfirm: 'Ok',
                colorTextButtonConfirm: FlutterFlowTheme.of(context).info,
                actConfirm: () async {
                  context.pushNamed(TelaInicialWidget.routeName);
                },
                actCancel: () async {},
              ),
            ),
          );
        },
      );

      FFAppState().ListaLancamentoDiversos = [];
      FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
    } else {
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
              height: 171.0,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                sTitulo: 'Falha',
                sText:
                    'Falha ao enviar a lista de abastecimentos. Verifique seus registros ou tente novamente!',
                colorConfirm: FlutterFlowTheme.of(context).secondaryBackground,
                colorCancel: Color(0x00000000),
                enableCancel: false,
                sTextoConfirm: 'Ok',
                colorTextButtonConfirm: FlutterFlowTheme.of(context).error,
                actConfirm: () async {},
                actCancel: () async {},
              ),
            ),
          );
        },
      );

      await actions.loggerRegister(
        (apiResultAdd.jsonBody ?? '').toString(),
        getCurrentRoute(context),
        4,
      );
      return false;
    }

    return true;
  } else {
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
            height: 171.0,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
              sTitulo: 'Falha',
              sText:
                  'Falha ao enviar a lista de abastecimentos. Verifique seus registros ou tente novamente!',
              colorConfirm: FlutterFlowTheme.of(context).secondaryBackground,
              colorCancel: Color(0x00000000),
              enableCancel: false,
              sTextoConfirm: 'Ok',
              colorTextButtonConfirm: FlutterFlowTheme.of(context).error,
              actConfirm: () async {},
              actCancel: () async {},
            ),
          ),
        );
      },
    );

    await actions.loggerRegister(
      (apiResultAdd.jsonBody ?? '').toString(),
      getCurrentRoute(context),
      4,
    );
    return false;
  }
}

Future<bool?> buscaCartaoID(
  BuildContext context, {
  String? sIDCartao,
}) async {
  ApiCallResponse? actReturnApiCall;

  if (sIDCartao != null && sIDCartao != '') {
    actReturnApiCall = await FrentistasCall.call(
      ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .host,
      token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      filtro: '\$filter=(PASSWORD eq \'${sIDCartao}\')',
    );

    if ((actReturnApiCall.succeeded ?? true)) {
      if (FrentistasCall.idfrentista(
                (actReturnApiCall.jsonBody ?? ''),
              ) !=
              null &&
          (FrentistasCall.idfrentista(
            (actReturnApiCall.jsonBody ?? ''),
          ))!
              .isNotEmpty) {
        FFAppState().FrentistaSelecionado = FrentistasCall.frentistas(
          (actReturnApiCall.jsonBody ?? ''),
        )!
            .firstOrNull!;
        return true;
      } else {
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
                height: 180.0,
                width: 320.0,
                child:
                    m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                  sTitulo: 'Atenção',
                  sText:
                      'Frentista não encontrado, verifique a senha do frentista informado e tente novamente!',
                  colorConfirm: FlutterFlowTheme.of(context).error,
                  colorCancel: Color(0x00000000),
                  enableCancel: false,
                  actConfirm: () async {},
                  actCancel: () async {},
                ),
              ),
            );
          },
        );

        return false;
      }
    } else {
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
              height: 180.0,
              width: 320.0,
              child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                sTitulo: 'Atenção',
                sText: 'Falha ao buscar frentista, verifique sua conexão!',
                colorConfirm: FlutterFlowTheme.of(context).error,
                colorCancel: Color(0x00000000),
                enableCancel: false,
                actConfirm: () async {},
                actCancel: () async {},
              ),
            ),
          );
        },
      );
    }
  } else {
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
            height: 180.0,
            width: 320.0,
            child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
              sTitulo: 'Atenção',
              sText: 'Senha do frentista não informada!',
              colorConfirm: FlutterFlowTheme.of(context).error,
              colorCancel: Color(0x00000000),
              enableCancel: false,
              actConfirm: () async {},
              actCancel: () async {},
            ),
          ),
        );
      },
    );

    return false;
  }

  return null;
}

Future<bool?> lancamentoAbastecimento(
  BuildContext context, {
  int? idVenda,
}) async {
  List<ListaAddAbastecimentoDataTypeStruct>? actResultList;
  ApiCallResponse? apiResultAdd;

  actResultList = await actions.addListToDTLancmento(
    FFAppState().AbastecimentosSelecionados.toList(),
    idVenda,
  );
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('teste'),
        content: Text((actResultList!.firstOrNull!.toMap()).toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
  apiResultAdd = await AddListaAbastecimentoCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    listaAbastecimentoJson: actResultList.map((e) => e.toMap()).toList(),
  );

  if ((apiResultAdd.succeeded ?? true) &&
      AddListaAbastecimentoCall.resultCall(
        (apiResultAdd.jsonBody ?? ''),
      )!) {
    FFAppState().ListaLancamentoDiversos = [];
    FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
    return true;
  } else {
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Falha'),
          content: Text(
              'Falha ao enviar a lista de abastecimentos. Verifique seus registros ou tente novamente!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
    return false;
  }
}

Future<bool?> buscaCondPagamento(BuildContext context) async {
  ApiCallResponse? apiResultCondPagamento;

  apiResultCondPagamento = await CondPagamentosCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
  );

  if ((apiResultCondPagamento.succeeded ?? true)) {
    if (CondPagamentosCall.value(
          (apiResultCondPagamento.jsonBody ?? ''),
        )!
            .length >=
        1) {
      FFAppState().CondPagamentoList = CondPagamentosCall.value(
        (apiResultCondPagamento.jsonBody ?? ''),
      )!
          .toList()
          .cast<CondPagamentoDataTypeStruct>();
      FFAppState().update(() {});
      return true;
    } else {
      await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
        context,
        'Atenção',
        'Recurso [Condição de pagamento] vazio, verifique seus registros!',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondaryBackground,
        350.0,
        'bottomcenter',
        'frombottom',
      );
      return false;
    }
  } else {
    await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
      context,
      'Atenção',
      'Falha ao realizar consulta de condições de pagamento!',
      FlutterFlowTheme.of(context).primaryText,
      FlutterFlowTheme.of(context).secondaryBackground,
      350.0,
      'bottomcenter',
      'frombottom',
    );
    return false;
  }
}

Future<bool?> buscaEmpresaConfig(BuildContext context) async {
  ApiCallResponse? apiResultCofig;
  ApiCallResponse? apiResultEmpresa;
  String? actSofthouseInfo;
  String? logoBase64;

  apiResultCofig = await ConfiguracaoCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
  );

  apiResultEmpresa = await EmpresaCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
  );

  if ((apiResultEmpresa.succeeded ?? true) &&
      (apiResultCofig.succeeded ?? true)) {
    FFAppState().Empresa = EmpresaCall.empresa(
      (apiResultEmpresa.jsonBody ?? ''),
    )!;
    FFAppState().ConfigRemota = ConfiguracaoCall.configuracao(
      (apiResultCofig.jsonBody ?? ''),
    )!
        .firstOrNull!;
    actSofthouseInfo = await actions.bodyTextToString(
      '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/entities/EMPRESAVIEW(1)/SOFTHOUSE',
      m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    );
    logoBase64 = await actions.bodyToBase64(
      '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/entities/EMPRESAVIEW(1)/LOGO',
      m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    );
    FFAppState().updateEmpresaStruct(
      (e) => e
        ..sSOFTHOUSE = actSofthouseInfo
        ..logo = logoBase64,
    );
    return true;
  } else {
    await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
      context,
      'Falha',
      'Erro ao realizar conexão com recursos!',
      FlutterFlowTheme.of(context).primaryText,
      FlutterFlowTheme.of(context).secondaryBackground,
      350.0,
      'bottomcenter',
      'frombottom',
    );
    return false;
  }
}

Future<String?> verificaStatusNFe(
  BuildContext context, {
  int? idVendaRem,
}) async {
  return null;
}

Future verificaVersao(BuildContext context) async {
  String? actVersaoInfo;

  actVersaoInfo = await m_s_framework_flutter_p5iajh_actions.getVersionOnly(
    true,
  );
  FFAppState().updateConfigLocaisStruct(
    (e) => e..versaoClienteAtual = actVersaoInfo,
  );
  if ((functions.strToInt(actVersaoInfo) >
          functions.strToInt(FFAppState().ConfigLocais.versaoMax)) ||
      (functions.strToInt(actVersaoInfo) <
          functions.strToInt(FFAppState().ConfigLocais.versaoMin))) {
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
          child: Container(
            height: 171.0,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
              sTitulo: 'Atenção',
              sText: functions.strToInt(actVersaoInfo) <
                      functions.strToInt(FFAppState().ConfigLocais.versaoMin)
                  ? 'Versão do Aplicativo incompatível com servidor. Favor, contate o suporte!!!'
                  : 'Versão do Servidor incompatível com o aplicativo. Favor, contate o suporte!!!',
              colorConfirm: FlutterFlowTheme.of(context).secondaryBackground,
              colorCancel: Color(0x00000000),
              enableCancel: false,
              colorTextButtonConfirm: FlutterFlowTheme.of(context).error,
              sTextoConfirm: 'Ok',
              actConfirm: () async {},
              actCancel: () async {},
            ),
          ),
        );
      },
    );

    return;
  } else {
    if ((functions.strToInt(actVersaoInfo) >
            functions.strToInt(FFAppState().ConfigLocais.versaoMin)) ||
        (functions.strToInt(actVersaoInfo) <
            functions.strToInt(FFAppState().ConfigLocais.versaoMax))) {
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
            child: Container(
              height: 171.0,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                sTitulo: 'Atenção',
                sText:
                    'Existe uma nova versão do aplicativo disponível!!! Faça a atualização assim que possível.',
                colorConfirm: FlutterFlowTheme.of(context).secondaryBackground,
                colorCancel: Color(0x00000000),
                enableCancel: false,
                colorTextButtonConfirm: FlutterFlowTheme.of(context).primary,
                sTextoConfirm: 'Ok',
                actConfirm: () async {},
                actCancel: () async {},
              ),
            ),
          );
        },
      );

      return;
    } else {
      return;
    }
  }
}

Future<bool> verificaTerminal(BuildContext context) async {
  dynamic actReturn;
  ApiCallResponse? apiResult323;

  actReturn = await m_s_framework_flutter_p5iajh_actions.getDeviceName();
  apiResult323 = await VerificaTerminalCall.call(
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
    token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
    id: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .terminal,
    dispositivo: m_s_framework_flutter_p5iajh_functions.truncaString(
        20, functions.decodeJsonTerminal(actReturn?.toString(), true)),
    serial: m_s_framework_flutter_p5iajh_functions.truncaString(
        8, functions.decodeJsonTerminal(actReturn?.toString(), false)),
  );

  if ((apiResult323.succeeded ?? true)) {
    if (VerificaTerminalCall.result(
      (apiResult323.jsonBody ?? ''),
    )!) {
      return true;
    }

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
          child: Container(
            height: 171.0,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
              sTitulo: 'Atenção',
              sText: VerificaTerminalCall.message(
                (apiResult323?.jsonBody ?? ''),
              )!,
              colorConfirm: FlutterFlowTheme.of(context).secondaryBackground,
              colorCancel: Color(0x00000000),
              enableCancel: false,
              colorTextButtonConfirm: FlutterFlowTheme.of(context).primary,
              sTextoConfirm: 'Ok',
              actConfirm: () async {},
              actCancel: () async {},
            ),
          ),
        );
      },
    );

    context.pushNamed(
      ConfiguracaoWidget.routeName,
      queryParameters: {
        'adminPass': serializeParam(
          false,
          ParamType.bool,
        ),
      }.withoutNulls,
    );

    return false;
  } else {
    return false;
  }
}

Future iniciaPersistencia(BuildContext context) async {
  bool? actBlockServer;
  m_s_framework_flutter_p5iajh_api_calls_util.ApiCallResponse? getTokenAct;
  bool? actReturnTerminal;

  actBlockServer =
      await m_s_framework_flutter_p5iajh_actions.testConnectionServer();
  getTokenAct = await m_s_framework_flutter_p5iajh_api_calls_util
      .ServerConnectionGroup.getTokenCall
      .call(
    path: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .path,
    cnpj: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .cnpj,
    ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
        .ConfigGlobaisServer
        .host,
  );

  if ((getTokenAct.succeeded ?? true)) {
    m_s_framework_flutter_p5iajh_app_state.FFAppState().Token =
        m_s_framework_flutter_p5iajh_api_calls_util
            .ServerConnectionGroup.getTokenCall
            .token(
              (getTokenAct.jsonBody ?? ''),
            )
            .toString();
    FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
    FFAppState().AbastecimentosSelecionados = [];
    FFAppState().ClienteSelected =
        ClienteListaDataTypeStruct.fromSerializableMap(jsonDecode(
            '{\"ID_CODIGO\":\"1\",\"NOME\":\"CONSUMIDOR\",\"DENOME\":\"CONSUMIDOR\"}'));
    FFAppState().updateConfigLocaisStruct(
      (e) => e
        ..versaoServer = m_s_framework_flutter_p5iajh_api_calls_util
            .ServerConnectionGroup.getTokenCall
            .buildServer(
              (getTokenAct?.jsonBody ?? ''),
            )
            .toString()
        ..versaoMin = m_s_framework_flutter_p5iajh_api_calls_util
            .ServerConnectionGroup.getTokenCall
            .buildMin(
              (getTokenAct?.jsonBody ?? ''),
            )
            .toString()
        ..versaoMax = m_s_framework_flutter_p5iajh_api_calls_util
            .ServerConnectionGroup.getTokenCall
            .buildMax(
              (getTokenAct?.jsonBody ?? ''),
            )
            .toString(),
    );
    actReturnTerminal = await action_blocks.verificaTerminal(context);
    await action_blocks.verificaVersao(context);
  } else {
    unawaited(
      () async {
        await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
          context,
          'Falha',
          'Não foi possível conectar ao servidor da aplicação!!!',
          FlutterFlowTheme.of(context).primaryText,
          FlutterFlowTheme.of(context).secondaryBackground,
          350.0,
          'bottomcenter',
          'frombottom',
        );
      }(),
    );
    await Future.delayed(const Duration(milliseconds: 3000));
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed(LoginWidget.routeName);
  }
}

Future buscaVale(
  BuildContext context, {
  required int? idcodigo,
}) async {
  ApiCallResponse? returnBuscaVale;
  String? returnComprovante;

  if (idcodigo! >= 1) {
    returnBuscaVale = await ValeCombustivelCall.call(
      ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .host,
      token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      pesquisa: '?\$filter=ID_REQUISICAO eq ${idcodigo.toString()}',
      demmand: 1,
      skip: 0,
      orderby: 'ID_REQUISICAO DESC',
    );

    if ((returnBuscaVale.succeeded ?? true)) {
      if (ValeCombustivelCall.value(
            (returnBuscaVale.jsonBody ?? ''),
          )!
              .length >=
          1) {
        returnComprovante = await actions.geraValeBase64(
          context,
          ValeCombustivelCall.value(
            (returnBuscaVale.jsonBody ?? ''),
          )?.firstOrNull,
          FFAppState().HistoricoVendas.lastOrNull?.nomeCliente,
          functions
              .allFrentistas(FFAppState()
                  .HistoricoVendas
                  .lastOrNull
                  ?.abastecimentos
                  .toList())
              ?.firstOrNull,
        );
        if (FFAppState().ConfigLocais.gatewayPgto == GateWay.Cielo) {
          await actions.cieloLioRealizaImpressaoBase64(
            context,
            returnComprovante,
          );
        } else {
          await actions.getNetRealizaImpressaoBase64(
            context,
            returnComprovante,
          );
        }
      } else {
        await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
          context,
          'Atenção',
          'Não foi encontrado voucher com esse ID informado!',
          FlutterFlowTheme.of(context).primaryText,
          FlutterFlowTheme.of(context).secondaryBackground,
          350.0,
          'bottomcenter',
          'frombottom',
          Color(0xFFFFAC00),
          'https://cdn-icons-png.flaticon.com/512/595/595067.png',
        );
        return;
      }
    } else {
      await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
        context,
        'Atenção',
        'Falha ao realizar comunicação com o servidor!',
        FlutterFlowTheme.of(context).primaryText,
        FlutterFlowTheme.of(context).secondaryBackground,
        350.0,
        'bottomcenter',
        'frombottom',
        FlutterFlowTheme.of(context).error,
        'https://cdn-icons-png.flaticon.com/512/595/595067.png',
      );
      return;
    }
  } else {
    await m_s_framework_flutter_p5iajh_actions.elegantNotificationCustom(
      context,
      'Atenção',
      'Informe um número válido de vale combustível para prosseguir!',
      FlutterFlowTheme.of(context).primaryText,
      FlutterFlowTheme.of(context).secondaryBackground,
      350.0,
      'bottomcenter',
      'frombottom',
      Color(0xFFFF9F04),
      'https://cdn-icons-png.flaticon.com/512/595/595067.png',
    );
    return;
  }
}

Future<PaymentDataTypeStruct?> processaVoucherVale(
  BuildContext context, {
  required TpPagamento? tpPag,
  required double? valorTotal,
}) async {
  ValueVoucherValeStruct? actReturnVoucherApp;
  List<ValeCombustivelDataTypeStruct>? actReturnVale;

  if (tpPag == TpPagamento.VOUCHER) {
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
            height: MediaQuery.sizeOf(context).height * 1.0,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: LancamentoVoucherWidget(
              totalPay: valorTotal!,
              totalAbastecimento: functions.sumListDouble(FFAppState()
                  .AbastecimentosSelecionados
                  .where((e) => e.idBico > 0)
                  .toList()
                  .map((e) => e.vlrtotal)
                  .toList()
                  .toList())!,
            ),
          ),
        );
      },
    ).then((value) => actReturnVoucherApp = value);

    if (actReturnVoucherApp != null) {
      FFAppState().addToPaymmentsConfirmed(PaymentDataTypeStruct(
        tefProcessado: DadosTEFStruct(
          valor: actReturnVoucherApp?.payTp == TpPagamento.VAZIO
              ? valorTotal
              : actReturnVoucherApp?.desconto,
          modoreg: 2,
          parc: 0,
          numpag: functions.enumClienteToServer(tpPag),
          jsonretorno: actReturnVoucherApp?.value,
          desconto: actReturnVoucherApp?.desconto,
          voucherpg: actReturnVoucherApp?.idPagReturn,
        ),
        valor: actReturnVoucherApp?.payTp == TpPagamento.VAZIO
            ? valorTotal
            : actReturnVoucherApp?.desconto,
        tPPagEnum: tpPag,
        parcelas: 0,
        confirmado: true,
        bModoReg: 2,
        troco: 0.0,
      ));
      FFAppState().update(() {});
      return FFAppState().paymmentsConfirmed.lastOrNull;
    } else {
      return null;
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
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            width: MediaQuery.sizeOf(context).width * 0.95,
            child: ValeCombustivelWidget(
              iIDCliente: valueOrDefault<int>(
                FFAppState().ClienteSelected.idCodigo,
                1,
              ),
              totalCompra: valorTotal!,
            ),
          ),
        );
      },
    ).then((value) => actReturnVale = value);

    if (actReturnVale != null && (actReturnVale)!.isNotEmpty) {
      FFAppState().addToPaymmentsConfirmed(PaymentDataTypeStruct(
        tefProcessado: DadosTEFStruct(
          valor: functions.sumListDouble(
              actReturnVale?.map((e) => e.totalreq).toList().toList()),
          modoreg: 2,
          parc: 0,
          numpag: functions.enumClienteToServer(tpPag),
          desconto: 0.0,
          valesprocessados: actReturnVale,
          voucherpg: functions.sumListDouble(actReturnVale
                      ?.map((e) => e.totalreq)
                      .toList()
                      .toList())! <
                  valorTotal!
              ? 0
              : 1,
        ),
        valor: functions.sumListDouble(
            actReturnVale?.map((e) => e.totalreq).toList().toList()),
        tPPagEnum: tpPag,
        parcelas: 0,
        confirmado: true,
        bModoReg: 2,
        troco: 0.0,
      ));
      FFAppState().update(() {});
      return FFAppState().paymmentsConfirmed.lastOrNull;
    } else {
      return null;
    }
  }
}
