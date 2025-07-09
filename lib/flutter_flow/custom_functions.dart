import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';
import "package:m_s_framework_flutter_p5iajh/backend/schema/structs/index.dart"
    as m_s_framework_flutter_p5iajh_data_schema;
import "package:m_s_framework_flutter_p5iajh/backend/schema/enums/enums.dart"
    as m_s_framework_flutter_p5iajh_enums;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;

String? realFormatSCifrao(
  bool? cifrao,
  String? valor,
) {
  if (valor == null) {
    return '0,00';
  }
  //

  // Substituindo a vírgula pelo ponto para formatar corretamente
  String valorComPonto = valor.replaceAll(',', '.');

  // Convertendo a string para um valor numérico (double)
  double valorNumerico = double.tryParse(valorComPonto) ?? 0.0;

  // Define o símbolo apenas se `cifrao` for verdadeiro
  final formatCurrency = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: cifrao == true ? 'R\$' : '',
  );

  return formatCurrency.format(valorNumerico);
}

dynamic formaJsonCieloEstorno(
  String id,
  String cieloCode,
  String authCode,
  String? valorTotal,
) {
  int converterParaCentavos(String valor) {
    return (double.parse(valor.replaceAll(',', '.')) * 100).toInt();
  }

  Map<String, dynamic> jsonMap = {
    "id": id,
    "accessToken": "Bcb9eteF3gC0CwXHBH3aLRwa0UNWFyk7WwD3BFwKupjFigKtx6",
    "clientID":
        "x3C98RDtZzZSIlVIBAMUQfYNmWoKZxDbiAtXJYlgkxmow8MxgU / n7kctwQ7t1ngSOGDXqHzKiaNGHCLQIrxa2w6zLCn6XCiyKEkX1",
    "cieloCode": cieloCode,
    "authCode": authCode,
    "value": valorTotal != null ? converterParaCentavos(valorTotal) : 0
  };
  return const JsonEncoder.withIndent("  ").convert(jsonMap);
}

double? sumListDoubleQtd(List<double>? cartItemsTotal) {
  final formatter = NumberFormat("#,##0.000", "pt_BR");

  double _total = cartItemsTotal!
      .fold(0.0, (double total, double subtotal) => subtotal + total);

  _total = double.parse(_total.toStringAsFixed(3));

  return _total;
}

bool? verifyAllValues(
  List<PaymentDataTypeStruct>? listDTPay,
  double? valorTotal,
) {
  if (listDTPay == null || valorTotal == null) return false;

  final totalPago = listDTPay.fold<double>(
    0.0,
    (sum, item) => sum + (item.valor ?? 0),
  );

  final todosConfirmados = listDTPay.every((item) => item.confirmado == true);

  // Permite se o total pago for igual ou superior (com tolerância de ponto flutuante)
  final pagamentoSuficiente = (totalPago - valorTotal) >= -0.01;

  print((totalPago - valorTotal).toString());

  return pagamentoSuficiente;
}

bool? enumDefaultApp(TpPagamento? enumTp) {
  final allowedTypes = {
    TpPagamento.DINHEIRO,
    TpPagamento.CREDIARIO,
    TpPagamento.VOUCHER,
    TpPagamento.VALECOMBUSTIVEL,
  };

  return (enumTp != null && allowedTypes.contains(enumTp));
}

int? iTipoEnumPagCopy(TpPagamento? enumPag) {
  switch (enumPag) {
    case TpPagamento.CARTAO_CREDITO:
      return 5;
    case TpPagamento.CARTAO_DEBITO:
      return 5;
    case TpPagamento.DINHEIRO:
      return 1;
    case TpPagamento.PIX:
      return 3;
    case TpPagamento.VOUCHER:
      return 13;
    case TpPagamento.CREDIARIO:
      return 4;
    case TpPagamento.CHEQUE:
      return 2;
    case TpPagamento.VALECOMBUSTIVEL:
      return 10;
    default:
      return null;
  }
}

CondPagamentoDataTypeStruct? pesquisaCondPagFromTipo(
  List<CondPagamentoDataTypeStruct>? listaCondPag,
  int? tpPag,
) {
  if (listaCondPag == null || tpPag == null) return null;

  try {
    return listaCondPag.firstWhere(
      (condPag) => condPag.tipoPagamento == tpPag.toString(),
    );
  } catch (e) {
    return null;
  }
}

String? pesquisaProdutos(
  String? valuePesquisa,
  int? valueGrupo,
) {
  List<String> filters = [];

  if (valuePesquisa != null && valuePesquisa.trim().isNotEmpty) {
    final isNumeric = int.tryParse(valuePesquisa) != null;

    List<String> searchFilters = [];

    if (isNumeric && valuePesquisa.length > 6) {
      searchFilters.add("contains(CODIGOGTIN, '$valuePesquisa')");
    }

    if (isNumeric && valuePesquisa.length < 6) {
      searchFilters.add("(ID_CODIGO eq '$valuePesquisa')");
    }

    if (!isNumeric) {
      searchFilters.add("contains(NOMPRO, '$valuePesquisa')");
    }

    filters.add("(${searchFilters.join(' or ')})");

    if (valueGrupo != null && valueGrupo > 0) {
      filters.add("(CODGRU eq '$valueGrupo')");
    }
  } else {
    if (valueGrupo != null && valueGrupo > 0) {
      filters.add("(CODGRU eq '$valueGrupo')");
    } else {
      return null;
    }
  }

  print(filters.isNotEmpty ? "\$filter=${filters.join(' and ')}" : null);
  return filters.isNotEmpty ? "\$filter=${filters.join(' and ')}" : null;
}

