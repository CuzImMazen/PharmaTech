import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/authentication/cubit/complete_profile/complete_profile_state.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_details_model.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit({required this.authRepository})
    : super(const CompleteProfileState.initial());

  final AuthRepository authRepository;
  Future<void> completeProfile({required RegisterDetailsModel model}) async {
    emit(const CompleteProfileState.loading());

    final result = await authRepository.completeProfile(model);
    result.fold(
      (failure) => emit(CompleteProfileState.failure(failure)),
      (response) => emit(CompleteProfileState.success(response)),
    );
  }
}
