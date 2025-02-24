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

import 'package:flutter/services.dart';

Future<String> getClipboardText() async {
  // Get the copied value from the clipboard
  ClipboardData? data = await Clipboard.getData('text/plain');

  // Check if the copied value is not null
  if (data != null) {
    // Return the copied value
    return data.text!;
  } else {
    // Return an empty string if no value is copied
    return '';
  }
}
