// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> geraPDF(
  double pagWidth,
  double pagHeight,
  VendasStruct? vendaMaster,
  List<VendaitemStruct>? vendaItens,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(55 * PdfPageFormat.mm, 80.0),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Pedido #${vendaMaster?.idCliente}',
                style:
                    pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Text('Cliente: ${vendaMaster?.nomeCliente ?? "Não informado"}',
                style: pw.TextStyle(fontSize: 10)),
            pw.Text('CPF/CNPJ: ${vendaMaster?.cpfcnpj ?? "Não informado"}',
                style: pw.TextStyle(fontSize: 10)),
            pw.Text(
                'Data: ${vendaMaster?.datavenda ?? "--/--/----"} às ${vendaMaster?.hora ?? "--:--"}',
                style: pw.TextStyle(fontSize: 10)),
            pw.Text('Vendedor: ${vendaMaster?.idVendedor}',
                style: pw.TextStyle(fontSize: 10)),
            pw.SizedBox(height: 5),
            pw.Text(
                'Forma de Pagamento: ${vendaMaster?.descrtpvenda ?? "Não informado"}',
                style: pw.TextStyle(fontSize: 10)),
            pw.Text(
                'Total: R\$ ${vendaMaster?.totalvenda?.toStringAsFixed(2) ?? "0.00"}',
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Text('Itens do Pedido:',
                style:
                    pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 5),
            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: pw.FlexColumnWidth(3),
                1: pw.FlexColumnWidth(1),
                2: pw.FlexColumnWidth(1),
              },
              children: [
                pw.TableRow(
                  decoration: pw.BoxDecoration(color: PdfColors.grey300),
                  children: [
                    pw.Padding(
                        padding: pw.EdgeInsets.all(2),
                        child: pw.Text('Produto',
                            style: pw.TextStyle(
                                fontSize: 8, fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(2),
                        child: pw.Text('Qtd',
                            style: pw.TextStyle(
                                fontSize: 8, fontWeight: pw.FontWeight.bold))),
                    pw.Padding(
                        padding: pw.EdgeInsets.all(2),
                        child: pw.Text('Subtotal',
                            style: pw.TextStyle(
                                fontSize: 8, fontWeight: pw.FontWeight.bold))),
                  ],
                ),
                ...?vendaItens?.map((item) {
                  return pw.TableRow(
                    children: [
                      pw.Padding(
                          padding: pw.EdgeInsets.all(2),
                          child: pw.Text(item.nomeProduto ?? '',
                              style: pw.TextStyle(fontSize: 8))),
                      pw.Padding(
                          padding: pw.EdgeInsets.all(2),
                          child: pw.Text(
                              '${item.quantidade?.toStringAsFixed(2) ?? "0.00"}',
                              style: pw.TextStyle(fontSize: 8))),
                      pw.Padding(
                          padding: pw.EdgeInsets.all(2),
                          child: pw.Text(
                              'R\$ ${item.subtotal?.toStringAsFixed(2) ?? "0.00"}',
                              style: pw.TextStyle(fontSize: 8))),
                    ],
                  );
                })
              ],
            )
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
}
