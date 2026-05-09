import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/error/validator_error.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

extension EmailInputErrorExt on EmailInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case EmailInputError.empty:
        return context.tr.auth_email_is_required;
      case EmailInputError.invalidFormat:
        return context.tr.auth_invalid_email;
    }
  }
}

extension PasswordInputErrorExt on PasswordInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case PasswordInputError.empty:
        return context.tr.auth_password_is_required;
      case PasswordInputError.tooShort:
        return context.tr.auth_password_min_length;
    }
  }
}
