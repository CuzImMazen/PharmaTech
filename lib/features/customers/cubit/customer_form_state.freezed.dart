// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomerFormState {

 bool get isSaving; Failure? get failure; bool get saved;
/// Create a copy of CustomerFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerFormStateCopyWith<CustomerFormState> get copyWith => _$CustomerFormStateCopyWithImpl<CustomerFormState>(this as CustomerFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerFormState&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,isSaving,failure,saved);

@override
String toString() {
  return 'CustomerFormState(isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class $CustomerFormStateCopyWith<$Res>  {
  factory $CustomerFormStateCopyWith(CustomerFormState value, $Res Function(CustomerFormState) _then) = _$CustomerFormStateCopyWithImpl;
@useResult
$Res call({
 bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class _$CustomerFormStateCopyWithImpl<$Res>
    implements $CustomerFormStateCopyWith<$Res> {
  _$CustomerFormStateCopyWithImpl(this._self, this._then);

  final CustomerFormState _self;
  final $Res Function(CustomerFormState) _then;

/// Create a copy of CustomerFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(CustomerFormState(
isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerFormState].
extension CustomerFormStatePatterns on CustomerFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerFormState value)  $default,){
final _that = this;
switch (_that) {
case _CustomerFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerFormState value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isSaving,  Failure? failure,  bool saved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerFormState() when $default != null:
return $default(_that.isSaving,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isSaving,  Failure? failure,  bool saved)  $default,) {final _that = this;
switch (_that) {
case _CustomerFormState():
return $default(_that.isSaving,_that.failure,_that.saved);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isSaving,  Failure? failure,  bool saved)?  $default,) {final _that = this;
switch (_that) {
case _CustomerFormState() when $default != null:
return $default(_that.isSaving,_that.failure,_that.saved);case _:
  return null;

}
}

}

/// @nodoc


class _CustomerFormState implements CustomerFormState {
  const _CustomerFormState({this.isSaving = false, this.failure, this.saved = false});
  

@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;

/// Create a copy of CustomerFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerFormStateCopyWith<_CustomerFormState> get copyWith => __$CustomerFormStateCopyWithImpl<_CustomerFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerFormState&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,isSaving,failure,saved);

@override
String toString() {
  return 'CustomerFormState(isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class _$CustomerFormStateCopyWith<$Res> implements $CustomerFormStateCopyWith<$Res> {
  factory _$CustomerFormStateCopyWith(_CustomerFormState value, $Res Function(_CustomerFormState) _then) = __$CustomerFormStateCopyWithImpl;
@override @useResult
$Res call({
 bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class __$CustomerFormStateCopyWithImpl<$Res>
    implements _$CustomerFormStateCopyWith<$Res> {
  __$CustomerFormStateCopyWithImpl(this._self, this._then);

  final _CustomerFormState _self;
  final $Res Function(_CustomerFormState) _then;

/// Create a copy of CustomerFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(_CustomerFormState(
isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