bool? enumParcelado(
  TpPagamento? enumTp,
  int? iParc,
) {
  final allowedTypes = {
    TpPagamento.CREDIARIO,
    TpPagamento.CARTAO_CREDITO,
  };

  return (enumTp != null && allowedTypes.contains(enumTp)) &&
      (iParc != null && iParc > 1);
}

List<GrupoDataTypeStruct>? addTodosOnGrupos(
    List<GrupoDataTypeStruct>? valuesDt) {
  // add um combustivel todos no inicio
  if (valuesDt == null) {
    return null;
  }

  valuesDt.insert(
      0,
      GrupoDataTypeStruct(
          idCodigo: 0,
          descricao: 'TODOS',
          datacadastro: '',
          idCategoria: 0,
          qtdProd: 0));

  return valuesDt;
}

String? addFilterClientes(
  int? cidade,
  String? tpPessoa,
  String? valueTextSearch,
) {
  List<String> filters = [];

  if (valueTextSearch != null && valueTextSearch.isNotEmpty) {
    final isNumeric = int.tryParse(valueTextSearch) != null;
    final cleanText = valueTextSearch.replaceAll(RegExp(r'[^\d]'), '');
    final hasMask = valueTextSearch.contains(RegExp(r'[.\-\/]'));

    if (cidade != null && cidade != 0) {
      filters.add("(COD_CIDADE eq '$cidade')");
    }

    List<String> searchFilters = [];

    // Retorno imediato se for código certeiro (número com até 6 dígitos)
    if (isNumeric && valueTextSearch.length <= 6) {
      filters.add("(ID_CODIGO eq '$valueTextSearch')");

      if (cidade != null && cidade != 0) {
        filters.add("(COD_CIDADE eq '$cidade')");
      }

      if (tpPessoa != null && tpPessoa.isNotEmpty) {
        filters.add("(TPPESSOA eq '$tpPessoa')");
      }

      return "\$filter= ${filters.join(' and ')}";
    }

    // Nome
    if (!isNumeric && !hasMask) {
      searchFilters.add("contains(NOME, '$valueTextSearch')");
    }

    // CPF/CNPJ
    if (hasMask) {
      searchFilters.add("contains(CPFCNPJ, '$valueTextSearch')");
    } else {
      if (cleanText.length == 11) {
        final maskedCPF =
            '${cleanText.substring(0, 3)}.${cleanText.substring(3, 6)}.${cleanText.substring(6, 9)}-${cleanText.substring(9, 11)}';
        searchFilters.add("contains(CPFCNPJ, '$maskedCPF')");
      } else if (cleanText.length == 14) {
        final maskedCNPJ =
            '${cleanText.substring(0, 2)}.${cleanText.substring(2, 5)}.${cleanText.substring(5, 8)}/${cleanText.substring(8, 12)}-${cleanText.substring(12, 14)}';
        searchFilters.add("contains(CPFCNPJ, '$maskedCNPJ')");
      }
    }

    // Junta tudo com OR
    filters.add("(${searchFilters.join(' or ')})");
  } else {
    if (cidade != null && cidade != 0) {
      filters.add("(COD_CIDADE eq '$cidade')");
    }
  }

  if (tpPessoa != null && tpPessoa.isNotEmpty) {
    filters.add("(TPPESSOA eq '$tpPessoa')");
  }

  print(filters.isNotEmpty ? "\$filter= ${filters.join(' and ')}" : null);
  return filters.isNotEmpty ? "\$filter= ${filters.join(' and ')}" : null;
}

List<CidadesDataTypeStruct>? pesquisaCidades(
  List<CidadesDataTypeStruct>? listCidades,
  String? valuePesquisa,
  String? filtro,
) {
  if (listCidades == null || valuePesquisa == null || valuePesquisa.isEmpty) {
    return listCidades;
  }

  return listCidades.where((cidades) {
    switch (filtro) {
      case 'CÓDIGO':
        return cidades.idCodigo.toString().contains(valuePesquisa);
      case 'NOME':
        return cidades.nome.toLowerCase().contains(valuePesquisa.toLowerCase());
      case 'CEP':
        return cidades.cep.toString().contains(valuePesquisa);
      case 'UF':
        return cidades.uf.toLowerCase().contains(valuePesquisa.toLowerCase());
      case 'CÓD. IBGE':
        return cidades.codmunibge.toString().contains(valuePesquisa);
      case 'TODOS':
      default:
        return cidades.nome
                .toLowerCase()
                .contains(valuePesquisa.toLowerCase()) ||
            cidades.cep.toString().contains(valuePesquisa) ||
            cidades.uf.toLowerCase().contains(valuePesquisa.toLowerCase()) ||
            cidades.idCodigo.toString().contains(valuePesquisa) ||
            cidades.codmunibge.toString().contains(valuePesquisa);
    }
  }).toList();
}

