import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/authentication/data/models/complete_profile/complete_profile_response_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/login/login_response_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_details_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_request_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';

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
  Future<Either<Failure, CompleteProfileResponseModel>> completeProfile(
    RegisterDetailsModel model,
  );

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

  // ================= USER PROFILE MANAGEMENT ================= //

  /// Reads the fast local JSON string and returns the deserialized User object.
  Future<UserModel?> getCachedUser();

  /// Overwrites the local profile cache .

  Future<void> saveUserCache(UserModel user);

  /// Clears specifically the profile cache data.
  Future<void> clearUserCache();

  // ================= TOKEN MANAGEMENT ================= //

  Future<String?> getAccessToken();
  Future<void> saveAccessToken(String token);
  Future<void> clearAccessToken();

  Future<String?> getRefreshToken();
  Future<void> saveRefreshToken(String token);
  Future<void> clearRefreshToken();

  Future<void> clearAllTokens();
}
