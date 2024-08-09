import 'package:google_sign_in/google_sign_in.dart';

class CustomSignUpClient {
  CustomSignUpClient({required this.googleSignIn});

  final GoogleSignIn googleSignIn;

  Future<String> signInSilently() async {
    try {
      final GoogleSignInAccount? account = await googleSignIn.signInSilently();
      if (account == null) {
        throw Exception('No signed in account found');
      }
      final GoogleSignInAuthentication auth = await account.authentication;
      return auth.idToken ?? '';
    } catch (e) {
      throw Exception('Failed to sign in silently: $e');
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
  }

  Future<void> disconnect() async {
    await googleSignIn.disconnect();
  }
}
