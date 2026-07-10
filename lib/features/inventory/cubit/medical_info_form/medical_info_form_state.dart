import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pharmacy_app/core/error/failure.dart';

part 'medical_info_form_state.freezed.dart';

/// Holds the transient state of the Medical Info form: the saving flag and the
/// latest failure (surfaced via BlocListener). The 9 field values themselves
/// live in [TextEditingController]s owned by the form widget, so the state only
/// needs to track async outcome.
@freezed
abstract class MedicalInfoFormState with _$MedicalInfoFormState {
  const factory MedicalInfoFormState({
    @Default(false) bool isSaving,
    Failure? failure,
    // Set transiently on a successful save so the screen's BlocListener can
    // pop + notify the parent. Null otherwise.
    @Default(false) bool saved,
  }) = _MedicalInfoFormState;
}
