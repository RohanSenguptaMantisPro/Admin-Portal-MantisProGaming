import 'dart:convert';
import 'dart:math';

import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<void> logInWithGoogle();

  Future<bool> isUserLoggedIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({
    required SharedPreferences prefs,
    required GoogleSignIn googleSignIin,
  })  : _prefs = prefs,
        _googleSignIn = googleSignIin;

  final SharedPreferences _prefs;
  final GoogleSignIn _googleSignIn;

  // final FirebaseAuth _authClient;
  // final FirebaseFirestore _cloudStoreClient;
  // final FirebaseStorage _dbClient;

  @override
  Future<void> logInWithGoogle() async {
    try {
      // Google sign in will get from injection dependencies.

      // final GoogleSignIn _googleSignIn = GoogleSignIn(
      //   clientId: clientId,
      //   scopes: [
      //     'email',
      //     'profile',
      //   ],
      // );

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // authenticate user
      final GoogleSignInAuthentication googleUserAuthentication =
          await googleUser!.authentication;

      Map<String, String> encryptedDataMap = encryptDataWithAES(
        googleUserAuthentication.idToken!,
        // hugeString,
        // 'Mantis Pro Gaming',
        kPublicKey,
      );

      String jsonBody = jsonEncode(encryptedDataMap);
      // print('Sending encrypted json: $jsonBody');

      final response = await http.post(
        Uri.parse(kLoginHttpEndpoint),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      // set userToken locally.
      final DataMap res = jsonDecode(response.body) as DataMap;
      await _prefs.setString(
        kUserToken,
        res['token'].toString(),
      );

      //
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(
        message: e.toString(),
        statusCode: '505',
      );
    }
  }

  @override
  Future<bool> isUserLoggedIn() async {
    try {
      return _prefs.getBool(kUserToken) ?? false;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

// encrypting user idToken, using AES THEN RSA

  Uint8List generateSecureRandomBytes(int length) {
    final rng = Random.secure();
    final bytes = List<int>.generate(length, (_) => rng.nextInt(256));
    return Uint8List.fromList(bytes);
  }

  Map<String, String> encryptDataWithAES(String data, String rsaPublicKey) {
// Generating a random AES key and IV
    final secureRandom = FortunaRandom();
    // FortunaRandom is pointycastle's secure random generator.
    final seedSource = generateSecureRandomBytes(32);
    // generating random bytes.

    secureRandom.seed(
      KeyParameter(seedSource),
    ); // seeding those random bytes.

    // generating key and iv.
    final key = secureRandom.nextBytes(16);
    final iv = secureRandom.nextBytes(16);
    // converting keys and iv to a format to a supported one by pointycastle
    final keyParam = KeyParameter(key);
    final params = ParametersWithIV(keyParam, iv);

// Encrypting data with AES in CBC mode
//   final cbc = CBCBlockCipher(AESEngine());
    // padding suited for large data sets. PKCS7
    final padding = PaddedBlockCipher("AES/CBC/PKCS7")
      ..init(true,
          PaddedBlockCipherParameters(params, null)); // true for encryption

    final plainData = utf8.encode(data);
    final encryptedData = padding.process(plainData); // AES encryption.
    // Till this much from PaddedBlockCipher this takes care of the padding
    // automatically, abstractly.
    // if we would have used CBCBlockCipher that takes care of padding manually
    // for each block of data
    // and more low level manual process. ( check docs )

    print(
        '-------------------encryptedData AES : ${base64Encode(encryptedData)}\n\n');
    print('-------------------AES iv: ${base64.encode(iv)} ');

    print(
        '-------------------AES iv Non Encoded: ${base64Decode(base64Encode(iv))}');
    print('-------------------AES key: $key');

// Encrypt the AES key using the existing RSA encryption function
    final encryptedKey =
        encryptData(key, rsaPublicKey); // Assuming encryptData() is available

    debugPrint('-------------------encrypted AES key : $encryptedKey');

    return {
      'encryptedData': base64Encode(encryptedData),
      'encryptedKey': encryptedKey,
      'iv': base64Encode(iv),
    };
  }

  String encryptData(Uint8List dataBytes, String publicKey) {
    String encoded = "";
    try {
      // Decode the public key from Base64
      var publicBytes = base64Decode(publicKey);

      // Parse ASN1 format to extract RSA public key components
      var parser = ASN1Parser(publicBytes);
      var topLevelSeq = parser.nextObject() as ASN1Sequence;

      //
      debugPrint(
          '---------------publicKeyBitString : ${topLevelSeq.elements}\n\n');

      var modulus = topLevelSeq.elements[0] as ASN1Integer;
      var exponent = topLevelSeq.elements[1] as ASN1Integer;

      // Create a cipher instance using RSA with OAEP padding
      // final digest = SHA256Digest();
      // final mgf1 = MaskedGenParameter(digest);
      // final oaepParams = OAEPEncodingParameters(digest, mgf1, null);

      final cipher = OAEPEncoding(
        RSAEngine(),
      )..init(
          true, // true for encryption
          PublicKeyParameter<RSAPublicKey>(
            RSAPublicKey(
              modulus.valueAsBigInteger,
              exponent.valueAsBigInteger,
            ),
          ),
        );

      // Encrypt the data
      var encrypted = cipher.process(dataBytes);

      // Encode the encrypted data into Base64
      encoded = base64Encode(encrypted);
    } catch (e) {
      print('Error during encryption: $e');
    }
    return encoded;
  }
}
