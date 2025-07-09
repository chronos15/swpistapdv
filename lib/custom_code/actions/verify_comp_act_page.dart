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

import 'package:flutter/scheduler.dart';

Future<void> verifyCompActPage(
  BuildContext context,
  Future Function(bool? compActive)? actisActive,
) async {
  bool lastWasActive = false;

  void checkOverlay() {
    if (!context.mounted) return;
    final overlay = Overlay.of(context);

    // Verifica se há algo sobreposto com base no número de entries visíveis no overlay
    final isActive = ModalRoute.of(context)?.isCurrent != true;

    if (actisActive != null && isActive != lastWasActive) {
      lastWasActive = isActive;
      actisActive(isActive);
      print('Overlay alterado: $isActive');
    }

    SchedulerBinding.instance.addPostFrameCallback((_) => checkOverlay());
  }

  SchedulerBinding.instance.addPostFrameCallback((_) => checkOverlay());
}
