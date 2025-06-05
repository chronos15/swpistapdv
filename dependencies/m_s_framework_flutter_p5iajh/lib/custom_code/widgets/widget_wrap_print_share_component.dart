// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:universal_html/html.dart' as html;

class WidgetWrapPrintShareComponent extends StatefulWidget {
  const WidgetWrapPrintShareComponent({
    super.key,
    this.width,
    this.height,
    this.widgetToShare,
    this.actionPrint,
    this.actionShare,
    required this.sNameFile,
    this.sMessageOn,
    required this.sizeWidthComponent,
    required this.sizeHeightComponent,
    this.iconPrint,
    this.iconShared,
    this.widgetHeader,
  });

  final double? width;
  final double? height;
  final Widget Function()? widgetToShare;
  final Future Function(String? valueReturn, bool? sucess)? actionPrint;
  final Future Function(String? sDirectory, bool? sucess)? actionShare;
  final String sNameFile;
  final String? sMessageOn;
  final double sizeWidthComponent;
  final double sizeHeightComponent;
  final Widget? iconPrint;
  final Widget? iconShared;
  final Widget Function()? widgetHeader;

  @override
  State<WidgetWrapPrintShareComponent> createState() =>
      _WidgetWrapPrintShareComponentState();
}

class _WidgetWrapPrintShareComponentState
    extends State<WidgetWrapPrintShareComponent> {
  final ScreenshotController _screenshotController = ScreenshotController();
  bool showButtons = true;
  bool isCapturing = false; // Controla se está capturando

  /// Captura a imagem do widget e gera o PDF para impressão
  Future<void> _handlePrintAction() async {
    try {
      setState(() {
        showButtons = false;
        isCapturing = true;
      });

      final image = await _screenshotController.capture();

      setState(() {
        showButtons = true;
        isCapturing = false;
      });

      /* if (image != null) {
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async {
            final pdf = pw.Document();
            pdf.addPage(
              pw.Page(
                build: (pw.Context context) {
                  return pw.Align(
                    alignment:
                        pw.Alignment.topCenter, // Alinha no topo, centralizado
                    child: pw.Image(pw.MemoryImage(image)),
                  );
                },
              ),
            );
            return pdf.save();
          },
        );
      }*/

      if (widget.actionPrint != null) {
        await widget.actionPrint!(
          'Sucesso ao imprimir, verifique sua impressão',
          true,
        );
      } else {
        debugPrint("actionPrint não foi definida.");
      }
    } catch (e, stackTrace) {
      setState(() {
        showButtons = true;
        isCapturing = false;
      });
      if (widget.actionPrint != null) {
        await widget.actionPrint!("Erro ao realizar a impressão: $e", false)!;
      }
      debugPrint("Detalhes do erro: $stackTrace");
    }
  }

  /// Captura a imagem do widget, salva no dispositivo e compartilha
  Future<void> _handleShareAction() async {
    try {
      setState(() {
        showButtons = false;
        isCapturing = true;
      });

      final image = await _screenshotController.capture();

      setState(() {
        showButtons = true;
        isCapturing = false;
      });

      if (image != null) {
        if (kIsWeb) {
          // Flutter Web: Salvar arquivo no navegador
          try {
            /*final blob = html.Blob([image], 'image/png');
            final url = html.Url.createObjectUrlFromBlob(blob);

            final anchor = html.AnchorElement(href: url)
              ..target = 'blank'
              ..download = '${widget.sNameFile}.png'
              ..click();

            html.Url.revokeObjectUrl(url);*/ // Liberar o recurso
          } catch (e, stackTrace) {
            if (widget.actionShare != null) {
              await widget.actionShare!(
                  "Erro ao salvar ou baixar arquivo no Flutter Web: $e", false);
            }
            ;
            debugPrint("Detalhes do erro: $stackTrace");
          }
        } else {
          // Flutter Mobile/Desktop: Salvar e compartilhar
          try {
            final tempDir = await getTemporaryDirectory();
            final sFileDir = '${tempDir.path}/${widget.sNameFile}.png';
            final file = File(sFileDir);
            await file.writeAsBytes(image);

            if (widget.actionShare != null) {
              await widget.actionShare!(sFileDir, true);
            }

            await Share.shareXFiles([XFile(file.path)],
                text: widget.sMessageOn);
          } catch (e, stackTrace) {
            if (widget.actionShare != null) {
              await widget.actionShare!(
                "Erro ao salvar ou compartilhar arquivo: $e",
                false,
              );
            }

            debugPrint("Detalhes do erro: $stackTrace");
          }
        }
      }
    } catch (e, stackTrace) {
      setState(() {
        showButtons = true;
        isCapturing = false;
      });
      if (widget.actionShare != null) {
        await widget.actionShare!(
            "Erro ao capturar ou compartilhar imagem: $e", false);
      }
      ;
      if (widget.actionPrint != null) {
        await widget.actionShare!(
            "Erro ao capturar ou compartilhar imagem: $e", false);
      }
      ;
      debugPrint("Detalhes do erro: $stackTrace");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: _screenshotController,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container fixo para os botões
            Container(
              width: double.infinity,
              height:
                  38, // Altura fixa para manter o espaço mesmo sem os botões
              child: showButtons
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, top: 0.0, right: 40.0, bottom: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.iconPrint != null)
                            IconButton(
                              icon: widget.iconPrint!,
                              onPressed: _handlePrintAction,
                              tooltip: "Imprimir",
                            ),
                          if (widget.iconShared != null)
                            IconButton(
                              icon: widget.iconShared!,
                              onPressed: _handleShareAction,
                              tooltip: "Compartilhar",
                            ),
                        ],
                      ),
                    )
                  : null, // Deixa vazio, mas mantém o espaço
            ),
            // Cabeçalho controlado por opacidade
            Opacity(
              opacity: isCapturing ? 1.0 : 0.0,
              child: widget.widgetHeader?.call() ?? const SizedBox.shrink(),
            ),

            // Renderiza o widget a ser capturado
            Expanded(
              child: widget.widgetToShare?.call() ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