String? sDescEnumPagServer(TpPagamento? enumPag) {
  switch (enumPag) {
    case TpPagamento.CARTAO_CREDITO:
      return 'CARTAO';
    case TpPagamento.CARTAO_DEBITO:
      return 'CARTAO';
    case TpPagamento.DINHEIRO:
      return 'DINHEIRO';
    case TpPagamento.PIX:
      return 'PIX';
    case TpPagamento.VOUCHER:
      return 'VOUCHER';
    case TpPagamento.CREDIARIO:
      return 'CREDIARIO';
    case TpPagamento.CHEQUE:
      return 'CHEQUE';
    case TpPagamento.VALECOMBUSTIVEL:
      return 'VALE COMBUSTÍVEL';
    default:
      return null;
  }
}

double? sumListDouble(List<double>? cartItemsTotal) {
  final formatter = new NumberFormat("#,##0.00", "pt_BR");
  double _total = cartItemsTotal!
      .fold(0.0, (double total, double subtotal) => subtotal + total);
  _total = double.parse(_total.toStringAsFixed(2));
  return _total;
}

List<FrentistasDataTypeStruct>? pesquisaFrentista(
  List<FrentistasDataTypeStruct>? listFrentistas,
  String? valuePesquisa,
) {
  if (listFrentistas == null ||
      valuePesquisa == null ||
      valuePesquisa.isEmpty) {
    return listFrentistas;
  }

  return listFrentistas
      .where((frentista) =>
          frentista.nomeFrentista
              .toLowerCase()
              .contains(valuePesquisa.toLowerCase()) ||
          frentista.idFrentista.toString().contains(valuePesquisa))
      .toList();
}

List<String>? addOnList(List<String>? values) {
  if (values == null) return [];

  return ['TODOS', ...values];
}

DateTime? dataHoraJsonToDate(String? dateValue) {
  if (dateValue == null || dateValue.isEmpty) return null;

  return DateTime.tryParse(dateValue);
}

CombustiveisDataTypeStruct? filterCombustiveisDTByID(
  int? idProduto,
  List<CombustiveisDataTypeStruct>? listData,
) {
  // Verificar se os parâmetros são nulos ou inválidos
  if (idProduto == null || listData == null || listData.isEmpty) {
    return CombustiveisDataTypeStruct(); // Retorne uma instância padrão válida
  }

  // Buscar o primeiro item que corresponde ao nome
  return listData.firstWhere(
    (combustivel) => combustivel.idProduto == idProduto,
    orElse: () =>
        CombustiveisDataTypeStruct(), // Caso não encontre, retorna um objeto padrão
  );
}

String? addFilterAbastecimento(
  int? idfrentista,
  DateTimeRange? dataStamp,
  int? produtoSelected,
  int? bicoSelected,
  int? idCombustivel,
) {
  List<String> filters = [];

  if (idfrentista != null && idfrentista != 0) {
    filters.add("(ID_FRENTISTA eq '$idfrentista')");
  }

  // Se dataStamp for null, usa a data atual
  DateTime hoje = DateTime.now();
  String dataInicio =
      (dataStamp?.start ?? hoje).toIso8601String().split('T')[0];
  String dataFim = (dataStamp?.end ?? hoje).toIso8601String().split('T')[0];

  filters.add("(DATA ge '$dataInicio' and DATA le '$dataFim')");

  if (produtoSelected != null && produtoSelected != 0) {
    filters.add("(ID_PRODUTO eq '$produtoSelected')");
  }

  if (bicoSelected != null && bicoSelected != 0) {
    filters.add("(ID_BICO eq '$bicoSelected')");
  }

  if (idCombustivel != null) {
    switch (idCombustivel) {
      case 1:
        filters.add("(ID_COMBUST ne '0')");
        break;
      case 0:
        filters.add("(ID_COMBUST eq '$idCombustivel')");
        break;
    }
  }

  print(filters.isNotEmpty ? "\$filter= ${filters.join(' and ')}" : null);

  return filters.isNotEmpty ? "\$filter= ${filters.join(' and ')}" : null;
}

CombustiveisDataTypeStruct? filterCombustiveisDT(
  String? valueNome,
  List<CombustiveisDataTypeStruct>? listData,
) {
  // Verificar se os parâmetros são nulos ou inválidos
  if (valueNome == null || listData == null || listData.isEmpty) {
    return CombustiveisDataTypeStruct(); // Retorne uma instância padrão válida
  }

  // Buscar o primeiro item que corresponde ao nome
  return listData.firstWhere(
    (combustivel) => combustivel.nome == valueNome,
    orElse: () =>
        CombustiveisDataTypeStruct(), // Caso não encontre, retorna um objeto padrão
  );
}

Color? corCombustivel(String? sRefCombustivel) {
  if (sRefCombustivel == null) return null;

  switch (sRefCombustivel) {
    case '1':
      return const Color(0xFF000AE3EF); // Gasolina Comum
    case '2':
      return const Color(0xFF002694F8); // Gasolina Aditivada
    case '3':
      return const Color(0xFF00408000); // Etanol
    case '4':
      return const Color(0xFF001B0CB9); // Diesel Comum
    case '5':
      return const Color(0xFF00006200); // Biodiesel
    case '6':
      return const Color(0xFFA85400); // Diesel Aditivado
    default:
      return Colors.grey; // Cor padrão caso não encontre a referência
  }
}

