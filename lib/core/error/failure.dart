import 'package:pharmacy_app/core/enums/enums.dart';

sealed class Failure {}

class NetworkFailure extends Failure {}

class TimeoutFailure extends Failure {}

class UnknownFailure extends Failure {}

class AuthFailure extends Failure {
  final AuthError type;
  AuthFailure(this.type);
}
