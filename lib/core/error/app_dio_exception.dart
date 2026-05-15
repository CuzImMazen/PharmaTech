import 'package:dio/dio.dart';
import 'failure.dart';

class AppDioException extends DioException {
  final Failure failure;

  AppDioException({
    required super.requestOptions,
    super.response,
    required super.type,
    required this.failure,
  });
}
