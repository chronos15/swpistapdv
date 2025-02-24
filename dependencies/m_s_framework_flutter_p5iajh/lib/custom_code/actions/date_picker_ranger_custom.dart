// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Future<DateTimeRange?> datePickerRangerCustom(
    BuildContext context,
    double? sizeWidth,
    double? sizeHeight,
    bool horizontalView,
    String formatWeekHeader,
    Color colorSelection) async {
  final DateRangePickerController _controller = DateRangePickerController();
  _controller.displayDate = DateTime.now()
      .subtract(Duration(days: 30)); // Define o mês inicial como o anterior
  DateTimeRange? selectedDateRange;
  bool isConfirmed = false;

  DateRangePickerNavigationDirection navigationDirection = horizontalView
      ? DateRangePickerNavigationDirection.horizontal
      : DateRangePickerNavigationDirection.vertical;

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime today = DateTime.now();
    PickerDateRange ranges = args.value;
    DateTime startDate = ranges.startDate ?? today;
    DateTime endDate = ranges.endDate ?? startDate;

    // Cria um DateTimeRange com as datas de início e fim selecionadas
    selectedDateRange = DateTimeRange(start: startDate, end: endDate);
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: sizeHeight,
          width: sizeWidth,
          child: SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
            backgroundColor: Colors.transparent,
            selectionTextStyle: const TextStyle(color: Colors.white),
            selectionColor: colorSelection,
            startRangeSelectionColor: colorSelection,
            endRangeSelectionColor: colorSelection,
            selectionMode: DateRangePickerSelectionMode.range,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            onSelectionChanged: selectionChanged,
            enableMultiView: true,
            navigationDirection: navigationDirection,
            showNavigationArrow: true,
            monthViewSettings: DateRangePickerMonthViewSettings(
              enableSwipeSelection: false,
              dayFormat: "EEE", // Define o formato como "EEE" para três letras
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            headerStyle:
                DateRangePickerHeaderStyle(backgroundColor: Colors.transparent),
            maxDate: DateTime.now(), // Limita a seleção até o dia atual
            minDate: DateTime(2000, 1, 1),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Cor de fundo do botão "Cancelar"
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Cantos arredondados
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.white, // Cor do texto do botão "Cancelar"
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              isConfirmed = false;
              Navigator.of(context).pop(); // Fecha o diálogo sem retornar nada
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorSelection, // Cor de fundo do botão
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Cantos arredondados
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 16), // Padding do botão
            ),
            child: Text(
              "Confirmar",
              style: TextStyle(
                color: Colors.white, // Cor do texto
                fontSize: 14, // Tamanho da fonte
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              isConfirmed = true;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );

  if (isConfirmed) {
    return selectedDateRange; // Retorna o intervalo de datas selecionado
  }
  return null; // Se não confirmado, retorna null
}
