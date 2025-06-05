import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'logger_view_widget.dart' show LoggerViewWidget;
import 'package:flutter/material.dart';

class LoggerViewModel extends FlutterFlowModel<LoggerViewWidget> {
  ///  Local state fields for this page.

  List<dynamic> listInfo = [];
  void addToListInfo(dynamic item) => listInfo.add(item);
  void removeFromListInfo(dynamic item) => listInfo.remove(item);
  void removeAtIndexFromListInfo(int index) => listInfo.removeAt(index);
  void insertAtIndexInListInfo(int index, dynamic item) =>
      listInfo.insert(index, item);
  void updateListInfoAtIndex(int index, Function(dynamic) updateFn) =>
      listInfo[index] = updateFn(listInfo[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - loggerRead] action in LoggerView widget.
  List<dynamic>? actReturnLogger;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Custom Action - loggerRead] action in IconButton widget.
  List<dynamic>? actReturnLoggerUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
