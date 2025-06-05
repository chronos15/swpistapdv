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

Future setComponenteAdapteKeyboard(BuildContext context) async {
  // Add your function code here!
  await Future.delayed(Duration.zero);

  // Verifica se o teclado está visível
  final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

  // Aqui você pode fazer qualquer ajuste baseado nisso
  debugPrint('Teclado está ${isKeyboardOpen ? "aberto" : "fechado"}');

  // Exemplo: você poderia armazenar em uma variável de estado global/local
  // ou usar Provider, setState, etc., conforme sua arquitetura.
}