DateTimeRange? dataTimeToTimeStamp(
  DateTime? dateInitial,
  DateTime? dateFinal,
) {
  DateTime now = DateTime.now();
  return DateTimeRange(
    start: dateInitial ?? now,
    end: dateFinal ?? now,
  );
}

Color? transcColor(String? sColor) {
  if (sColor == null || !RegExp(r'^\$00[0-9A-Fa-f]{6}$').hasMatch(sColor)) {
    return Colors
        .transparent; // Retorna transparente caso a string seja inválida
  }

  // Remove o prefixo "$00" e converte a string hex para um inteiro
  int rgb = int.parse(sColor.substring(3), radix: 16);

  // Retorna um Color no formato ARGB (Flutter usa Alpha no início)
  return Color(0xFF000000 | rgb);
}

List<VendaitemStruct> listAbastToItensDT(
  List<ListaAbastecimentoDataTypeStruct> dTAbastecimentos,
  int iDVenda,
  int iDCliente,
  String sUsuario,
  int idVendedor,
) {
  if (dTAbastecimentos.isEmpty) return [];

  return dTAbastecimentos.map((abastecimento) {
    return VendaitemStruct(
      //idKey: abastecimento.codAbastecimento,
      idCliente: iDCliente, // Definir conforme necessário
      idProduto: abastecimento.bAsProduct
          ? abastecimento.produtoDT.idCodigo
          : abastecimento.idProduto,
      nomeProduto: abastecimento.bAsProduct
          ? abastecimento.produtoDT.nompro
          : abastecimento.combustivel,
      idVendedor: idVendedor,
      numref:
          abastecimento.bAsProduct ? abastecimento.produtoDT.codigogtin : null,
      //numRef: abastecimento.idAbastecimento.toString(),
      //estoqueAtual: 8000, // Definir conforme necessário
      quantidade: abastecimento.quantidade,
      qtdTroca: null,
      valorvenda: abastecimento.precoUnit,
      valorvendido: abastecimento.vlrtotal,
      subtotal: abastecimento.vlrtotal,
      unidademed: abastecimento.bAsProduct
          ? abastecimento.produtoDT.und
          : abastecimento.unidade,
      percdesc: 0,
      datavenda: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      usuario: sUsuario,
      valordesc: 0,
      mobile: "S",
    );
  }).toList();
}

List<CombustiveisDataTypeStruct>? addTodosOnCombustiveis(
    List<CombustiveisDataTypeStruct>? valuesDt) {
  // add um combustivel todos no inicio
  if (valuesDt == null) {
    return null;
  }

  valuesDt.insert(
      0,
      CombustiveisDataTypeStruct(
          idProduto: 0,
          nome: 'TODOS',
          cor: '\$000064ED',
          cortexto: '\$00FFFFFF'));

  return valuesDt;
}

DateTime? stringToDateYMD(String? value) {
  // string to date yyyy-MM-dd
  if (value == null) {
    return null;
  }

  try {
    return DateFormat('yyyy-MM-dd').parse(value);
  } catch (e) {
    return null;
  }
}

bool? verifyProductInList(
  ProdutoDataTypeStruct? productValue,
  List<ListaAbastecimentoDataTypeStruct>? listValues,
) {
  if (productValue == null || listValues == null || listValues.isEmpty) {
    return false;
  }

  for (var item in listValues) {
    if (item.produtoDT == productValue) {
      return true;
    }
  }

  return false;
}

TPRegistro? enumStringTPToEnum(String? valueName) {
  // Remove espaços do valueName
  final cleanedValue = valueName?.replaceAll(' ', '');

  // enum name string to enum
  return deserializeEnum<TPRegistro>(cleanedValue);
}

dynamic formaJsonCieloFunction(
  String emailCliente,
  int parcelas,
  List<ListaAbastecimentoDataTypeStruct>? itemsList,
  TpPagamento? formaPagamento,
  String? valorTotal,
) {
  int converterParaCentavos(String valor) {
    return (double.parse(valor.replaceAll(',', '.')) * 100).toInt();
  }

  String mapFormaPagamentoInterno(TpPagamento? formaPagamento) {
    switch (formaPagamento) {
      case TpPagamento.CARTAO_CREDITO:
        return parcelas > 1 ? "CREDITO_PARCELADO_LOJA" : "CREDITO_AVISTA";
      case TpPagamento.CARTAO_DEBITO:
        return "DEBITO_AVISTA";
      case TpPagamento.VOUCHER:
        return "VOUCHER_ALIMENTACAO";
      case TpPagamento.PIX:
        return "PIX";
      case TpPagamento.DINHEIRO:
        return "CREDITO_AVISTA";
      default:
        return "DEBITO_AVISTA";
    }
  }

  Map<String, dynamic> jsonMap = {
    "accessToken": "Bcb9eteF3gC0CwXHBH3aLRwa0UNWFyk7WwD3BFwKupjFigKtx6",
    "clientID":
        "x3C98RDtZzZSIlVIBAMUQfYNmWoKZxDbiAtXJYlgkxmow8MxgU / n7kctwQ7t1ngSOGDXqHzKiaNGHCLQIrxa2w6zLCn6XCiyKEkX1",
    "reference": "",
    "merchantCode": "",
    "email": emailCliente,
    "installments": parcelas,
    "items": itemsList
            ?.map((item) => {
                  "name": item.combustivel,
                  "quantity": item.quantidade.truncate(),
                  "sku": item.idProduto.toString(),
                  "unitOfMeasure": item.unidade,
                  "unitPrice": converterParaCentavos(item.precoUnit.toString()),
                })
            .toList() ??
        [],
    "paymentCode": mapFormaPagamentoInterno(formaPagamento), // ✅ Correção aqui
    "value":
        valorTotal != null ? converterParaCentavos(valorTotal).toString() : "0"
  };
  return const JsonEncoder.withIndent("  ").convert(jsonMap);
}

