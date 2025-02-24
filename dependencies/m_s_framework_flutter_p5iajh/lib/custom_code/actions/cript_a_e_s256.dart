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

import 'package:encrypt/encrypt.dart'
    as encrypt; // Mantém o alias para o pacote encrypt
import 'dart:convert';

Future<String> criptAES256(String? value) async {
  // Chave AES-256 de 32 bytes
  final key = encrypt.Key.fromUtf8('#nowmy@yekfppjverpsavancarsempre');

  // Gera um IV aleatório de 16 bytes
  final iv = encrypt.IV.fromLength(16);

  // Inicializa o encrypter com a chave e o IV
  final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

  // Criptografa o valor fornecido
  final encryptedValue = encrypter.encrypt(value!, iv: iv);

  // Concatena o IV ao texto cifrado e codifica como base64
  final encryptedWithIv = iv.bytes + encryptedValue.bytes;
  return base64.encode(encryptedWithIv);
}
