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
      case PasswordInputError.atleastOneLetter:
        return context.tr.password_atleast_one_letter;
    }
  }
}

extension ConfirmPasswordInputErrorExt on ConfirmPasswordInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case ConfirmPasswordInputError.empty:
        return context.tr.auth_confirm_password_is_required;
      case ConfirmPasswordInputError.mismatch:
        return context.tr.auth_passwords_do_not_match;
    }
  }
}

extension FirstNameInputErrorExt on FirstNameInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case FirstNameInputError.empty:
        return context.tr.auth_first_name_is_required;
    }
  }
}

extension LastNameInputErrorExt on LastNameInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case LastNameInputError.empty:
        return context.tr.auth_last_name_is_required;
    }
  }
}

extension PhoneInputErrorExt on PhoneInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case PhoneInputError.empty:
        return context.tr.auth_phone_is_required;
      case PhoneInputError.invalidFormat:
        return context.tr.auth_invalid_phone;
    }
  }
}

extension PharmacyNameInputErrorExt on PharmacyNameInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case PharmacyNameInputError.empty:
        return context.tr.auth_pharmacy_name_is_required;
    }
  }
}

extension PharmacyLicenseInputErrorExt on PharmacyLicenseInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case PharmacyLicenseInputError.empty:
        return context.tr.pharmacy_license_required;
    }
  }
}

extension GovernorateInputErrorExt on GovernorateInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case GovernorateInputError.empty:
        return context.tr.governorate_required;
    }
  }
}

extension CityInputErrorExt on CityInputError {
  String localizedMessage(BuildContext context) {
    switch (this) {
      case CityInputError.empty:
        return context.tr.city_required;
    }
  }
}
