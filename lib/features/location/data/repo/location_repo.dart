import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/location/data/models/location_models.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<GovernorateModel>>> getGovernorates();
}
