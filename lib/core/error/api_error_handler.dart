import 'package:dio/dio.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';

class ApiErrorHandler {
  static Failure handle(dynamic error) {
    if (error is Failure) {
      return error;
    }
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const TimeoutFailure();

        case DioExceptionType.connectionError:
          return const NetworkFailure();

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);

        default:
          return const UnknownFailure();
      }
    }

    return const UnknownFailure();
  }

  static Failure _handleBadResponse(Response? response) {
    if (response == null) return const UnknownFailure();

    final statusCode = response.statusCode;
    final responseData = response.data;

    // ============== 1. HANDLE RATE LIMITS (Status 429) ============== //
    if (statusCode == 429) {
      String serverMessage = 'Too many attempts. Please try again later.';

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('message')) {
        serverMessage = responseData['message'];
      }

      // Read Laravel's 'Retry-After' header (usually an integer representing seconds)
      final retryAfterHeader = response.headers.value('retry-after');
      final retryAfterSeconds = int.tryParse(retryAfterHeader ?? '') ?? 60;

      return RateLimitFailure(
        message: serverMessage,
        retryAfterSeconds: retryAfterSeconds,
      );
    }

    if (responseData is Map<String, dynamic>) {
      final String serverMessage = responseData['message'] ?? '';

      // 2. Handle Validation Failures (Status 422)
      if (statusCode == 422) {
        final errors = responseData['errors'];

        if (errors is Map<String, dynamic>) {
          if (errors.containsKey('email')) {
            final emailMsg = errors['email']!.first.toString();
            if (emailMsg.contains('already been taken')) {
              return AuthFailure(
                AuthFailureType.emailAlreadyExists,
                message: emailMsg,
              );
            }
          }
          if (errors.containsKey('phone_number')) {
            final phoneMsg = errors['phone_number']!.first.toString();
            if (phoneMsg.contains('already been taken')) {
              return AuthFailure(
                AuthFailureType.phoneNumberAlreadyExists,
                message: phoneMsg,
              );
            }
          }

          return ValidationFailure(
            message: serverMessage,
            errors: errors.map(
              (key, value) => MapEntry(key, List<dynamic>.from(value)),
            ),
          );
        }
      }

      // 3. Handle Unauthorized / Expired States (Status 401)
      if (statusCode == 401) {
        if (serverMessage == 'Invalid email or password') {
          return AuthFailure(
            AuthFailureType.invalidCredentials,
            message: serverMessage,
          );
        }
        if (serverMessage.contains("Google")) {
          return AuthFailure(
            AuthFailureType.googleSignInFailed,
            message: serverMessage,
          );
        }

        return const SessionExpiredFailure();
      }

      // 4. Email Guards & Link Tampering (Status 403)
      if (statusCode == 403) {
        if (serverMessage.contains('verification link')) {
          return AuthFailure(
            AuthFailureType.emailNotVerified,
            message: serverMessage,
          );
        }

        return AuthFailure(
          AuthFailureType.emailNotVerified,
          message: serverMessage,
        );
      }

      // 5. Bad Requests / Token Resets (Status 400)
      if (statusCode == 400) {
        return AuthFailure(
          AuthFailureType.invalidResetToken,
          message: serverMessage,
        );
      }
    }

    return const UnknownFailure();
  }
}
