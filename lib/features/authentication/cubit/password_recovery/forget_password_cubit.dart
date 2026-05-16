import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/forget_password_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(ForgetPasswordState.initial());
  final AuthRepository _authRepository;

  Future<void> forgetPassword({required String email}) async {
    emit(const ForgetPasswordState.loading());

    final result = await _authRepository.forgotPassword(email: email);

    result.fold(
      (failure) => emit(ForgetPasswordState.failure(failure)),
      (_) => emit(const ForgetPasswordState.success()),
    );
  }
}
