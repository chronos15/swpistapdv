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

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DataGridGlobal extends StatefulWidget {
  const DataGridGlobal({
    super.key,
    this.width,
    this.height,
    required this.jsonValues,
    required this.colorHeader,
    this.rowsPerPage = 10,
    required this.totalItens,
    required this.actRowReturn,
  });

  final double? width;
  final double? height;
  final dynamic jsonValues;
  final Color colorHeader;
  final int rowsPerPage;
  final int totalItens;
  final Future Function(int pageSelected) actRowReturn;

  @override
  State<DataGridGlobal> createState() => _DataGridGlobalState();
}

class _DataGridGlobalState extends State<DataGridGlobal> {
  late GenericDataSource _dataSource;
  late int _rowsPerPage;
  late int _pageCount;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget.rowsPerPage;
    _dataSource = GenericDataSource(
      widget.jsonValues,
      _rowsPerPage,
      widget.totalItens,
    );
    _pageCount = (widget.totalItens / _rowsPerPage).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          child: SfDataGridTheme(
            data: SfDataGridThemeData(headerColor: widget.colorHeader),
            child: SfDataGrid(
              source: _dataSource,
              columns: _buildColumns(),
              allowSorting: true,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              columnWidthMode: ColumnWidthMode.auto,
              allowFiltering: true,
              allowMultiColumnSorting: true,
            ),
          ),
        ),
        SfDataPagerTheme(
          data: SfDataPagerThemeData(
            itemBorderWidth: 0.5,
            itemBorderColor: Colors.grey.shade400,
            itemBorderRadius: BorderRadius.circular(5),
            selectedItemColor: Colors.indigo.shade500,
          ),
          child: SfDataPager(
            firstPageItemVisible: true,
            lastPageItemVisible: true,
            visibleItemsCount: 3,
            navigationItemWidth: 100,
            pageItemBuilder: (String itemName) {
              if (itemName == 'Next') {
                return const Center(child: Text('Próxima'));
              }
              if (itemName == 'Previous') {
                return const Center(child: Text('Anterior'));
              }
              return null;
            },
            itemPadding: const EdgeInsets.all(8.0),
            pageCount: _pageCount.toDouble(),
            delegate: _dataSource,
            onRowsPerPageChanged: (int? rowsPerPage) {
              setState(() {
                _rowsPerPage = rowsPerPage!;
                _dataSource
                    .updateRowsPerPage(_rowsPerPage); // Call update method
                _pageCount = (widget.totalItens / _rowsPerPage).ceil();
              });
            },
            //rowsPerPage: _rowsPerPage,
            availableRowsPerPage: [5, 10, 15, 20, widget.rowsPerPage],
          ),
        ),
      ],
    );
  }

  List<GridColumn> _buildColumns() {
    if (widget.jsonValues.isEmpty) {
      return [];
    }
    return widget.jsonValues.first.keys.map((key) {
      return GridColumn(
        columnName: key,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            key,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }).toList();
  }
}

class GenericDataSource extends DataGridSource {
  GenericDataSource(this.jsonValues, this.rowsPerPage, this.totalItens) {
    _buildPaginatedRows();
  }

  final List<Map<String, dynamic>> jsonValues;
  int rowsPerPage; // Made non-final to allow updates
  final int totalItens;
  late List<DataGridRow> _dataGridRows;
  late List<DataGridRow> _paginatedRows;

  @override
  List<DataGridRow> get rows => _paginatedRows;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    final startIndex = newPageIndex * rowsPerPage;
    final endIndex = (startIndex + rowsPerPage).clamp(0, totalItens);
    _paginatedRows = _dataGridRows.sublist(startIndex, endIndex);
    notifyListeners();
    return true;
  }

  void updateRowsPerPage(int newRowsPerPage) {
    rowsPerPage = newRowsPerPage; // Update rowsPerPage
    _buildPaginatedRows();
    notifyListeners();
  }

  void _buildPaginatedRows() {
    _dataGridRows = jsonValues.map<DataGridRow>((data) {
      return DataGridRow(
        cells: data.entries.map((entry) {
          return DataGridCell(columnName: entry.key, value: entry.value);
        }).toList(),
      );
    }).toList();

    final endIndex = rowsPerPage.clamp(0, totalItens);
    _paginatedRows = _dataGridRows.sublist(0, endIndex);
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dataCell.value?.toString() ?? '',
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}
