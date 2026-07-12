import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/customers/cubit/customer_form_cubit.dart';
import 'package:pharmacy_app/features/customers/cubit/customer_form_state.dart';
import 'package:pharmacy_app/features/customers/data/models/customer_model.dart';

/// Full-screen Add/Edit Customer form. AppBar with a back arrow, a single
/// `FormSectionCard` (full_name + phone + notes), and a sticky bottom save
/// bar. The form owns its own [CustomerFormCubit] (create or update); the
/// list screen refreshes on return.
class CustomerFormScreen extends StatefulWidget {
  const CustomerFormScreen({super.key, this.customerId, this.existing});

  /// When non-null the form is in edit mode and pre-fills from [existing].
  final int? customerId;
  final CustomerModel? existing;

  @override
  State<CustomerFormScreen> createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _fullName;
  late final TextEditingController _phone;
  late final TextEditingController _notes;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _fullName = TextEditingController(text: e?.fullName ?? '');
    _phone = TextEditingController(text: e?.phone ?? '');
    _notes = TextEditingController(text: e?.notes ?? '');
  }

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _notes.dispose();
    super.dispose();
  }

  Map<String, dynamic> _buildBody() {
    return <String, dynamic>{
      'full_name': _fullName.text.trim(),
      if (_phone.text.trim().isNotEmpty) 'phone': _phone.text.trim(),
      if (_notes.text.trim().isNotEmpty) 'notes': _notes.text.trim(),
    };
  }

  void _submit(CustomerFormCubit cubit) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    cubit.submit(customerId: widget.customerId, body: _buildBody());
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isEdit = widget.customerId != null;

    return BlocListener<CustomerFormCubit, CustomerFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(
            message: isEdit ? tr.customer_updated : tr.customer_created,
          );
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          context.read<CustomerFormCubit>().clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(isEdit ? tr.customer_edit_title : tr.customer_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<CustomerFormCubit, CustomerFormState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state.isSaving,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: context.pScreen,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormSectionCard(
                              title: tr.customer_section,
                              subtitle: tr.customer_section_sub,
                              icon: Icons.person_outline,
                              children: [
                                CustomTextField(
                                  controller: _fullName,
                                  labelText: tr.customer_name,
                                  hintText: tr.customer_name,
                                  prefixIcon: Icons.badge_outlined,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                          ? tr.field_required
                                          : null,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _phone,
                                  labelText: tr.customer_phone,
                                  hintText: tr.product_form_optional_hint,
                                  prefixIcon: Icons.phone_outlined,
                                  keyboardType: TextInputType.phone,
                                  onlyDigits: true,
                                ),
                                context.vMd,
                                CustomTextField(
                                  controller: _notes,
                                  labelText: tr.customer_notes,
                                  hintText: tr.product_form_optional_hint,
                                  prefixIcon: Icons.notes_outlined,
                                  height: 100,
                                ),
                              ],
                            ),
                            // Bottom spacing so the sticky bar doesn't cover.
                            SizedBox(height: context.sXxl + context.btnLg),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _StickySaveBar(
                        isSaving: state.isSaving,
                        isEdit: isEdit,
                        onTap: () => _submit(context.read<CustomerFormCubit>()),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StickySaveBar extends StatelessWidget {
  const _StickySaveBar({
    required this.isSaving,
    required this.isEdit,
    required this.onTap,
  });

  final bool isSaving;
  final bool isEdit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(
          top: BorderSide(
            color: context.colors.outline.withAlpha(120),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: CustomButton(
          onTap: isSaving ? null : onTap,
          child: isSaving
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_rounded, color: Colors.white),
                    SizedBox(width: context.sSm),
                    Text(isEdit ? context.tr.detail_save : context.tr.product_create),
                  ],
                ),
        ),
      ),
    );
  }
}
