import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth_interceptor.dart';

class DioApiHelper {
  final Dio _dio;

  DioApiHelper({
    required String baseUrl,
    required AuthInterceptor authInterceptor,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: const Duration(seconds: 15),
           receiveTimeout: const Duration(seconds: 15),
           sendTimeout: const Duration(seconds: 15),
           headers: {
             'Content-Type': 'application/json',
             'Accept': 'application/json',
           },
         ),
       ) {
    // ================= INTERCEPTORS ORDER ================= //

    // 1. Logger FIRST (so it logs final request state)
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 120,
        ),
      );
    }

    // 2. Auth interceptor (adds token + refresh logic)
    _dio.interceptors.add(authInterceptor);
  }

  // ================= GET ================= //

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipAuth = false,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {...?options?.extra, 'skipAuth': skipAuth},
      ),
    );
  }

  // ================= POST ================= //

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipAuth = false,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {...?options?.extra, 'skipAuth': skipAuth},
      ),
    );
  }

  // ================= PUT ================= //

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipAuth = false,
  }) {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {...?options?.extra, 'skipAuth': skipAuth},
      ),
    );
  }

  // ================= DELETE ================= //

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool skipAuth = false,
  }) {
    return _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: (options ?? Options()).copyWith(
        extra: {...?options?.extra, 'skipAuth': skipAuth},
      ),
    );
  }
}
