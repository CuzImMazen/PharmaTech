import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
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
      );

      final model = ApiParser.parseWrapped(
        response.data,
        'data',
        LoginResponseModel.fromJson,
      );

      return Right(model);
    } on ParsingFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterRequestModel model) async {
    try {
      await api.post(ApiRoutes.register, data: model.toJson(), skipAuth: true);

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> refresh({
    required String refreshToken,
    String? deviceName,
  }) async {
    try {
      await api.post(
        ApiRoutes.refresh,
        data: {
          'refresh_token': refreshToken,
          'device_name': deviceName ?? 'auth_token',
        },
        skipAuth: true,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logout({String? refreshToken}) async {
    try {
      await api.post(ApiRoutes.logout, data: {'refresh_token': refreshToken});

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logoutAll() async {
    try {
      await api.post(ApiRoutes.logoutAll);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
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
      await api.get('/verify-email/$id/$hash', skipAuth: true);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resendVerificationEmail({
    required String email,
  }) async {
    try {
      await api.post(
        ApiRoutes.emailResend,
        data: {'email': email},
        skipAuth: true,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  // =====================================================
  // 🔑 PASSWORD
  // =====================================================

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await api.post(
        ApiRoutes.forgotPassword,
        data: {'email': email},
        skipAuth: true,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
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
      await api.post(
        ApiRoutes.resetPassword,
        data: {
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'token': token,
        },
        skipAuth: true,
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }

  // =====================================================
  // 🧠 TOKEN STORAGE (implement later with SecureStorage)
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
