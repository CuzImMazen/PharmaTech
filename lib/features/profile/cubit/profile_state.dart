import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? user,
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    Failure? failure,
  }) = _ProfileState;
}
