import 'package:pharmacy_app/core/error/failure.dart';

class ApiParser {
  /// Parses a direct object response.
  ///
  /// Expected response shape:
  /// {
  ///   "id": 1,
  ///   "name": "Damascus"
  /// }
  ///
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

  /// Parses a direct list response.
  ///
  /// Expected response shape:
  /// [
  ///   {
  ///     "id": 1,
  ///     "name": "Damascus"
  ///   },
  ///   {
  ///     "id": 2,
  ///     "name": "Aleppo"
  ///   }
  /// ]
  ///
  static List<T> parseList<T>(
    dynamic data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      if (data is List) {
        return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
      }
      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }

  /// Parses a wrapped single object response.
  ///
  /// Expected response shape:
  /// {
  ///   "data": {
  ///     "id": 1,
  ///     "name": "Damascus"
  ///   }
  /// }
  ///
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

  /// Parses a wrapped list response.
  ///
  /// Expected response shape:
  /// {
  ///   "data": [
  ///     {
  ///       "id": 1,
  ///       "name": "Damascus"
  ///     },
  ///     {
  ///       "id": 2,
  ///       "name": "Aleppo"
  ///     }
  ///   ]
  /// }
  ///
  static List<T> parseWrappedList<T>(
    dynamic response,
    String wrapperKey,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final data = response[wrapperKey];

      if (data is List) {
        return data.map((e) => fromJson(e as Map<String, dynamic>)).toList();
      }

      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }

  /// Parses a wrapped primitive response.
  ///
  /// Expected response shape:
  /// {
  ///   "message": "Success"
  /// }
  ///
  /// Usage:
  /// final message = ApiParser.parseWrappedPrimitive<String>(
  ///   response.data,
  ///   'message',
  /// );
  ///
  static T parseWrappedPrimitive<T>(dynamic response, String wrapperKey) {
    try {
      final data = response[wrapperKey];

      if (data is T) {
        return data;
      }

      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }

  /// Parses a direct primitive response.
  ///
  /// Expected response shape:
  /// "Success"
  /// or
  /// 123
  /// or
  /// true
  ///
  static T parsePrimitive<T>(dynamic data) {
    try {
      if (data is T) {
        return data;
      }

      throw const ParsingFailure();
    } catch (_) {
      throw const ParsingFailure();
    }
  }
}
