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

import 'dart:io'; // Para trabalhar com File
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<String> sendEmailCustom(
  String? sTitulo,
  List<String>? listEmailCustomers,
  String? textBody,
  String nomeRemetente,
  String smtpUsername,
  String smtpPassword,
  int iService,
  String smtpHost,
  int smtpPort,
  bool? bisTester, // Novo parâmetro para testar a conexão
) async {
  if (sTitulo == null ||
      listEmailCustomers == null ||
      listEmailCustomers.isEmpty) {
    throw ArgumentError('Título ou lista de e-mails inválidos.');
  }

  String username = smtpUsername;
  String password = smtpPassword;

  // Configuração do servidor SMTP com base em iService
  SmtpServer smtpServer;
  switch (iService) {
    case 0: // Gmail
      smtpServer = gmail(username, password);
      break;
    case 1: // Hotmail
      smtpServer = hotmail(username, password);
      break;
    case 2: // Yahoo
      smtpServer = yahoo(username, password);
      break;
    case 3: // Custom SMTP
      smtpServer = SmtpServer(
        smtpHost,
        port: smtpPort,
        username: username,
        password: password,
        ignoreBadCertificate: false,
      );
      break;
    default:
      throw ArgumentError(
          'Serviço de e-mail inválido. Use 0 (Gmail), 1 (Hotmail), 2 (Yahoo), ou 3 (Custom).');
  }

  // Teste de conexão (se bisTester for true, apenas testa a conexão)
  if (bisTester ?? false) {
    try {
      // Testa a conexão com o servidor SMTP sem enviar o e-mail
      await send(
        Message()
          ..from = Address(username, nomeRemetente) // Nome do remetente
          ..recipients.addAll(listEmailCustomers) // Lista de destinatários
          ..subject = 'Teste de Conexão'
          ..text = 'Testando a conexão SMTP...', // Corpo do teste
        smtpServer,
      );
      return 'Conexão bem-sucedida com o servidor SMTP.'; // Retorna sucesso se a conexão for bem-sucedida
    } catch (e) {
      return 'Falha ao conectar com o servidor SMTP: $e'; // Retorna erro se não for possível conectar
    }
  }

  // Criação do e-mail
  final message = Message()
    ..from = Address(username, nomeRemetente) // Nome do remetente
    ..recipients.addAll(listEmailCustomers) // Lista de destinatários
    ..subject = sTitulo
    ..text = textBody! // Conteúdo em texto
    ..html =
        '<h1>Olá!</h1><p>Este é um e-mail de teste enviado pelo Flutter.</p>'; // Conteúdo HTML

  // Enviar o e-mail
  try {
    final sendReport = await send(message, smtpServer);
    return 'E-mail enviado com sucesso: ${sendReport.toString()}';
  } on MailerException catch (e) {
    print('Falha ao enviar e-mail: $e');
    for (var p in e.problems) {
      print('Problema: ${p.code}: ${p.msg}');
    }
    return 'Falha ao enviar o e-mail.';
  } catch (e) {
    return 'Erro inesperado: $e';
  }
}
