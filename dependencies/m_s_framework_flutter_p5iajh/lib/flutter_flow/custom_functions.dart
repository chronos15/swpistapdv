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

List<String>? readFromValueKey(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  /// Divide a string pelo delimitador "|"
  return value.split('|');
//rteste
}

int? stringToIntValue(String? value) {
  // value string to int
  if (value == null) {
    return null;
  }

  try {
    return int.parse(value);
  } catch (e) {
    return null;
  }
}

String formatCPFCNPJ(String? valueCPFCNPJ) {
  //adicionar no onchange com 50ms definir o set campo + dados do proprio campo
  if (valueCPFCNPJ == null || valueCPFCNPJ.isEmpty) return '';

  // Remover caracteres não numéricos
  String digits = valueCPFCNPJ.replaceAll(RegExp(r'\D'), '');

  // Aplicar formatação para CPF (até 11 dígitos)
  if (digits.length <= 11) {
    return digits.replaceAllMapped(
        RegExp(r'(\d{1,3})(\d{1,3})?(\d{1,3})?(\d{1,2})?'), (Match m) {
      String result = m[1]!;
      if (m[2] != null) result += '.${m[2]}';
      if (m[3] != null) result += '.${m[3]}';
      if (m[4] != null) result += '-${m[4]}';
      return result;
    });
  }
  // Aplicar formatação para CNPJ (mais de 11 dígitos)
  else {
    return digits.replaceAllMapped(
        RegExp(r'(\d{1,2})(\d{1,3})?(\d{1,3})?(\d{1,4})?(\d{1,2})?'),
        (Match m) {
      String result = m[1]!;
      if (m[2] != null) result += '.${m[2]}';
      if (m[3] != null) result += '.${m[3]}';
      if (m[4] != null) result += '/${m[4]}';
      if (m[5] != null) result += '-${m[5]}';
      return result;
    });
  }
}

String? stringFirstCharacterUpperCase(String? valueString) {
  // string first Character uppercase
  if (valueString == null || valueString.isEmpty) {
    return null;
  }

  String firstChar = valueString.substring(0, 1).toUpperCase();
  String restOfString = valueString.substring(1).toLowerCase();

  return firstChar + restOfString;
}

String? formatNumb(
  FormatEnum? formatter,
  String? value,
) {
  if (formatter == null || value == null) return null;

  // Converter o valor para número, com fallback para zero em caso de erro
  final parsedValue = double.tryParse(value) ?? 0;

  switch (formatter) {
    case FormatEnum.Inteiro:
      // Formatação para inteiro (número sem casas decimais)
      return NumberFormat.decimalPattern('pt_BR').format(parsedValue.round());

    case FormatEnum.Real:
      // Formatação para moeda brasileira (R$)
      return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
          .format(parsedValue);

    case FormatEnum.Porcentagem:
      // Formatação para porcentagem com 2 casas decimais
      return '${parsedValue.toStringAsFixed(2)}%';

    case FormatEnum.DoubleDefault:
      // Retornar valor em formato double padrão
      return parsedValue.toString();

    case FormatEnum.Quantidade:
      // Formatação para quantidade (double com separadores padrão)
      return NumberFormat.decimalPattern('pt_BR').format(parsedValue);

    case FormatEnum.RealToDouble:
      // Remove cifrão, separadores de milhar e converte vírgula decimal para ponto
      final cleanedValue = value
          .replaceAll('R\$', '') // Remove o cifrão
          .replaceAll(' ', '') // Remove espaços adicionais
          .replaceAll('.', '') // Remove separadores de milhar
          .replaceAll(',', '.'); // Substitui vírgula decimal por ponto
      try {
        // Converte para double
        final doubleValue = double.parse(cleanedValue);
        // Formata com separadores padrão do locale pt_BR
        return NumberFormat.decimalPattern('pt_BR').format(doubleValue);
      } catch (e) {
        throw FormatException("Valor inválido para conversão: $value");
      }

    default:
      return value;
  }
}

