import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/authentication/cubit/register/register_state.dart';
import 'package:pharmacy_app/features/authentication/data/models/register/register_request_model.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepository})
    : super(const RegisterState.initial());

  final AuthRepository authRepository;

  Future<void> register({required RegisterRequestModel model}) async {
    emit(const RegisterState.loading());

    final result = await authRepository.register(model);

    if (isClosed) return;

    result.fold(
      (failure) {
        emit(RegisterState.failure(failure));
      },
      (_) {
        emit(const RegisterState.success());
      },
    );
  }
}
