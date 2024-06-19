import 'dart:convert';
import 'dart:typed_data';

import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:asn1lib/asn1lib.dart';
import 'package:pointycastle/export.dart';

class RSAService {
  const RSAService();

  String? encryptData(Uint8List dataBytes) {
    String encoded = '';

    try{
      final publicBytes = base64Decode(kPublicKey);
      final parser = ASN1Parser(publicBytes);
      final topLevelSeq = parser.nextObject() as ASN1Sequence;

      final modulus = topLevelSeq.elements[0] as ASN1Integer;
      final exponent = topLevelSeq.elements[1] as ASN1Integer;

      final cipher = OAEPEncoding(RSAEngine())
        ..init(
          true,
          PublicKeyParameter<RSAPublicKey>(
            RSAPublicKey(
              modulus.valueAsBigInteger,
              exponent.valueAsBigInteger,
            ),
          ),
        );

      final encrypted = cipher.process(dataBytes);
      encoded = base64Encode(encrypted);

      return encoded;
    }catch (error) {
      return null;
    }
  }
}
