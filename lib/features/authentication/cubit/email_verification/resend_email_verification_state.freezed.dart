// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resend_email_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResendEmailVerificationState {

 int get remainingSeconds; ScreenState get screenState;
/// Create a copy of ResendEmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResendEmailVerificationStateCopyWith<ResendEmailVerificationState> get copyWith => _$ResendEmailVerificationStateCopyWithImpl<ResendEmailVerificationState>(this as ResendEmailVerificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResendEmailVerificationState&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.screenState, screenState) || other.screenState == screenState));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds,screenState);

@override
String toString() {
  return 'ResendEmailVerificationState(remainingSeconds: $remainingSeconds, screenState: $screenState)';
}


}

/// @nodoc
abstract mixin class $ResendEmailVerificationStateCopyWith<$Res>  {
  factory $ResendEmailVerificationStateCopyWith(ResendEmailVerificationState value, $Res Function(ResendEmailVerificationState) _then) = _$ResendEmailVerificationStateCopyWithImpl;
@useResult
$Res call({
 int remainingSeconds, ScreenState screenState
});




}
/// @nodoc
class _$ResendEmailVerificationStateCopyWithImpl<$Res>
    implements $ResendEmailVerificationStateCopyWith<$Res> {
  _$ResendEmailVerificationStateCopyWithImpl(this._self, this._then);

  final ResendEmailVerificationState _self;
  final $Res Function(ResendEmailVerificationState) _then;

/// Create a copy of ResendEmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remainingSeconds = null,Object? screenState = null,}) {
  return _then(ResendEmailVerificationState(
remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,screenState: null == screenState ? _self.screenState : screenState // ignore: cast_nullable_to_non_nullable
as ScreenState,
  ));
}

}


/// Adds pattern-matching-related methods to [ResendEmailVerificationState].
extension ResendEmailVerificationStatePatterns on ResendEmailVerificationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResendEmailVerificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResendEmailVerificationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResendEmailVerificationState value)  $default,){
final _that = this;
switch (_that) {
case _ResendEmailVerificationState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResendEmailVerificationState value)?  $default,){
final _that = this;
switch (_that) {
case _ResendEmailVerificationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int remainingSeconds,  ScreenState screenState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResendEmailVerificationState() when $default != null:
return $default(_that.remainingSeconds,_that.screenState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int remainingSeconds,  ScreenState screenState)  $default,) {final _that = this;
switch (_that) {
case _ResendEmailVerificationState():
return $default(_that.remainingSeconds,_that.screenState);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int remainingSeconds,  ScreenState screenState)?  $default,) {final _that = this;
switch (_that) {
case _ResendEmailVerificationState() when $default != null:
return $default(_that.remainingSeconds,_that.screenState);case _:
  return null;

}
}

}

/// @nodoc


class _ResendEmailVerificationState extends ResendEmailVerificationState {
  const _ResendEmailVerificationState({this.remainingSeconds = 0, this.screenState = const InitialState()}): super._();
  

@override@JsonKey() final  int remainingSeconds;
@override@JsonKey() final  ScreenState screenState;

/// Create a copy of ResendEmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResendEmailVerificationStateCopyWith<_ResendEmailVerificationState> get copyWith => __$ResendEmailVerificationStateCopyWithImpl<_ResendEmailVerificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResendEmailVerificationState&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.screenState, screenState) || other.screenState == screenState));
}


@override
int get hashCode => Object.hash(runtimeType,remainingSeconds,screenState);

@override
String toString() {
  return 'ResendEmailVerificationState(remainingSeconds: $remainingSeconds, screenState: $screenState)';
}


}

/// @nodoc
abstract mixin class _$ResendEmailVerificationStateCopyWith<$Res> implements $ResendEmailVerificationStateCopyWith<$Res> {
  factory _$ResendEmailVerificationStateCopyWith(_ResendEmailVerificationState value, $Res Function(_ResendEmailVerificationState) _then) = __$ResendEmailVerificationStateCopyWithImpl;
@override @useResult
$Res call({
 int remainingSeconds, ScreenState screenState
});




}
/// @nodoc
class __$ResendEmailVerificationStateCopyWithImpl<$Res>
    implements _$ResendEmailVerificationStateCopyWith<$Res> {
  __$ResendEmailVerificationStateCopyWithImpl(this._self, this._then);

  final _ResendEmailVerificationState _self;
  final $Res Function(_ResendEmailVerificationState) _then;

/// Create a copy of ResendEmailVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remainingSeconds = null,Object? screenState = null,}) {
  return _then(_ResendEmailVerificationState(
remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,screenState: null == screenState ? _self.screenState : screenState // ignore: cast_nullable_to_non_nullable
as ScreenState,
  ));
}


}

// dart format on
