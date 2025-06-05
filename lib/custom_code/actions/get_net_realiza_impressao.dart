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
import 'package:flutter/services.dart';
import 'dart:convert';

Future getNetRealizaImpressao(
  BuildContext context,
  VendasStruct vendaDT,
) async {
  // Add your function code here!
  FocusScope.of(context).unfocus();

  final logo = await rootBundle.load('assets/images/SOFTWORK_(9).png');
  String base64 = base64Encode(logo.buffer.asUint8List());

  final currencyFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
  final dateFormat = DateFormat('dd/MM/yyyy');

  final dataVenda = DateTime.parse(vendaDT.datavenda);
  final itens = vendaDT.vendaitemRem;

  final List<ItemPrintModel> comprovante = [
    ItemPrintModel.text(
      content: FFAppState().Empresa.razaoSocial,
      align: AlignModeEnum.center,
      fontFormat: FontFormatEnum.medium,
    ),
    ItemPrintModel.text(
      content: FFAppState().Empresa.cnpj,
      align: AlignModeEnum.center,
      fontFormat: FontFormatEnum.small,
    ),
    ItemPrintModel.text(
      content: FFAppState().Empresa.endereco,
      align: AlignModeEnum.center,
      fontFormat: FontFormatEnum.small,
    ),
    ItemPrintModel.text(
      content: FFAppState().Empresa.cidade + '/' + FFAppState().Empresa.uf,
      align: AlignModeEnum.center,
      fontFormat: FontFormatEnum.small,
    ),
    //ItemPrintModel.image(content: base64, align: AlignModeEnum.center),
    ItemPrintModel.linewrap(lines: 1),
    ItemPrintModel.text(
      content: "COMPROVANTE DE PAGAMENTO",
      align: AlignModeEnum.center,
      fontFormat: FontFormatEnum.medium,
    ),
    ItemPrintModel.linewrap(lines: 1),
    ItemPrintModel.text(
        content: "Cliente: ${vendaDT.nomeCliente}",
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "CPF/CNPJ: ${vendaDT.cpfcnpj}",
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Data: ${dateFormat.format(dataVenda)}",
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Hora: ${vendaDT.hora}", fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Vendedor: ${vendaDT.usuario}",
        fontFormat: FontFormatEnum.medium),
  ];

  for (final item in itens) {
    comprovante.addAll([
      ItemPrintModel.text(
          content: "${item.nomeProduto} (${item.unidademed})",
          fontFormat: FontFormatEnum.medium),
      ItemPrintModel.text(
          content:
              "Qtd: ${item.quantidade}  Vlr Un: ${currencyFormat.format(item.valorvenda)}",
          fontFormat: FontFormatEnum.medium),
      ItemPrintModel.text(
          content:
              "Desc: ${currencyFormat.format(item.valordesc)}  Subtotal: ${currencyFormat.format(item.subtotal)}",
          fontFormat: FontFormatEnum.medium),
    ]);
  }

  comprovante.addAll([
    ItemPrintModel.text(
        content:
            "Total Produtos: ${currencyFormat.format(vendaDT.totalprodutos)}",
        align: AlignModeEnum.right,
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Desconto: ${currencyFormat.format(vendaDT.desconto)}",
        align: AlignModeEnum.right,
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Total Final: ${currencyFormat.format(vendaDT.totalvenda)}",
        align: AlignModeEnum.right,
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Forma de Pgto: x)",
        /*${vendaDT.descrtpvenda} (${vendaDT.numparcelas}*/
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.text(
        content: "Entrada: ${currencyFormat.format(vendaDT.entrada)}",
        fontFormat: FontFormatEnum.medium),
    ItemPrintModel.linewrap(lines: 2),
    ItemPrintModel.qrcode(
      content: vendaDT.chaveNfeVinc ?? 'SEM CHAVE',
      align: AlignModeEnum.center,
      height: 150,
    ),
    ItemPrintModel.text(
        content: "CHAVE NFE:", fontFormat: FontFormatEnum.small),
    ItemPrintModel.text(
        content: vendaDT.chaveNfeVinc, fontFormat: FontFormatEnum.small),
    ItemPrintModel.linewrap(lines: 2),
    ItemPrintModel.text(
      content: "Obrigado pela preferência!",
      align: AlignModeEnum.center,
    ),
    ItemPrintModel.linewrap(lines: 3),
  ]);

  await GetnetPayments.pos.print(comprovante);
}
