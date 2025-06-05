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

Future<List<ValeCombustivelDataTypeStruct>> addOrRemoveVale(
  List<ValeCombustivelDataTypeStruct>? listValeTotal,
  ValeCombustivelDataTypeStruct? itemVale,
) async {
  if (listValeTotal == null) {
    listValeTotal = [];
  }

  if (itemVale == null) {
    return listValeTotal; // Return the list if itemVale is null
  }

  if (listValeTotal.contains(itemVale)) {
    listValeTotal.remove(itemVale); // Remove if it exists
  } else {
    listValeTotal.add(itemVale); // Add if it doesn't exist
  }

  return listValeTotal; // Return the updated list
}
