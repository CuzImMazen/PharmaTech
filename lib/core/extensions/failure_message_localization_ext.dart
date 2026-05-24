import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

extension FailureLocalization on Failure {
  String localizedMessage(BuildContext context) {
    return switch (this) {
      NetworkFailure() => context.tr.error_network,

      TimeoutFailure() => context.tr.error_timeout,

      UnknownFailure() => context.tr.error_unknown,

      SessionExpiredFailure() => context.tr.session_expired,

      ParsingFailure() => context.tr.error_parsing,

      RateLimitFailure(:final retryAfterSeconds) =>
        context.tr.error_too_many_attempts(retryAfterSeconds.toString()),

      // UI validators block the small stuff. If something slips through,
      // just pass the server's response message directly.
      ValidationFailure(message: final msg) => msg,

      AuthFailure(:final type) => switch (type) {
        AuthFailureType.invalidCredentials =>
          context.tr.auth_invalid_credentials,

        AuthFailureType.emailAlreadyExists =>
          context.tr.auth_email_already_exists,

        AuthFailureType.phoneNumberAlreadyExists =>
          context.tr.auth_phone_already_exists,

        AuthFailureType.emailNotVerified => context.tr.auth_email_not_verified,

        AuthFailureType.invalidResetToken =>
          context.tr.auth_invalid_reset_token,

        AuthFailureType.actionDenied => context.tr.auth_action_denied,
        AuthFailureType.googleSignInFailed =>
          context.tr.auth_google_sign_in_failed,
        AuthFailureType.googleSignInCanceled =>
          context.tr.auth_google_sign_in_canceled,
      },
    };
  }
}