String? formatReal(String? value) {
  if (value == null || value.isEmpty) return 'R\$ 0,00';

  // Remover caracteres não numéricos
  String digits = value.replaceAll(RegExp(r'\D'), '');

  // Garantir pelo menos dois dígitos para os centavos
  if (digits.length < 3) {
    digits = digits.padLeft(3, '0');
  }

  // Separar centavos e reais
  String centavos = digits.substring(digits.length - 2);
  String reais = digits.substring(0, digits.length - 2);

  // Adicionar separadores de milhar
  reais = reais.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  );

  // Montar o valor formatado
  return 'R\$ $reais,$centavos';
}

List<String>? stringToListFromDelimiter(
  String? delimiter,
  String? input,
) {
  if (input == null || delimiter == null || delimiter.isEmpty) {
    return null; // Retorna nulo se a entrada ou o delimitador for nulo ou vazio
  }

  // Divide a string com base no delimitador
  List<String> result = input.split(delimiter);

  return result;
}

String? stringListToSimpleString(
  String? delimiter,
  List<String>? valueInput,
) {
  // string list para simple string from delimiter
  if (delimiter == null || valueInput == null || valueInput.isEmpty) {
    return null;
  }

  return valueInput.join(delimiter);
}

DateTime? difDateWithMonth(
  int? integer,
  DateTime? valueDateTime,
) {
  // Calcula o novo mês subtraindo os meses e o ano caso esteja em janeiro
  if (integer == null || valueDateTime == null) {
    return null;
  }

  int months = valueDateTime.month - integer;
  int year = valueDateTime.year;

  if (months <= 0) {
    months = 12 + months;
    year -= 1;
  }

  return DateTime(
      year,
      months,
      valueDateTime.day,
      valueDateTime.hour,
      valueDateTime.minute,
      valueDateTime.second,
      valueDateTime.millisecond,
      valueDateTime.microsecond);
}

DateTime? dateNullFormate(DateTime? valueDate) {
  // formatar datetime, se vier null, retorna datenow
  if (valueDate != null) {
    return valueDate;
  } else {
    return DateTime.now();
  }
}

List<String>? listStringTrunc(
  List<String>? values,
  int? charPerLinha,
  int? numbLinhaMax,
) {
  if (values == null ||
      charPerLinha == null ||
      numbLinhaMax == null ||
      charPerLinha <= 0 ||
      numbLinhaMax <= 0) {
    return null;
  }

  final List<String> truncatedList = [];

  for (String value in values) {
    // Divide o texto em blocos de tamanho máximo `charPerLinha`
    List<String> lines = [];
    for (int i = 0; i < value.length; i += charPerLinha) {
      lines.add(value.substring(i,
          i + charPerLinha > value.length ? value.length : i + charPerLinha));
    }

    // Limita o número de linhas a `numbLinhaMax`
    if (lines.length > numbLinhaMax) {
      lines = lines.sublist(0, numbLinhaMax);
      lines[numbLinhaMax - 1] =
          '${lines[numbLinhaMax - 1]}...'; // Adiciona "..." na última linha
    }

    // Junta as linhas truncadas e adiciona à lista final
    truncatedList.add(lines.join('\n'));
  }

  return truncatedList;
}

String? replaceImageUrl(
  String? value,
  String? sExt,
) {
  // Define a extensão padrão como 'jpg' caso sExt seja nulo ou vazio.
  final String extension = sExt?.isNotEmpty == true ? sExt! : 'jpg';

  // Verifica se o valor não é nulo, e substitui a parte após a última barra pela extensão desejada.
  if (value != null) {
    final fileNameWithoutExtension = value.split('/').last.split('.').first;
    return '$fileNameWithoutExtension.$extension';
  }

  // Retorna null se value for nulo.
  return null;
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

String? allToUpperCase(String? value) {
  // toda frase em uppercase
  if (value != null) {
    return value.toUpperCase();
  }
  return null;
}

String? removeCharEsp(String? value) {
  if (value == null) return null;

  // Remove todos os caracteres que não são letras, números ou espaços
  return value.replaceAll(RegExp(r'[^\w\s]'), '');
}