List<dynamic>? geraParcelas(
  String? valorTotal,
  int? quantParcelas,
) {
  if (valorTotal == null || quantParcelas == null || quantParcelas <= 0) {
    return null;
  }

  double total = double.tryParse(valorTotal.replaceAll(',', '.')) ?? 0.0;
  if (total <= 0) {
    return null;
  }

  List<Map<String, dynamic>> opcoesParcelamento = [];

  for (int numParcelas = 1; numParcelas <= quantParcelas; numParcelas++) {
    double valorParcela = total / numParcelas;
    double valorArredondado = double.parse(valorParcela.toStringAsFixed(2));
    double valorTotalArredondado =
        double.parse((valorArredondado * numParcelas).toStringAsFixed(2));
    double diferenca =
        double.parse((total - valorTotalArredondado).toStringAsFixed(2));

    double valorFinal = valorArredondado;
    if (diferenca != 0) {
      valorFinal += (diferenca / numParcelas);
      valorFinal = double.parse(valorFinal.toStringAsFixed(2));
    }

    opcoesParcelamento.add({
      "parcela": numParcelas, // int
      "valor": valorFinal.toStringAsFixed(2), // string com duas casas
    });
  }

  return opcoesParcelamento;
}

double? stringToDouble(String? valueString) {
  try {
    if (valueString != null && valueString.isNotEmpty) {
      // Remove o símbolo da moeda e espaços extras
      String sanitizedValue = valueString.replaceAll(RegExp(r'[R$\s]'), '');

      if (sanitizedValue.contains(',')) {
        // Formato brasileiro: remove pontos e substitui vírgula por ponto
        String normalizedValue =
            sanitizedValue.replaceAll('.', '').replaceAll(',', '.');
        return double.parse(normalizedValue);
      } else if (sanitizedValue.contains('.')) {
        // Formato padrão: ponto como separador decimal
        return double.parse(sanitizedValue);
      } else {
        // Número inteiro sem separador
        return double.parse(sanitizedValue);
      }
    }
  } catch (e) {
    print('Error parsing value string to double: $e');
  }
  return null;
}

CondPagamentoDataTypeStruct? returnFromTPPag(
  TpPagamento enumTPPag,
  List<CondPagamentoDataTypeStruct>? listCondPag,
) {
  if (listCondPag == null || listCondPag.isEmpty) {
    // Retorna um default válido
    return CondPagamentoDataTypeStruct();
  }

  final Map<TpPagamento, int> mapTPPagToID = {
    TpPagamento.CARTAO_CREDITO: 5,
    TpPagamento.CARTAO_DEBITO: 5,
    TpPagamento.DINHEIRO: 1,
    TpPagamento.PIX: 3,
    TpPagamento.VOUCHER: 13,
    TpPagamento.CREDIARIO: 4,
    TpPagamento.CHEQUE: 2,
    TpPagamento.VALECOMBUSTIVEL: 10,
  };

  final int? idPagamento = mapTPPagToID[enumTPPag];
  if (idPagamento == null) {
    return CondPagamentoDataTypeStruct();
  }

  // Aqui usamos orElse com um fallback válido
  return listCondPag.firstWhere(
    (cond) => cond.tipoPagamento.toString() == idPagamento.toString(),
    orElse: () => CondPagamentoDataTypeStruct(),
  );
}

String? edtTextToCurrency(
  String? valueString,
  bool? asCifrao,
) {
  String numericValue = (valueString ?? '').replaceAll(RegExp(r'\D'), '');

  double value = double.tryParse(numericValue) ?? 0.0;

  final bool showCifrao = asCifrao ?? true;

  String formattedValue = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: showCifrao ? 'R\$' : '',
  ).format(value / 100);

  return formattedValue.trim();
}

bool? verifyAllConfirmed(
  List<PaymentDataTypeStruct>? listDTPay,
  double? valorTotal,
) {
  if (listDTPay == null || valorTotal == null) return false;

  final totalPago = listDTPay.fold<double>(
    0.0,
    (sum, item) => sum + (item.valor ?? 0),
  );

  final todosConfirmados = listDTPay.every((item) => item.confirmado == true);

  // Tolerância para ponto flutuante
  final valoresIguais = (totalPago - valorTotal) >= -0.01;

  return valoresIguais && todosConfirmados;
}

