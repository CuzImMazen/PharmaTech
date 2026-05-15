import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/auth/data/repo/auth_repository.dart';
import 'package:pharmacy_app/core/app/session/session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final AuthRepository authRepository;

  SessionCubit({required this.authRepository})
    : super(const SessionState.initial());

  void setAuthenticated(String accessToken, String refreshToken) {
    emit(
      SessionState.authenticated(
        accessToken: accessToken,
        refreshToken: refreshToken,
      ),
    );
  }

  void setUnauthenticated() {
    emit(const SessionState.unauthenticated());
  }
}
