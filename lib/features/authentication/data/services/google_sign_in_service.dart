import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  GoogleSignInService({required GoogleSignIn googleSignIn})
    : _googleSignIn = googleSignIn;

  final GoogleSignIn _googleSignIn;

  Future<({String accessToken, String? idToken, String? serverAuthCode})?>
  signIn() async {
    final account = await _googleSignIn.signIn();
    if (account == null) return null;

    final auth = await account.authentication;
    final accessToken = auth.accessToken;
    if (accessToken == null || accessToken.isEmpty) return null;

    return (
      accessToken: accessToken,
      idToken: auth.idToken,
      serverAuthCode: account.serverAuthCode,
    );
  }
}