int? iTipoEnumPag(TpPagamento? enumPag) {
  switch (enumPag) {
    case TpPagamento.CARTAO_CREDITO:
      return 5;
    case TpPagamento.CARTAO_DEBITO:
      return 5;
    case TpPagamento.DINHEIRO:
      return 1;
    case TpPagamento.PIX:
      return 3;
    case TpPagamento.VOUCHER:
      return 13;
    case TpPagamento.CREDIARIO:
      return 4;
    case TpPagamento.CHEQUE:
      return 2;
    case TpPagamento.VALECOMBUSTIVEL:
      return 10;
    default:
      return null;
  }
}

double? validaIndicador(double? value) {
  if (value == null || value.isNaN || value.isInfinite) return 0;
  if (value > 1.0) return 1.0;
  if (value < 0.0) return 0;
  return value;
}

String? sDescEnumPag(TpPagamento? enumPag) {
  switch (enumPag) {
    case TpPagamento.CARTAO_CREDITO:
      return 'Cartão de Crédito';
    case TpPagamento.CARTAO_DEBITO:
      return 'Cartão de Débito';
    case TpPagamento.DINHEIRO:
      return 'Dinheiro';
    case TpPagamento.PIX:
      return 'Pix';
    case TpPagamento.VOUCHER:
      return 'Voucher';
    case TpPagamento.CREDIARIO:
      return 'Crediário';
    case TpPagamento.CHEQUE:
      return 'Cheque';
    case TpPagamento.VALECOMBUSTIVEL:
      return 'Vale Combustível';
    default:
      return null;
  }
}

String jsonValueToString(String? value) {
  // json Value To String
  if (value == null) {
    return '';
  }
  return jsonEncode(value);
}

String? getValueJsonByCampo(
  dynamic valueJson,
  String? sCampo,
) {
  if (sCampo == null || sCampo.isEmpty) {
    return '';
  }

  // Tenta decodificar se vier como string JSON
  if (valueJson is String) {
    try {
      valueJson = jsonDecode(valueJson);
    } catch (e) {
      return '';
    }
  }

  List<String> campos = sCampo.split('.');
  dynamic temp = valueJson;

  // Primeiro tenta o caminho exato
  for (var campo in campos) {
    if (temp is Map<String, dynamic> && temp.containsKey(campo)) {
      temp = temp[campo];
    } else {
      // Se falhar, faz busca profunda
      return _searchRecursively(valueJson, campos);
    }
  }

  return temp?.toString() ?? '';
}

// Função auxiliar dentro do mesmo escopo
String _searchRecursively(dynamic json, List<String> campos, [int index = 0]) {
  if (index >= campos.length) return json?.toString() ?? '';

  if (json is Map<String, dynamic>) {
    for (var entry in json.entries) {
      if (entry.key == campos[index]) {
        final result = _searchRecursively(entry.value, campos, index + 1);
        if (result.isNotEmpty) return result;
      } else {
        final result = _searchRecursively(entry.value, campos, index);
        if (result.isNotEmpty) return result;
      }
    }
  } else if (json is List) {
    for (var item in json) {
      final result = _searchRecursively(item, campos, index);
      if (result.isNotEmpty) return result;
    }
  }

  return '';
}

String? adicionaMPValues(
  String? valueDefault,
  String? adm,
  String? rede,
  String? op,
  String? nsu,
  String? aut,
  String? parc,
  String? valor,
  String? doc,
  String? tpParc,
  String? codadm,
  String? cnpjadm,
) {
  final value = '<ADM:${adm ?? ""}>'
      '<REDE:${rede ?? ""}>'
      '<OP:${op ?? ""}>'
      '<NSU:${nsu ?? ""}>'
      '<AUT:${aut ?? ""}>'
      '<PARC:${parc ?? ""}>'
      '<VALOR:${valor ?? ""}>'
      '<DOC:${doc ?? ""}>'
      '<TP_PARC:${tpParc ?? ""}>'
      '<CODADM:${codadm ?? ""}>'
      '<CNPJADM:${cnpjadm ?? ""}>';

  final hasExisting = (valueDefault != null && valueDefault.isNotEmpty);
  final AValueAdd = (valueDefault ?? '') + (hasExisting ? '\n' : '') + value;

  print(AValueAdd);
  return AValueAdd;
}

int strToInt(String? input) {
  if (input == null) return 0;

  // Remove tudo que não for dígito
  final digitsOnly = input.replaceAll(RegExp(r'[^0-9]'), '');

  // Retorna 0 se não sobrou nada
  if (digitsOnly.isEmpty) return 0;

  return int.tryParse(digitsOnly) ?? 0;
}

List<String>? uFList() {
  return [
    'AC', // Acre
    'AL', // Alagoas
    'AP', // Amapá
    'AM', // Amazonas
    'BA', // Bahia
    'CE', // Ceará
    'DF', // Distrito Federal
    'ES', // Espírito Santo
    'GO', // Goiás
    'MA', // Maranhão
    'MT', // Mato Grosso
    'MS', // Mato Grosso do Sul
    'MG', // Minas Gerais
    'PA', // Pará
    'PB', // Paraíba
    'PR', // Paraná
    'PE', // Pernambuco
    'PI', // Piauí
    'RJ', // Rio de Janeiro
    'RN', // Rio Grande do Norte
    'RS', // Rio Grande do Sul
    'RO', // Rondônia
    'RR', // Roraima
    'SC', // Santa Catarina
    'SP', // São Paulo
    'SE', // Sergipe
    'TO', // Tocantins
  ];
}

