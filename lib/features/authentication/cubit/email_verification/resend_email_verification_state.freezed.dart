// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_email_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ResendEmailVerificationState {
  int get remainingSeconds => throw _privateConstructorUsedError;
  ScreenState get screenState => throw _privateConstructorUsedError;

  /// Create a copy of ResendEmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResendEmailVerificationStateCopyWith<ResendEmailVerificationState>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResendEmailVerificationStateCopyWith<$Res> {
  factory $ResendEmailVerificationStateCopyWith(
    ResendEmailVerificationState value,
    $Res Function(ResendEmailVerificationState) then,
  ) =
      _$ResendEmailVerificationStateCopyWithImpl<
        $Res,
        ResendEmailVerificationState
      >;
  @useResult
  $Res call({int remainingSeconds, ScreenState screenState});
}

/// @nodoc
class _$ResendEmailVerificationStateCopyWithImpl<
  $Res,
  $Val extends ResendEmailVerificationState
>
    implements $ResendEmailVerificationStateCopyWith<$Res> {
  _$ResendEmailVerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResendEmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null, Object? screenState = null}) {
    return _then(
      _value.copyWith(
            remainingSeconds: null == remainingSeconds
                ? _value.remainingSeconds
                : remainingSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            screenState: null == screenState
                ? _value.screenState
                : screenState // ignore: cast_nullable_to_non_nullable
                      as ScreenState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ResendEmailVerificationStateImplCopyWith<$Res>
    implements $ResendEmailVerificationStateCopyWith<$Res> {
  factory _$$ResendEmailVerificationStateImplCopyWith(
    _$ResendEmailVerificationStateImpl value,
    $Res Function(_$ResendEmailVerificationStateImpl) then,
  ) = __$$ResendEmailVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int remainingSeconds, ScreenState screenState});
}

/// @nodoc
class __$$ResendEmailVerificationStateImplCopyWithImpl<$Res>
    extends
        _$ResendEmailVerificationStateCopyWithImpl<
          $Res,
          _$ResendEmailVerificationStateImpl
        >
    implements _$$ResendEmailVerificationStateImplCopyWith<$Res> {
  __$$ResendEmailVerificationStateImplCopyWithImpl(
    _$ResendEmailVerificationStateImpl _value,
    $Res Function(_$ResendEmailVerificationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ResendEmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? remainingSeconds = null, Object? screenState = null}) {
    return _then(
      _$ResendEmailVerificationStateImpl(
        remainingSeconds: null == remainingSeconds
            ? _value.remainingSeconds
            : remainingSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        screenState: null == screenState
            ? _value.screenState
            : screenState // ignore: cast_nullable_to_non_nullable
                  as ScreenState,
      ),
    );
  }
}

/// @nodoc

class _$ResendEmailVerificationStateImpl extends _ResendEmailVerificationState {
  const _$ResendEmailVerificationStateImpl({
    this.remainingSeconds = 0,
    this.screenState = const InitialState(),
  }) : super._();

  @override
  @JsonKey()
  final int remainingSeconds;
  @override
  @JsonKey()
  final ScreenState screenState;

  @override
  String toString() {
    return 'ResendEmailVerificationState(remainingSeconds: $remainingSeconds, screenState: $screenState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResendEmailVerificationStateImpl &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.screenState, screenState) ||
                other.screenState == screenState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remainingSeconds, screenState);

  /// Create a copy of ResendEmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResendEmailVerificationStateImplCopyWith<
    _$ResendEmailVerificationStateImpl
  >
  get copyWith =>
      __$$ResendEmailVerificationStateImplCopyWithImpl<
        _$ResendEmailVerificationStateImpl
      >(this, _$identity);
}

abstract class _ResendEmailVerificationState
    extends ResendEmailVerificationState {
  const factory _ResendEmailVerificationState({
    final int remainingSeconds,
    final ScreenState screenState,
  }) = _$ResendEmailVerificationStateImpl;
  const _ResendEmailVerificationState._() : super._();

  @override
  int get remainingSeconds;
  @override
  ScreenState get screenState;

  /// Create a copy of ResendEmailVerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResendEmailVerificationStateImplCopyWith<
    _$ResendEmailVerificationStateImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
