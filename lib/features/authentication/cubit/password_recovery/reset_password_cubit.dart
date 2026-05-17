import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/reset_password_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(ResetPasswordState.initial());
  final AuthRepository _authRepository;

  Future<void> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String token,
  }) async {
    emit(const ResetPasswordState.loading());

    final result = await _authRepository.resetPassword(
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      token: token,
    );
    if (isClosed) return;
    result.fold(
      (failure) => emit(ResetPasswordState.failure(failure)),
      (_) => emit(const ResetPasswordState.success()),
    );
  }
}
