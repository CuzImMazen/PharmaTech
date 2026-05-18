import 'package:dartz/dartz.dart';

import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/core/storage/secure/secure_storage_service.dart';
import 'package:pharmacy_app/features/authentication/data/models/login_response_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register_request_model.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.api, required this.secureStorageService});

  final DioApiHelper api;
  final SecureStorageService secureStorageService;

  // =====================================================
  // 🔐 AUTH
  // =====================================================

  @override
  Future<Either<Failure, LoginResponseModel>> login({
    required String email,
    required String password,
    String? deviceName,
  }) async {
    try {
      final response = await api.post(
        ApiRoutes.login,
        data: {'email': email, 'password': password, 'device_name': deviceName},
        skipAuth: true,
      );

      final model = ApiParser.parseWrapped(
        response.data,
        'data',
        LoginResponseModel.fromJson,
      );

      return Right(model);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterRequestModel model) async {
    try {
      final response = await api.post(
        ApiRoutes.register,
        data: model.toJson(),
        skipAuth: true,
      );

      // Expected response shape:
      // {
      //   "message": "Registration successful"
      // }
      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> refresh({
    required String refreshToken,
    String? deviceName,
  }) async {
    try {
      final response = await api.post(
        ApiRoutes.refresh,
        data: {
          'refresh_token': refreshToken,
          'device_name': deviceName ?? 'auth_token',
        },
        skipAuth: true,
      );

      // Expected response shape:
      // {
      //   "message": "Token refreshed"
      // }
      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout({String? refreshToken}) async {
    try {
      final response = await api.post(
        ApiRoutes.logout,
        data: {'refresh_token': refreshToken},
      );

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> logoutAll() async {
    try {
      final response = await api.post(ApiRoutes.logoutAll);

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  // =====================================================
  // 📧 EMAIL
  // =====================================================

  @override
  Future<Either<Failure, void>> verifyEmail({
    required int id,
    required String hash,
  }) async {
    try {
      final response = await api.get('/verify-email/$id/$hash', skipAuth: true);

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> resendVerificationEmail({
    required String email,
  }) async {
    try {
      final response = await api.post(
        ApiRoutes.emailResend,
        data: {'email': email},
        skipAuth: true,
      );

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  // =====================================================
  // 🔑 PASSWORD
  // =====================================================

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      final response = await api.post(
        ApiRoutes.forgotPassword,
        data: {'email': email},
        skipAuth: true,
      );

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String token,
  }) async {
    try {
      final response = await api.post(
        ApiRoutes.resetPassword,
        data: {
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'token': token,
        },
        skipAuth: true,
      );

      ApiParser.parse<Map<String, dynamic>>(response.data, (json) => json);

      return const Right(null);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  // =====================================================
  // 🧠 TOKEN STORAGE
  // =====================================================

  @override
  Future<String?> getAccessToken() async => null;

  @override
  Future<void> saveAccessToken(String token) async {}

  @override
  Future<void> clearAccessToken() async {}

  @override
  Future<String?> getRefreshToken() async => null;

  @override
  Future<void> saveRefreshToken(String token) async {}

  @override
  Future<void> clearRefreshToken() async {}

  @override
  Future<void> clearAllTokens() async {}
}
