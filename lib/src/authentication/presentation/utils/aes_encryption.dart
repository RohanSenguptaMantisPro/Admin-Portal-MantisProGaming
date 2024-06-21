import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/rsa_encryption.dart';
import 'package:pointycastle/export.dart';

class AESService {
  Map<String, String>? encryptDataWithAES(String data, RSAService rsaService) {
    try {
      final secureRandom = FortunaRandom();
      final seedSource = generateSecureRandomBytes(32);
      secureRandom.seed(KeyParameter(seedSource));

      final key = secureRandom.nextBytes(16);
      final iv = secureRandom.nextBytes(16);
      final keyParam = KeyParameter(key);
      final params = ParametersWithIV(keyParam, iv);

      final padding = PaddedBlockCipher('AES/CBC/PKCS7')
        ..init(true, PaddedBlockCipherParameters(params, null));

      final plainData = utf8.encode(data);
      final encryptedData = padding.process(plainData);

      final encryptedKey = rsaService.encryptData(key);
      if (encryptedKey == null) {
        return null;
      }

      return {
        'encryptedData': base64Encode(encryptedData),
        'encryptedKey': encryptedKey,
        'iv': base64Encode(iv),
      };
    } catch (error) {
      return null;
    }
  }

  Uint8List generateSecureRandomBytes(int length) {
    final rng = Random.secure();
    final bytes = List<int>.generate(length, (_) => rng.nextInt(256));
    return Uint8List.fromList(bytes);
  }
}
