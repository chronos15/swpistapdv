import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:m_s_framework_flutter_p5iajh/app_state.dart'
    as m_s_framework_flutter_p5iajh_app_state;
import 'package:m_s_framework_flutter_p5iajh/backend/api_requests/api_calls.dart'
    as m_s_framework_flutter_p5iajh_api_calls_util;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_m_s_frame_message_box_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/components/un_view_ms_windows_bar_widget.dart'
    as m_s_framework_flutter_p5iajh;
import 'package:m_s_framework_flutter_p5iajh/custom_code/actions/index.dart'
    as m_s_framework_flutter_p5iajh_actions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/custom_functions.dart'
    as m_s_framework_flutter_p5iajh_functions;
import 'package:m_s_framework_flutter_p5iajh/flutter_flow/flutter_flow_util.dart'
    as m_s_framework_flutter_p5iajh_util
    show wrapWithModel, createModel, FlutterFlowDynamicModels;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  bool disableByError = false;

  String sMessageError = 'Realizando conexão com o servidor...';

  bool? bTentarNovamente = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - testConnectionServer] action in Login widget.
  bool? actBlockServer;
  // Stores action output result for [Backend Call - API (GetToken)] action in Login widget.
  m_s_framework_flutter_p5iajh_api_calls_util.ApiCallResponse? getToken;
  // State field(s) for EmailAddressField widget.
  FocusNode? emailAddressFieldFocusNode;
  TextEditingController? emailAddressFieldTextController;
  String? Function(BuildContext, String?)?
      emailAddressFieldTextControllerValidator;
  String? _emailAddressFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Por favor, informe o usuário!';
    }

    if (val.length < 1) {
      return 'Defina pelo menos um caractere!';
    }
    if (val.length > 50) {
      return 'Máximo de caracteres atingido!';
    }
    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Verifique seu usuário e tente novamente!';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe sua senha!';
    }

    if (val.length < 1) {
      return 'Defina pelo menos um caractere!';
    }
    if (val.length > 50) {
      return 'Máximo de caracteres atingido!';
    }

    return null;
  }

  // Stores action output result for [Action Block - LoginActBlock] action in PasswordField widget.
  UsuarioDataTypeStruct? loginBlockCopy;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;
  // Stores action output result for [Action Block - LoginActBlock] action in LogInButton widget.
  UsuarioDataTypeStruct? loginBlock;
  // Model for unViewMsWindowsBar component.
  late m_s_framework_flutter_p5iajh.UnViewMsWindowsBarModel
      unViewMsWindowsBarModel;

  @override
  void initState(BuildContext context) {
    emailAddressFieldTextControllerValidator =
        _emailAddressFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    unViewMsWindowsBarModel = m_s_framework_flutter_p5iajh_util.createModel(
        context, () => m_s_framework_flutter_p5iajh.UnViewMsWindowsBarModel());
  }

  @override
  void dispose() {
    emailAddressFieldFocusNode?.dispose();
    emailAddressFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    unViewMsWindowsBarModel.dispose();
  }

  /// Action blocks.
  Future<UsuarioDataTypeStruct?> loginActBlock(BuildContext context) async {
    ApiCallResponse? autResult;
    ApiCallResponse? apiResultCofig;
    ApiCallResponse? apiResultEmpresa;

    autResult = await AutentificacaoCall.call(
      ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
          .ConfigGlobaisServer
          .host,
      token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      usuario: emailAddressFieldTextController.text,
      senha: passwordFieldTextController.text,
    );

    if (AutentificacaoCall.result(
      (autResult.jsonBody ?? ''),
    )!) {
      FFAppState().updateConfigLocaisStruct(
        (e) => e
          ..usuario = emailAddressFieldTextController.text
          ..senha = passwordFieldTextController.text
          ..lembrarUsuario = checkboxListTileValue,
      );
      apiResultCofig = await ConfiguracaoCall.call(
        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
            .ConfigGlobaisServer
            .host,
        token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      );

      apiResultEmpresa = await EmpresaCall.call(
        ip: m_s_framework_flutter_p5iajh_app_state.FFAppState()
            .ConfigGlobaisServer
            .host,
        token: m_s_framework_flutter_p5iajh_app_state.FFAppState().Token,
      );

      if ((apiResultEmpresa.succeeded ?? true) &&
          (apiResultCofig.succeeded ?? true)) {
        FFAppState().Empresa = EmpresaCall.empresa(
          (apiResultEmpresa.jsonBody ?? ''),
        )!;
        FFAppState().ConfigRemota = ConfiguracaoCall.configuracao(
          (apiResultCofig.jsonBody ?? ''),
        )!
            .firstOrNull!;
        FFAppState().FrentistaSelecionado = FrentistasDataTypeStruct();
        FFAppState().updateEmpresaStruct(
          (e) => e
            ..logo = valueOrDefault<String>(
              '${m_s_framework_flutter_p5iajh_app_state.FFAppState().ConfigGlobaisServer.host}/Imagens/${m_s_framework_flutter_p5iajh_functions.replaceImageUrl(m_s_framework_flutter_p5iajh_api_calls_util.ServerConnectionGroup.getTokenCall.logo(
                    (getToken?.jsonBody ?? ''),
                  ).toString(), null)}',
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/s-w-easy-ibbc0c/assets/78b2hlu3x8rt/imgPlaceHolder.png',
            ),
        );
        return AutentificacaoCall.usuario(
          (autResult.jsonBody ?? ''),
        );
      } else {
        await m_s_framework_flutter_p5iajh_actions.elegantNotificationError(
          context,
          'Falha',
          'Erro ao realizar conexão com recursos!',
          FlutterFlowTheme.of(context).primaryText,
          FlutterFlowTheme.of(context).secondaryBackground,
          350.0,
          'bottomcenter',
          'frombottom',
        );
        return null;
      }
    } else {
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: 200.0,
                width: 340.0,
                child:
                    m_s_framework_flutter_p5iajh.UnViewMSFrameMessageBoxWidget(
                  sTitulo: 'Falha',
                  sText: AutentificacaoCall.message(
                    (autResult?.jsonBody ?? ''),
                  )!,
                  colorConfirm: FlutterFlowTheme.of(context).error,
                  colorCancel: Color(0x00000000),
                  enableCancel: false,
                  actConfirm: () async {},
                  actCancel: () async {},
                ),
              ),
            ),
          );
        },
      );

      return null;
    }
  }
}
