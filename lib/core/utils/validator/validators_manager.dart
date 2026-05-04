import 'package:pharmacy_app/core/enums/enums.dart';

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
}
