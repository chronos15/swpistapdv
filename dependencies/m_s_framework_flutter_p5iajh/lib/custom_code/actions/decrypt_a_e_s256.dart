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
    as encrypt; // Adiciona um alias ao pacote encrypt
import 'dart:convert';

Future<String> decryptAES256(String? encryptedValue) async {
  try {
    // Chave de 32 bytes
    final key = encrypt.Key.fromUtf8('#nowmy@yekfppjverpsavancarsempre');

    // Extrai o IV do texto cifrado
    final encryptedBytes = base64.decode(encryptedValue!);
    final ivBytes = encryptedBytes.sublist(0, 16); // IV de 16 bytes
    final encryptedTextBytes = encryptedBytes.sublist(16);

    final iv = encrypt.IV(ivBytes);

    // Inicializa o encrypter
    final encrypter =
        encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc));

    // Descriptografa o texto cifrado
    final decryptedValue = encrypter.decryptBytes(
      encrypt.Encrypted(encryptedTextBytes),
      iv: iv,
    );

    return utf8.decode(decryptedValue);
  } catch (e) {
    // Retorna um valor vazio em caso de erro
    return '';
  }
}
