import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/inventory/cubit/medical_info_form/medical_info_form_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/medical_info_form/medical_info_form_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';

/// Full-screen Add/Edit Medical Info form. Renders the 9 nullable-text fields
/// (each optional). On save it PUTs to `/products/{id}/medical-info`, hands the
/// saved model to the parent [ProductDetailCubit] so the tab updates instantly,
/// shows a snackbar, and pops.
class MedicalInfoFormScreen extends StatefulWidget {
  const MedicalInfoFormScreen({
    super.key,
    required this.productId,
    this.existing,
  });

  final int productId;

  /// When non-null the form is in edit mode and pre-fills from this model.
  final ProductMedicalInfoModel? existing;

  @override
  State<MedicalInfoFormScreen> createState() => _MedicalInfoFormScreenState();
}

class _MedicalInfoFormScreenState extends State<MedicalInfoFormScreen> {
  late final TextEditingController _indications;
  late final TextEditingController _contraindications;
  late final TextEditingController _warnings;
  late final TextEditingController _sideEffects;
  late final TextEditingController _overdose;
  late final TextEditingController _pregnancySafety;
  late final TextEditingController _lactationSafety;
  late final TextEditingController _drugInteractions;
  late final TextEditingController _doseInfo;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _indications = TextEditingController(text: e?.indications ?? '');
    _contraindications = TextEditingController(text: e?.contraindications ?? '');
    _warnings = TextEditingController(text: e?.warnings ?? '');
    _sideEffects = TextEditingController(text: e?.sideEffects ?? '');
    _overdose = TextEditingController(text: e?.overdose ?? '');
    _pregnancySafety = TextEditingController(text: e?.pregnancySafety ?? '');
    _lactationSafety = TextEditingController(text: e?.lactationSafety ?? '');
    _drugInteractions = TextEditingController(text: e?.drugInteractions ?? '');
    _doseInfo = TextEditingController(text: e?.doseInfo ?? '');
  }

  @override
  void dispose() {
    _indications.dispose();
    _contraindications.dispose();
    _warnings.dispose();
    _sideEffects.dispose();
    _overdose.dispose();
    _pregnancySafety.dispose();
    _lactationSafety.dispose();
    _drugInteractions.dispose();
    _doseInfo.dispose();
    super.dispose();
  }

  Map<String, String?> _buildBody() {
    return {
      'indications': _indications.text,
      'contraindications': _contraindications.text,
      'warnings': _warnings.text,
      'side_effects': _sideEffects.text,
      'overdose': _overdose.text,
      'pregnancy_safety': _pregnancySafety.text,
      'lactation_safety': _lactationSafety.text,
      'drug_interactions': _drugInteractions.text,
      'dose_info': _doseInfo.text,
    };
  }

  void _submit(MedicalInfoFormCubit cubit) {
    cubit.submit(widget.productId, _buildBody());
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isEdit = widget.existing != null;

    return BlocListener<MedicalInfoFormCubit, MedicalInfoFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(tr.medical_info_saved)),
          );
          // The detail screen owns the ProductDetailCubit (it is not in scope
          // here across a pushed route); pop with a result so it can reload.
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure!.localizedMessage(context)),
            ),
          );
          context.read<MedicalInfoFormCubit>().clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(
            isEdit ? tr.medical_info_edit_title : tr.detail_add_medical_info,
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<MedicalInfoFormCubit, MedicalInfoFormState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state.isSaving,
                child: SingleChildScrollView(
                  padding: context.pScreen,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Field(
                        controller: _indications,
                        label: tr.detail_medical_indications,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _contraindications,
                        label: tr.detail_medical_contraindications,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _warnings,
                        label: tr.detail_medical_warnings,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _sideEffects,
                        label: tr.detail_medical_side_effects,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _overdose,
                        label: tr.detail_medical_overdose,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _pregnancySafety,
                        label: tr.detail_medical_pregnancy_safety,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _lactationSafety,
                        label: tr.detail_medical_lactation_safety,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _drugInteractions,
                        label: tr.detail_medical_drug_interactions,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vMd,
                      _Field(
                        controller: _doseInfo,
                        label: tr.detail_medical_dose_info,
                        hint: tr.medical_info_field_hint,
                      ),
                      context.vLg,
                      CustomButton(
                        onTap: state.isSaving
                            ? null
                            : () => _submit(
                                  context.read<MedicalInfoFormCubit>(),
                                ),
                        child: state.isSaving
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(tr.detail_save),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// A multiline variant of [CustomTextField] for the long medical-info text.
class _Field extends StatelessWidget {
  const _Field({
    required this.controller,
    required this.label,
    required this.hint,
  });

  final TextEditingController controller;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      labelText: label,
      hintText: hint,
      height: 120,
    );
  }
}
