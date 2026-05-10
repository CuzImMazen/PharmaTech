import 'package:pharmacy_app/core/error/validator_error.dart';

class ValidatorsManager {
  static EmailInputError? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailInputError.empty; // Email is required
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return EmailInputError.invalidFormat; // Invalid email format
    }
    return null; // Valid email
  }

  static PasswordInputError? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordInputError.empty; // Password is required
    }
    if (value.length < 8) {
      return PasswordInputError
          .tooShort; // Password must be at least 8 characters
    }
    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    // }
    return null; // Valid password
  }

  static ConfirmPasswordInputError? confirmPasswordValidator(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return ConfirmPasswordInputError.empty; // Confirm password is required
    }
    if (password != confirmPassword) {
      return ConfirmPasswordInputError.mismatch; // Passwords do not match
    }
    return null; // Valid confirm password
  }

  static FirstNameInputError? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return FirstNameInputError.empty; // First name is required
    }
    return null; // Valid first name
  }

  static LastNameInputError? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LastNameInputError.empty; // Last name is required
    }
    return null; // Valid last name
  }

  static PhoneInputError? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return PhoneInputError.empty;
    }

    final syrianPhoneRegex = RegExp(r'^09\d{8}$');

    if (!syrianPhoneRegex.hasMatch(value)) {
      return PhoneInputError.invalidFormat;
    }

    return null;
  }

  static PharmacyNameInputError? pharmacyNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return PharmacyNameInputError.empty; // Pharmacy name is required
    }
    return null; // Valid pharmacy name
  }

  static PharmacyLicenseInputError? pharmacyLicenseValidator(String? value) {
    if (value == null || value.isEmpty) {
      return PharmacyLicenseInputError.empty; // Pharmacy license is required
    }
    return null; // Valid pharmacy license
  }
}
