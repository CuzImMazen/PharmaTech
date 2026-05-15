import 'package:pharmacy_app/core/error/failure_types.dart';

sealed class Failure {
  const Failure();
}

class NetworkFailure extends Failure {
  const NetworkFailure();
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();
}

class UnknownFailure extends Failure {
  const UnknownFailure();
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure();
}

class RateLimitFailure extends Failure {
  final String message;
  final int retryAfterSeconds;

  const RateLimitFailure({
    required this.message,
    required this.retryAfterSeconds,
  });
}

class ValidationFailure extends Failure {
  final String message;
  final Map<String, List<dynamic>> errors;

  const ValidationFailure({required this.message, required this.errors});
}

class AuthFailure extends Failure {
  final AuthFailureType type;
  final String message;

  const AuthFailure(this.type, {required this.message});
}
