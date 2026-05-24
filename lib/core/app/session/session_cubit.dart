import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';
import 'package:pharmacy_app/core/app/session/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepository;

  SessionCubit({required this.authRepository})
    : super(const SessionState.initial());

  // 1. Accepts a User profile object instead of raw crypto strings
  void setAuthenticated(UserModel user) {
    emit(SessionState.authenticated(user: user));
  }

  // 2. Clear tokens out of local storage on logout
  void setUnauthenticated() async {
    await authRepository.clearAllTokens();
    emit(const SessionState.unauthenticated());
  }
}
