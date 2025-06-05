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

import 'package:collection/collection.dart';

Future<List<ListaAbastecimentoDataTypeStruct>> produtoDTUpdateCart(
  List<ListaAbastecimentoDataTypeStruct>? tToUpdate,
  ProdutoDataTypeStruct? productValue,
  double valueQuantidade,
) async {
  print("🔍 Iniciando produtoDTUpdateCart...");

  if (productValue == null || tToUpdate == null) {
    print("⚠️ Produto ou lista está nulo! Retornando lista vazia.");
    return [];
  }

  print("📋 Lista atual: ${tToUpdate.map((e) => e.produtoDT).toList()}");
  print("🔎 Verificando se o produto já está na lista...");

  var existingItem = tToUpdate.firstWhereOrNull(
    (item) => item.produtoDT == productValue,
  );

  if (existingItem != null) {
    print("✅ Produto encontrado! Removendo...");
    tToUpdate.remove(existingItem);
  } else {
    print("➕ Produto não encontrado! Adicionando...");
    tToUpdate.add(ListaAbastecimentoDataTypeStruct(
      bAsProduct: true,
      vlrtotal: productValue.pravista * valueQuantidade,
      dateDefault: DateTime.now(),
      quantidade: valueQuantidade,
      precoUnit: productValue.pravista,
      frentista: FFAppState().FrentistaSelecionado.nomeFrentista,
      idFrentista: FFAppState().FrentistaSelecionado.idRefcartao,
      produtoDT: productValue,
    ));
  }

  print("📋 Lista atualizada: ${tToUpdate.map((e) => e.produtoDT).toList()}");
  return tToUpdate;
}
