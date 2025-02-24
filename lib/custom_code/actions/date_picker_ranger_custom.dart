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

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

Future<DateTimeRange?> datePickerRangerCustom(
    BuildContext context,
    double? sizeWidth,
    double? sizeHeight,
    bool multView,
    String formatWeekHeader,
    Color colorSelection,
    DateTimeRange? dateInitial) async {
  final DateRangePickerController _controller = DateRangePickerController();
  _controller.displayDate = DateTime.now()
      .subtract(Duration(days: 30)); // Define o mês inicial como o anterior
  DateTimeRange? selectedDateRange;
  bool isConfirmed = false;

  DateRangePickerNavigationDirection navigationDirection = multView
      ? DateRangePickerNavigationDirection.horizontal
      : DateRangePickerNavigationDirection.vertical;

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    DateTime today = DateTime.now();
    PickerDateRange ranges = args.value;
    DateTime startDate = ranges.startDate ?? today;
    DateTime endDate = ranges.endDate ?? startDate;

    selectedDateRange = DateTimeRange(start: startDate, end: endDate);
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      if (dateInitial != null) {
        // No modo simples, precisamos garantir que a data inicial seja selecionada
        _controller.selectedRange =
            PickerDateRange(dateInitial.start, dateInitial.end);
        _controller.displayDate =
            dateInitial.start; // Garantir que a data seja exibida
      }
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
            enableMultiView: false,
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
              backgroundColor: Colors.grey, // Cor do botão "Cancelar"
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: Text(
              "Cancelar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            onPressed: () {
              isConfirmed = false; // Marca como não confirmado
              Navigator.of(context).pop(); // Fecha o diálogo
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorSelection, // Cor do botão "Confirmar"
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            child: Text(
              "Confirmar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            onPressed: () {
              isConfirmed = true; // Marca como confirmado
              Navigator.of(context).pop(); // Fecha o diálogo
            },
          ),
        ],
      );
    },
  );

  // Retorna o intervalo de datas selecionado ou a data inicial
  if (isConfirmed) {
    return selectedDateRange;
  }
  return dateInitial; // Se não confirmado, retorna a data inicial
}
