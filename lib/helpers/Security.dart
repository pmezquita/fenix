import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class Security {
  static final _key = Key.fromUtf8('7(6vO(bP&<pN{9+oa9=h~m8#2qm|7b1v');
  static const String _salt = '}1ar&GNVA37bdf£f4%-';
  static final _iv = IV.fromLength(16);

  /*
  original: holamundo
  encriptado: i9k4CVKiZ1bGgEhp/bHn2xI16dKXHASl4gXHvG+6fHU=
  desencriptado: holamundo
  */

  static String encryptSHA256(String data) => sha256.convert(utf8.encode(data)).toString();

  static String? encryptAES(String? data) {
    if (data == null) return null;

    final encrypter = Encrypter(AES(_key, mode: AESMode.ecb));
    final encripted = encrypter.encrypt(_salt + data, iv: _iv);
    return encripted.base64;
  }

  static String? decryptAES(String? b64) {
    if (b64 == null || b64.isEmpty) return b64;

    const error = 'Error decrypt';
    if (b64.length < 10) return error;

    final encrypter = Encrypter(AES(_key, mode: AESMode.ecb));
    String decrypted;
    try {
      decrypted = encrypter.decrypt64(b64, iv: _iv);
    } on Exception {
      decrypted = _salt + error;
    }
    return decrypted.substring(_salt.length);
  }

// static void testAES() {
//   const data = 'holamundo';
//   print('original: $data');
//   final b64 = encryptAES(data);
//   print('encriptado: $b64');
//   final result = decryptAES(b64);
//   print('desencriptado: $result');
// }
}
