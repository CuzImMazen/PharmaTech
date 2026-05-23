import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/authentication/data/models/login_response_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register_request_model.dart';

abstract class AuthRepository {
  // ================= AUTH ================= //

  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
    String? deviceName,
  });

  Future<Either<Failure, LoginResponseModel>> loginWithGoogle({
    required String idToken,
    String? deviceName,
  });

  Future<Either<Failure, void>> register(RegisterRequestModel model);

  Future<Either<Failure, void>> refresh({
    required String refreshToken,
    String? deviceName,
  });

  Future<Either<Failure, void>> logout({String? refreshToken});

  Future<Either<Failure, void>> logoutAll();

  // ================= EMAIL Verification ================= //

  Future<Either<Failure, void>> resendVerificationEmail({
    required String email,
  });

  // ================= PASSWORD ================= //

  Future<Either<Failure, void>> forgotPassword({required String email});

  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String token,
  });

  // ================= TOKEN MANAGEMENT ================= //

  Future<String?> getAccessToken();
  Future<void> saveAccessToken(String token);
  Future<void> clearAccessToken();

  Future<String?> getRefreshToken();
  Future<void> saveRefreshToken(String token);
  Future<void> clearRefreshToken();

  Future<void> clearAllTokens();
}