String? decodeJsonTerminal(
  String? jsonString,
  bool? bName,
) {
  if (jsonString == null) return null;

  Map<String, dynamic> json = jsonDecode(jsonString);

  return bName == true ? json['name'] : json['serial'];
}

double? centavoToDouble(int? value) {
  if (value == null) return 0.0;
  return value / 100;
}

List<VendasStruct>? filtraVendaHistorico(
  List<VendasStruct>? dtVendas,
  String? sPesquisa,
  DateTime? dateInicial,
  DateTime? dateFinal,
) {
  if (dtVendas == null) {
    return null;
  }

  var listaFiltrada = dtVendas;

  // Filtrar por pesquisa (nomeCliente ou idVendaRem)
  if (sPesquisa != null && sPesquisa.isNotEmpty) {
    listaFiltrada = listaFiltrada
        .where((vendas) =>
            vendas.nomeCliente
                .toLowerCase()
                .contains(sPesquisa.toLowerCase()) ||
            vendas.idCodigo.toString().contains(sPesquisa))
        .toList();
  }

  // Filtrar por data inicial e data final
  if (dateInicial != null || dateFinal != null) {
    listaFiltrada = listaFiltrada.where((vendas) {
      final dataVenda = stringToDateYMD(vendas.datavenda);

      if (dataVenda == null) {
        return false; // Se não tem data, não entra no filtro
      }

      final bool afterInicial = dateInicial == null ||
          dataVenda.isAfter(dateInicial.subtract(const Duration(seconds: 1)));
      final bool beforeFinal = dateFinal == null ||
          dataVenda.isBefore(dateFinal.add(const Duration(seconds: 1)));

      return afterInicial && beforeFinal;
    }).toList();
  }

  return listaFiltrada;
}

List<TpPagamento>? returnTpPagDisables(List<String>? sChaveDecrypt) {
  if (sChaveDecrypt == null || sChaveDecrypt.length < 14) return [];

  List<TpPagamento> listDisable = [];

  if (sChaveDecrypt[10] == '0') listDisable.add(TpPagamento.CREDIARIO);
  if (sChaveDecrypt[11] == '0') listDisable.add(TpPagamento.CHEQUE);
  if (sChaveDecrypt[12] == '0') listDisable.add(TpPagamento.VALECOMBUSTIVEL);
  if (sChaveDecrypt[13] == '0') listDisable.add(TpPagamento.VOUCHER);

  return listDisable;
}

List<dynamic> returnDTNonNullable(List<dynamic>? listaDT) {
  if (listaDT == null || listaDT.isEmpty) {
    return [{}]; // Retorna uma lista com um Map vazio como fallback
  }
  return listaDT;
}

bool? enumGoToPage(
  TpPagamento? enumTp,
  int? iParc,
) {
  final allowedTypes = {
    TpPagamento.PIX,
    TpPagamento.CARTAO_CREDITO,
    TpPagamento.CARTAO_DEBITO,
  };

  return (enumTp != null && allowedTypes.contains(enumTp)) ||
      (iParc != null && iParc > 1);
}

List<DadosTEFStruct>? payConfirmedListToPa(
    List<PaymentDataTypeStruct>? paymentsconfirmed) {
  if (paymentsconfirmed == null) return null;

  return paymentsconfirmed
      .map((p) => p.tefProcessado)
      .whereType<DadosTEFStruct>() // filtra apenas os não-nulos
      .toList();
}

List<DadosTEFStruct>? returnDadosFromPay(
    List<PaymentDataTypeStruct>? paymentsconfirmed) {
  if (paymentsconfirmed == null) return null;

  return paymentsconfirmed
      .map((p) => p.tefProcessado)
      .whereType<DadosTEFStruct>() // filtra apenas os não-nulos
      .toList();
}

PagNumServer? enumClienteToServer(TpPagamento? enumClient) {
  // enum client to enum server
  switch (enumClient) {
    case TpPagamento.DINHEIRO:
      return PagNumServer.DINHEIRO;
    case TpPagamento.CARTAO_CREDITO:
      return PagNumServer.CARTAO;
    case TpPagamento.CARTAO_DEBITO:
      return PagNumServer.CARTAO;
    case TpPagamento.PIX:
      return PagNumServer.PIX;
    case TpPagamento.CREDIARIO:
      return PagNumServer.CREDIARIO;
    case TpPagamento.VOUCHER:
      return PagNumServer.VOUCHER;
    case TpPagamento.VALECOMBUSTIVEL:
      return PagNumServer.VALECOMBUSTIVEL;
    default:
      return null;
  }
}

