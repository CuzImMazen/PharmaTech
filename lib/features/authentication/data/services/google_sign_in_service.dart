import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  GoogleSignInService({required GoogleSignIn googleSignIn})
    : _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;

  Future<({String accessToken, String? idToken, String? serverAuthCode})?>
  signIn() async {
    await _googleSignIn.signOut();

    final account = await _googleSignIn.signIn();
    if (account == null) return null;

    final auth = await account.authentication;

    return (
      accessToken: auth.accessToken ?? '',
      idToken: auth.idToken,
      serverAuthCode: account.serverAuthCode,
    );
  }
}
