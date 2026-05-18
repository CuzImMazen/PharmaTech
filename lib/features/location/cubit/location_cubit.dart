import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/location/cubit/location_state.dart';
import 'package:pharmacy_app/features/location/data/repo/location_repo.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository repository;

  LocationCubit({required this.repository})
    : super(const LocationState.initial());

  Future<void> loadGovernorates() async {
    emit(const LocationState.loading());

    final result = await repository.getGovernorates();

    result.fold(
      (failure) {
        emit(LocationState.failure(failure: failure));
      },
      (governorates) {
        emit(LocationState.loaded(governorates: governorates));
      },
    );
  }
}
