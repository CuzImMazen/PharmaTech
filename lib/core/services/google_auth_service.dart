// core/services/google_auth_service.dart
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
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
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return Left(
          AuthFailure(
            AuthFailureType.googleSignInCanceled,
            message: 'Google sign-in was canceled by the user.',
          ),
        );
      }
      return Left(
        AuthFailure(
          AuthFailureType.googleSignInFailed,
          message: 'Google sign-in failed',
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == 'sign_in_canceled') {
        return Left(
          AuthFailure(
            AuthFailureType.googleSignInCanceled,
            message: 'Google sign-in was canceled by the user.',
          ),
        );
      }
      return Left(
        AuthFailure(
          AuthFailureType.googleSignInFailed,
          message: 'Google sign-in failed: ${e.message}',
        ),
      );
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
