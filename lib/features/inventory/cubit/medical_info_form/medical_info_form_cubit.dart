import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/features/inventory/cubit/medical_info_form/medical_info_form_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/data/repo/product_detail_repository.dart';

/// Drives the Add/Edit Medical Info form. The 9 text fields live in
/// [TextEditingController]s on the screen; this cubit only owns the async
/// submit + its outcome. On success it exposes the saved model via [savedInfo]
/// so the screen can hand it back to the parent `ProductDetailCubit`.
class MedicalInfoFormCubit extends Cubit<MedicalInfoFormState> {
  MedicalInfoFormCubit({required this.repository})
    : super(const MedicalInfoFormState());

  final ProductDetailRepository repository;

  /// The model returned by the last successful upsert. Read by the screen
  /// after the `saved` signal fires, then forwarded to the parent cubit.
  ProductMedicalInfoModel? savedInfo;

  /// Submits the 9 nullable-string fields to `PUT /products/{id}/medical-info`.
  /// Empty strings are normalized to `null` (the backend stores them as NULL).
  Future<void> submit(int productId, Map<String, String?> body) async {
    if (isClosed) return;
    emit(state.copyWith(isSaving: true, failure: null, saved: false));

    // Normalize: trim; treat empty/whitespace as null so we don't store "".
    final normalized = <String, String?>{};
    body.forEach((key, value) {
      final trimmed = value?.trim();
      normalized[key] = (trimmed == null || trimmed.isEmpty) ? null : trimmed;
    });

    final result = await repository.upsertMedicalInfo(productId, normalized);
    if (isClosed) return;

    result.fold(
      (failure) => emit(
        state.copyWith(isSaving: false, failure: failure, saved: false),
      ),
      (info) {
        savedInfo = info;
        emit(state.copyWith(isSaving: false, failure: null, saved: true));
      },
    );
  }

  /// Clears the transient failure after the UI has shown it.
  void clearFailure() {
    if (isClosed) return;
    if (state.failure != null) {
      emit(state.copyWith(failure: null));
    }
  }
}
