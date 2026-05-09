import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

extension FailureLocalization on Failure {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case NetworkFailure():
        return context.tr.error_network;

      case TimeoutFailure():
        return context.tr.error_timeout;

      case UnknownFailure():
        return context.tr.error_unknown;

      case AuthFailure(:final type):
        switch (type) {
          case AuthFailureType.emailNotRegistered:
            return context.tr.auth_email_not_registered;
          case AuthFailureType.wrongPassword:
            return context.tr.auth_wrong_password;
        }
    }
  }
}
