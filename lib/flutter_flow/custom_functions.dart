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

String? addFilterClientes(
  int? cidade,
  String? tpPessoa,
  String? valueTextSearch,
) {
  List<String> filters = [];

  if (cidade != null && cidade != 0) {
    filters.add("(COD_CIDADE eq '$cidade')");
  }

  if (tpPessoa != null && tpPessoa.isNotEmpty) {
    filters.add("(TPPESSOA eq '$tpPessoa')");
  }

  if (valueTextSearch != null && valueTextSearch.isNotEmpty) {
    List<String> searchFilters = [
      //"(ID_CODIGO eq '$valueTextSearch')",
      "contains(NOME, '$valueTextSearch')",
      //"contains(DENOME, '$valueTextSearch')",
      //"(CPFCNPJ eq '$valueTextSearch')",
    ];
    filters.add("(${searchFilters.join(' and ')})");
  }

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
      //numRef: abastecimento.idAbastecimento.toString(),
      //estoqueAtual: 8000, // Definir conforme necessário
      quantidade: abastecimento.quantidade,
      qtdTroca: null,
      valorvenda: abastecimento.precoUnit,
      valorvendido: abastecimento.vlrtotal,
      subtotal: abastecimento.vlrtotal,
      unidademed: abastecimento.bAsProduct ? abastecimento.produtoDT.und : 'LT',
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
  // enum name string to enum
  return deserializeEnum<TPRegistro>(valueName);
}
