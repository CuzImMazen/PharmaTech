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

class AuthFailure extends Failure {
  final AuthFailureType type;
  const AuthFailure(this.type);
}