List<String>? listCurrencyPossibility(double? value) {
  if (value == null) return [];

  // Inclui o valor base com centavos (exatamente como recebido)
  List<double> possibilities = [value];

  // Converte o valor base para inteiro para os próximos incrementos
  int baseValue = value.round();

  // Primeiros 3 steps inteiros (1, 2, 5)
  List<int> initialSteps = [1, 2, 5];
  for (int step in initialSteps) {
    possibilities.add((baseValue + step).toDouble());
  }

  // Steps maiores após os 3 primeiros (20, 50, 100, 200, 400)
  List<int> largeSteps = [20, 50, 100, 200, 400];
  int currentValue =
      baseValue + 10; // Começa com 10 para evitar valores muito próximos
  for (int step in largeSteps) {
    while (currentValue <= baseValue + 1000) {
      possibilities.add(currentValue.toDouble());
      currentValue += step;
    }
  }

  // Remove duplicados, ordena e formata para exibição
  possibilities = possibilities.toSet().toList()..sort();

  return possibilities
      .map((e) => "R\$ ${e.toStringAsFixed(2).replaceAll('.', ',')}")
      .toList();
}

String? firstLetterUpper(String? value) {
  if (value == null || value.isEmpty) return value;

  return value
      .toLowerCase()
      .split(' ')
      .map((word) =>
          word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
      .join(' ');
}

String? returnFromHTTPCode(int? statuscode) {
  if (statuscode == null) return 'Código de status ausente';

  switch (statuscode) {
    case 200:
      return 'OK - Requisição bem-sucedida';
    case 201:
      return 'Criado - Recurso criado com sucesso';
    case 204:
      return 'Sem conteúdo - Requisição bem-sucedida, sem corpo de resposta';
    case 400:
      return 'Requisição inválida';
    case 401:
      return 'Não autorizado - Verifique suas credenciais';
    case 403:
      return 'Proibido - Você não tem permissão';
    case 404:
      return 'Não encontrado - Recurso inexistente';
    case 405:
      return 'Método não permitido';
    case 408:
      return 'Tempo de requisição esgotado';
    case 409:
      return 'Conflito - Recurso em estado conflitante';
    case 429:
      return 'Muitas requisições - Tente novamente mais tarde';
    case 500:
      return 'Erro interno do servidor';
    case 502:
      return 'Bad Gateway - Resposta inválida de servidor intermediário';
    case 503:
      return 'Serviço indisponível - Tente novamente mais tarde';
    case 504:
      return 'Gateway Timeout - Tempo de resposta excedido';
    default:
      return 'Código desconhecido: $statuscode';
  }
}

List<String>? allFrentistas(
    List<ListaAbastecimentoDataTypeStruct>? listaAbastSelecionados) {
  if (listaAbastSelecionados == null) return null;

  final Set<String> frentistasSet = {};

  for (final item in listaAbastSelecionados) {
    final frentista = item.frentista;
    if (frentista != null && frentista.isNotEmpty) {
      frentistasSet.add(frentista);
    }
  }

  return frentistasSet.toList();
}

bool? isBase64(String? valueBase) {
  if (valueBase == null || valueBase.isEmpty) return false;

  try {
    final decoded = base64Decode(valueBase);
    // Considera válido se a string decodifica e retorna algum byte
    return decoded.isNotEmpty;
  } catch (e) {
    return false;
  }
}

int intNotNull(int? value) {
  // tratar null, se for null vem 0
  return value ?? 0; // Return 0 if value is null
}

int? doubleToCentavos(double? value) {
  // double para centavos, 1.0 para 100
  if (value == null) return null; // Return null if the input is null
  return (value * 100)
      .round(); // Convert to centavos and round to nearest integer
}

String? atualizaStringDigitado(
  int? aNumb,
  String? valorAtual,
) {
  valorAtual ??= '';

  if (aNumb == -1) {
    // Remove o último caractere se houver
    if (valorAtual.isNotEmpty) {
      return valorAtual.substring(0, valorAtual.length - 1);
    } else {
      return '';
    }
  } else if (aNumb == -2) {
    return '';
  } else if (aNumb != null && aNumb >= 0 && aNumb <= 9) {
    // Adiciona o número ao final
    return valorAtual + aNumb.toString();
  }

  // Retorna sem alterações
}

String? resultMessagesFromCode(int? codeResult) {
  if (codeResult == null)
    return 'Erro desconhecido. Tente novamente mais tarde.';

  switch (codeResult) {
    case 200:
    case 201:
      return null; // Nenhuma mensagem para sucesso
    case 400:
      return 'Requisição inválida. Verifique os dados informados.';
    case 401:
      return 'Não autorizado. Verifique suas credenciais.';
    case 403:
      return 'Acesso negado. Você não tem permissão para esta ação.';
    case 404:
      return 'Recurso não encontrado. Verifique se o endereço está correto.';
    case 408:
      return 'Tempo de resposta esgotado. Tente novamente.';
    case 409:
      return 'Conflito de dados. Verifique as informações enviadas.';
    case 422:
      return 'Dados inválidos ou incompletos. Corrija e tente novamente.';
    case 429:
      return 'Muitas requisições. Por favor, aguarde e tente novamente.';
    case 500:
      return 'Erro interno do servidor. Por favor, tente mais tarde.';
    case 502:
      return 'Serviço temporariamente indisponível. Tente novamente.';
    case 503:
      return 'Servidor indisponível. Por favor, tente mais tarde.';
    case 504:
      return 'Tempo de resposta excedido. Verifique sua conexão e tente novamente.';
    default:
      return 'Erro inesperado (código $codeResult). Tente novamente ou contate o suporte.';
  }
}
