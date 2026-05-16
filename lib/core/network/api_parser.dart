import 'package:pharmacy_app/core/error/failure.dart';

class ApiParser {
  static T parse<T>(dynamic data, T Function(Map<String, dynamic>) fromJson) {
    try {
      if (data is Map<String, dynamic>) {
        return fromJson(data);
      }
      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }

  static T parseWrapped<T>(
    dynamic response,
    String wrapperKey,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final data = response[wrapperKey];

      if (data is Map<String, dynamic>) {
        return fromJson(data);
      }

      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }
}
