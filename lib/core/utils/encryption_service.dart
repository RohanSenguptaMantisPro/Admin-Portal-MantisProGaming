import 'package:admin_portal_mantis_pro_gaming/core/utils/aes_encryption.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/rsa_encryption.dart';

class EncryptionService {
  const EncryptionService({
    required this.aesService,
    required this.rsaService,
  });

  //to be added in injection dependencies. EncryptionService()
  // could also instantiate the aes and rsa service here.
  // so that instantiating one EncryptionService is enough no need to
  // provide other instantiations in dependency injection.
  final AESService aesService;
  final RSAService rsaService;

  Map<String, String>? encrypt(String data) {
    final result = aesService.encryptDataWithAES(
      data,
      rsaService,
    );

    if (result == null) {
      return null;
    } else {
      return result;
    }
  }
}
