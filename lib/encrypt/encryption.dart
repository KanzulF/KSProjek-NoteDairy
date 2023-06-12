import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';

class EncryptionDescryption {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static encryptAES(text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    String encryptedString = base64.encode(encrypted.bytes);

    return encryptedString;
  }

  static decryptAES(text) {
    Encrypted encryptedData = Encrypted(base64.decode(text));
    return encrypter.decrypt(encryptedData, iv: iv);
  }
}
