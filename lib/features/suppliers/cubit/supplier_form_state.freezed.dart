// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SupplierFormState {

 List<CompanyModel> get companies; bool get isOptionsLoading; bool get hasCompaniesError; CompanyModel? get selectedCompany; bool get isSaving; Failure? get failure; bool get saved;
/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupplierFormStateCopyWith<SupplierFormState> get copyWith => _$SupplierFormStateCopyWithImpl<SupplierFormState>(this as SupplierFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupplierFormState&&const DeepCollectionEquality().equals(other.companies, companies)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(companies),isOptionsLoading,hasCompaniesError,selectedCompany,isSaving,failure,saved);

@override
String toString() {
  return 'SupplierFormState(companies: $companies, isOptionsLoading: $isOptionsLoading, hasCompaniesError: $hasCompaniesError, selectedCompany: $selectedCompany, isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class $SupplierFormStateCopyWith<$Res>  {
  factory $SupplierFormStateCopyWith(SupplierFormState value, $Res Function(SupplierFormState) _then) = _$SupplierFormStateCopyWithImpl;
@useResult
$Res call({
 List<CompanyModel> companies, bool isOptionsLoading, bool hasCompaniesError, CompanyModel? selectedCompany, bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class _$SupplierFormStateCopyWithImpl<$Res>
    implements $SupplierFormStateCopyWith<$Res> {
  _$SupplierFormStateCopyWithImpl(this._self, this._then);

  final SupplierFormState _self;
  final $Res Function(SupplierFormState) _then;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companies = null,Object? isOptionsLoading = null,Object? hasCompaniesError = null,Object? selectedCompany = freezed,Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(SupplierFormState(
companies: null == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SupplierFormState].
extension SupplierFormStatePatterns on SupplierFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupplierFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupplierFormState value)  $default,){
final _that = this;
switch (_that) {
case _SupplierFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupplierFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCompaniesError,  CompanyModel? selectedCompany,  bool isSaving,  Failure? failure,  bool saved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that.companies,_that.isOptionsLoading,_that.hasCompaniesError,_that.selectedCompany,_that.isSaving,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCompaniesError,  CompanyModel? selectedCompany,  bool isSaving,  Failure? failure,  bool saved)  $default,) {final _that = this;
switch (_that) {
case _SupplierFormState():
return $default(_that.companies,_that.isOptionsLoading,_that.hasCompaniesError,_that.selectedCompany,_that.isSaving,_that.failure,_that.saved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CompanyModel> companies,  bool isOptionsLoading,  bool hasCompaniesError,  CompanyModel? selectedCompany,  bool isSaving,  Failure? failure,  bool saved)?  $default,) {final _that = this;
switch (_that) {
case _SupplierFormState() when $default != null:
return $default(_that.companies,_that.isOptionsLoading,_that.hasCompaniesError,_that.selectedCompany,_that.isSaving,_that.failure,_that.saved);case _:
  return null;

}
}

}

/// @nodoc


class _SupplierFormState implements SupplierFormState {
  const _SupplierFormState({ List<CompanyModel> companies = const <CompanyModel>[], this.isOptionsLoading = false, this.hasCompaniesError = false, this.selectedCompany, this.isSaving = false, this.failure, this.saved = false}): _companies = companies;
  

 final  List<CompanyModel> _companies;
@override@JsonKey() List<CompanyModel> get companies {
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_companies);
}

@override@JsonKey() final  bool isOptionsLoading;
@override@JsonKey() final  bool hasCompaniesError;
@override final  CompanyModel? selectedCompany;
@override@JsonKey() final  bool isSaving;
@override final  Failure? failure;
@override@JsonKey() final  bool saved;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupplierFormStateCopyWith<_SupplierFormState> get copyWith => __$SupplierFormStateCopyWithImpl<_SupplierFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupplierFormState&&const DeepCollectionEquality().equals(other._companies, _companies)&&(identical(other.isOptionsLoading, isOptionsLoading) || other.isOptionsLoading == isOptionsLoading)&&(identical(other.hasCompaniesError, hasCompaniesError) || other.hasCompaniesError == hasCompaniesError)&&(identical(other.selectedCompany, selectedCompany) || other.selectedCompany == selectedCompany)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.saved, saved) || other.saved == saved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies),isOptionsLoading,hasCompaniesError,selectedCompany,isSaving,failure,saved);

@override
String toString() {
  return 'SupplierFormState(companies: $companies, isOptionsLoading: $isOptionsLoading, hasCompaniesError: $hasCompaniesError, selectedCompany: $selectedCompany, isSaving: $isSaving, failure: $failure, saved: $saved)';
}


}

/// @nodoc
abstract mixin class _$SupplierFormStateCopyWith<$Res> implements $SupplierFormStateCopyWith<$Res> {
  factory _$SupplierFormStateCopyWith(_SupplierFormState value, $Res Function(_SupplierFormState) _then) = __$SupplierFormStateCopyWithImpl;
@override @useResult
$Res call({
 List<CompanyModel> companies, bool isOptionsLoading, bool hasCompaniesError, CompanyModel? selectedCompany, bool isSaving, Failure? failure, bool saved
});




}
/// @nodoc
class __$SupplierFormStateCopyWithImpl<$Res>
    implements _$SupplierFormStateCopyWith<$Res> {
  __$SupplierFormStateCopyWithImpl(this._self, this._then);

  final _SupplierFormState _self;
  final $Res Function(_SupplierFormState) _then;

/// Create a copy of SupplierFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companies = null,Object? isOptionsLoading = null,Object? hasCompaniesError = null,Object? selectedCompany = freezed,Object? isSaving = null,Object? failure = freezed,Object? saved = null,}) {
  return _then(_SupplierFormState(
companies: null == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyModel>,isOptionsLoading: null == isOptionsLoading ? _self.isOptionsLoading : isOptionsLoading // ignore: cast_nullable_to_non_nullable
as bool,hasCompaniesError: null == hasCompaniesError ? _self.hasCompaniesError : hasCompaniesError // ignore: cast_nullable_to_non_nullable
as bool,selectedCompany: freezed == selectedCompany ? _self.selectedCompany : selectedCompany // ignore: cast_nullable_to_non_nullable
as CompanyModel?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,saved: null == saved ? _self.saved : saved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
