import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';

part 'customer_form_state.freezed.dart';

/// Holds the Add/Edit Customer form state — just the transient save outcome
/// (the form has no dropdown options to load, unlike suppliers). The text
/// field values live in [TextEditingController]s owned by the form widget.
@freezed
abstract class CustomerFormState with _$CustomerFormState {
  const factory CustomerFormState({
    @Default(false) bool isSaving,
    Failure? failure,
    @Default(false) bool saved,
  }) = _CustomerFormState;
}
