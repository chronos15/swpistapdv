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

Future<List<ListaAddAbastecimentoDataTypeStruct>> addListToDTLancmento(
    List<ListaAbastecimentoDataTypeStruct>? listAbastecimento,
    int? idVenda) async {
  if (listAbastecimento == null || listAbastecimento.isEmpty) {
    return [];
  }

  var sDataAtual = DateTime.now();

  List<ListaAddAbastecimentoDataTypeStruct> novaLista = [];

  for (int i = 0; i < listAbastecimento.length; i++) {
    var abastecimento = listAbastecimento[i];

    novaLista.add(ListaAddAbastecimentoDataTypeStruct(
      idCodigo: (abastecimento.codAbastecimento == 0 ||
              abastecimento.codAbastecimento == null)
          ? (abastecimento.produtoDT.idCodigo * -1)
          : abastecimento.codAbastecimento,

      cartao: FFAppState().FrentistaSelecionado.idCartao,
      dataenvio: DateFormat('yyyy-MM-dd').format(sDataAtual),
      horaenvio: DateFormat('HH:mm:ss').format(sDataAtual),
      quantidade: abastecimento.quantidade,
      datetime: DateFormat('yyyy-MM-dd HH:mm:ss').format(sDataAtual),
      idloja: 1,
      numseqitem: i, // Agora indexado corretamente
      idfrentista: FFAppState().FrentistaSelecionado.idFrentista.toString(),
      regtipo: (abastecimento.codAbastecimento == 0 ||
              abastecimento.codAbastecimento == null)
          ? 'I'
          : 'R',
      modo: (abastecimento.codAbastecimento == 0 ||
              abastecimento.codAbastecimento == null)
          ? 'D'
          : '',
      valor: abastecimento.precoUnit,
      total: abastecimento.vlrtotal,
      idvenda: idVenda ?? 0,
    ));
  }

  return novaLista;
}
