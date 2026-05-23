// core/services/google_auth_service.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<void> init() async {
    await _googleSignIn.initialize(
      serverClientId: dotenv.env['GOOGLE_CLIENT_ID'],
    );
  }

  // core/services/google_auth_service.dart
  Future<Either<Failure, String?>> getGoogleIdToken() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        return Left(
          AuthFailure(
            AuthFailureType.googleSignInFailed,
            message: 'Google sign-in failed. No ID token received.',
          ),
        );
      }

      return Right(idToken);
    } catch (e) {
      return Left(
        AuthFailure(
          AuthFailureType.googleSignInFailed,
          message: 'An error occurred during Google sign-in.',
        ),
      );
    }
  }

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }
}
