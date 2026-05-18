// location_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/api_error_handler.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/network/api_parser.dart';
import 'package:pharmacy_app/core/network/api_routes.dart';
import 'package:pharmacy_app/core/network/dio_helper.dart';
import 'package:pharmacy_app/features/location/data/models/location_models.dart';
import 'package:pharmacy_app/features/location/data/repo/location_repo.dart';

class LocationRepositoryImpl implements LocationRepository {
  final DioApiHelper api;

  LocationRepositoryImpl({required this.api});

  @override
  Future<Either<Failure, List<GovernorateModel>>> getGovernorates() async {
    try {
      final response = await api.get(ApiRoutes.governorates, skipAuth: true);

      final governorates = ApiParser.parseWrappedList(
        response.data,
        'data',
        GovernorateModel.fromJson,
      );

      return Right(governorates);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
