import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/repositories/auth/auth_repository.dart';
import 'package:pharmacy_app/core/state/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(const AuthState.initial());

  /// Logic to run when the app first opens
  Future<void> checkAuthStatus() async {
    final token = await _repository.getToken();
    if (token != null) {
      emit(AuthState.authenticated(token: token));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  /// Called after successful login/registration

  Future<void> updateAuthStatus({
    required String token,
    required bool rememberMe,
  }) async {
    if (rememberMe) {
      await _repository.saveToken(token);
    }
    emit(AuthState.authenticated(token: token));
  }

  /// Clears the session and sends the user back to Login
  Future<void> logout() async {
    await _repository.clearToken();
    emit(const AuthState.unauthenticated());
  }
}
