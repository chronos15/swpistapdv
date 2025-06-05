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

import 'dart:async';
import 'dart:convert';
import 'package:app_links/app_links.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> cieloLioRealizaImpressao(VendasStruct? vendaDT) async {
  try {
    final dataVenda =
        DateTime.parse(vendaDT?.datavenda ?? DateTime.now().toString());
    final horaVenda = vendaDT?.hora ?? '';
    final itens = vendaDT?.vendaitemRem ?? [];

    final List<String> linhas = [];

    // CABEÇALHO
    linhas.addAll([
      "******** ${FFAppState().Empresa.nomeFantasia} ********\n",
      "CNPJ: ${FFAppState().Empresa.cnpj}\n",
      "Cidade/UF: ${FFAppState().Empresa.cidade} - ${FFAppState().Empresa.uf}\n",
      "Endereço: ${FFAppState().Empresa.endereco}\n",
      "------------------------------\n",
      "      COMPROVANTE DE VENDA      \n",
      "${dataVenda.day.toString().padLeft(2, '0')}/${dataVenda.month.toString().padLeft(2, '0')}/${dataVenda.year}  $horaVenda\n",
      "Cliente: ${vendaDT?.nomeCliente ?? ''}\n",
      "CPF/CNPJ: ${vendaDT?.cpfcnpj ?? ''}\n",
      "Vendedor: ${vendaDT?.usuario ?? ''}\n",
      "Venda: #${vendaDT?.idVendaMob ?? ''}\n",
      "------------------------------\n",
    ]);

    // ITENS
    linhas.add("QTD  PRODUTO          TOTAL\n");
    for (final item in itens) {
      final nome = (item.nomeProduto ?? '').padRight(16).substring(0, 16);
      final qtd = item.quantidade.toString().padLeft(2, ' ');
      final totalItem =
          (item.subtotal ?? 0).toStringAsFixed(2).replaceAll('.', ',');
      linhas.add("$qtd  $nome  R\$${totalItem.padLeft(6, ' ')}\n");
    }

    linhas.add("------------------------------\n");

    // RESUMO
    final totalProdutos =
        vendaDT?.totalprodutos?.toStringAsFixed(2).replaceAll('.', ',') ??
            '0,00';
    final desconto =
        vendaDT?.desconto?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00';
    final entrada =
        vendaDT?.entrada?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00';
    final totalVenda =
        vendaDT?.totalvenda?.toStringAsFixed(2).replaceAll('.', ',') ?? '0,00';

    linhas.add("Subtotal........... R\$ $totalProdutos\n");
    linhas.add("Desconto........... R\$ $desconto\n");
    linhas.add("Entrada............ R\$ $entrada\n");
    linhas.add("TOTAL.............. R\$ $totalVenda\n");
    linhas.add("------------------------------\n");

    // PAGAMENTO
    linhas.add("Forma de Pgto: '}\n"); /*${vendaDT?.descrtpvenda ?? '*/
    if (vendaDT?.numparcelas != null && vendaDT!.numparcelas > 1) {
      linhas.add("Parcelado em: ${vendaDT.numparcelas}x\n");
    }
    linhas.add("------------------------------\n");

    // RODAPÉ
    linhas.add("Obrigado pela preferência!\n");
    linhas.add("SOFTWORK Pista PDV\n\n");

    // MONTA JSON PARA IMPRESSÃO
    final Map<String, dynamic> printRequest = {
      "operation": "PRINT_TEXT",
      "styles": [{}],
      "value": [linhas.join()]
    };

    print(printRequest);

    final jsonRequest = jsonEncode(printRequest);
    final jsonBase64 = base64Encode(utf8.encode(jsonRequest));
    final url = "lio://print?request=$jsonBase64&urlCallback=order://response";

    final appLinks = AppLinks();

    if (!await canLaunchUrl(Uri.parse("lio://print"))) {
      print("O app Lio NÃO está instalado.");
      return false;
    }

    final completer = Completer<bool>();
    late final StreamSubscription<Uri?> subscription;

    subscription = appLinks.uriLinkStream.listen((uri) {
      if (uri != null && uri.scheme == "order" && uri.host == "response") {
        final status = uri.queryParameters["status"] ?? '';
        completer.complete(status.toLowerCase() == "success");
        subscription.cancel();
      }
    }, onError: (err) {
      print("Erro no deep link: $err");
      completer.complete(false);
      subscription.cancel();
    });

    await launchUrl(Uri.parse(url));

    return completer.future.timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        print("Timeout aguardando resposta da impressão.");
        return false;
      },
    );
  } catch (e) {
    print("Erro ao converter ou imprimir: $e");
    return false;
  }
}
