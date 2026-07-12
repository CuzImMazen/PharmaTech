import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/profile/cubit/profile_state.dart';
import 'package:pharmacy_app/features/authentication/data/repo/auth_repository.dart';

/// Drives the Profile screen. On [load] it seeds from the cached user for an
/// instant render, then fetches the fresh user from `GET /user`. [refresh]
/// re-fetches without the cached seed.
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.authRepository}) : super(const ProfileState());

  final AuthRepository authRepository;

  Future<void> load() async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, failure: null));

    // Seed from the cache for an instant render before the network resolves.
    final cached = await authRepository.getCachedUser();
    if (isClosed) return;
    if (cached != null) emit(state.copyWith(user: cached));

    final result = await authRepository.fetchUser();
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (user) => emit(
        state.copyWith(isLoading: false, user: user, failure: null),
      ),
    );
  }

  Future<void> refresh() async {
    if (isClosed) return;
    emit(state.copyWith(isRefreshing: true, failure: null));
    final result = await authRepository.fetchUser();
    if (isClosed) return;
    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (user) => emit(
        state.copyWith(isRefreshing: false, user: user, failure: null),
      ),
    );
  }
}
