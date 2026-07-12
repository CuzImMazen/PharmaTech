import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_dropdown_field.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/suppliers/cubit/supplier_form_cubit.dart';
import 'package:pharmacy_app/features/suppliers/cubit/supplier_form_state.dart';
import 'package:pharmacy_app/features/suppliers/data/models/supplier_model.dart';

/// Full-screen Add/Edit Supplier form. Mirrors [ProductFormScreen]: AppBar
/// with a back arrow, a single `FormSectionCard`, and a sticky bottom save
/// bar. The form owns its own [SupplierFormCubit] (create or update); the
/// list screen refreshes on return.
class SupplierFormScreen extends StatefulWidget {
  const SupplierFormScreen({super.key, this.supplierId, this.existing});

  /// When non-null the form is in edit mode and pre-fills from [existing].
  final int? supplierId;
  final SupplierModel? existing;

  @override
  State<SupplierFormScreen> createState() => _SupplierFormScreenState();
}

class _SupplierFormScreenState extends State<SupplierFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _phone;
  late final TextEditingController _email;
  late final TextEditingController _address;
  late final TextEditingController _notes;
  bool _seeded = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _name = TextEditingController(text: e?.name ?? '');
    _phone = TextEditingController(text: e?.phone ?? '');
    _email = TextEditingController(text: e?.email ?? '');
    _address = TextEditingController(text: e?.address ?? '');
    _notes = TextEditingController(text: e?.notes ?? '');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-select the saved company once the options are loaded. The cubit
    // isn't available in initState, so this runs on the first build.
    if (!_seeded) {
      _seeded = true;
      final e = widget.existing;
      if (e?.company != null) {
        context.read<SupplierFormCubit>().selectCompany(e!.company);
      }
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _email.dispose();
    _address.dispose();
    _notes.dispose();
    super.dispose();
  }

  Map<String, dynamic> _buildBody(int? companyId) {
    final body = <String, dynamic>{
      'name': _name.text.trim(),
      if (companyId != null) 'company_id': companyId,
      if (_phone.text.trim().isNotEmpty) 'phone': _phone.text.trim(),
      if (_email.text.trim().isNotEmpty) 'email': _email.text.trim(),
      if (_address.text.trim().isNotEmpty) 'address': _address.text.trim(),
      if (_notes.text.trim().isNotEmpty) 'notes': _notes.text.trim(),
    };
    return body;
  }

  void _submit(SupplierFormCubit cubit, int? companyId) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    cubit.submit(supplierId: widget.supplierId, body: _buildBody(companyId));
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isEdit = widget.supplierId != null;

    return BlocListener<SupplierFormCubit, SupplierFormState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(
            message: isEdit ? tr.supplier_updated : tr.supplier_created,
          );
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(
            message: state.failure!.localizedMessage(context),
          );
          context.read<SupplierFormCubit>().clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(isEdit ? tr.supplier_edit_title : tr.supplier_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<SupplierFormCubit, SupplierFormState>(
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
                          title: tr.supplier_section,
                          subtitle: tr.supplier_section_sub,
                          icon: Icons.contact_page_outlined,
                          children: [
                            CustomTextField(
                              controller: _name,
                              labelText: tr.supplier_name,
                              hintText: tr.supplier_name,
                              prefixIcon: Icons.business_outlined,
                              validator: (v) => (v == null || v.trim().isEmpty)
                                  ? tr.field_required
                                  : null,
                            ),
                            context.vMd,
                            CustomDropdownField(
                              labelText: tr.supplier_company,
                              hintText: tr.product_form_optional_hint,
                              items: state.companies,
                              itemLabel: (c) => c.name,
                              value: state.selectedCompany,
                              onChanged:
                                  context.read<SupplierFormCubit>().selectCompany,
                              isLoading: state.isOptionsLoading,
                              hasError: state.hasCompaniesError,
                              onRetry:
                                  context.read<SupplierFormCubit>().reloadCompanies,
                            ),
                            context.vMd,
                            CustomTextField(
                              controller: _phone,
                              labelText: tr.supplier_phone,
                              hintText: tr.product_form_optional_hint,
                              prefixIcon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                              onlyDigits: true,
                            ),
                            context.vMd,
                            CustomTextField(
                              controller: _email,
                              labelText: tr.supplier_email,
                              hintText: tr.product_form_optional_hint,
                              prefixIcon: Icons.mail_outline,
                              isEmail: true,
                            ),
                            context.vMd,
                            CustomTextField(
                              controller: _address,
                              labelText: tr.supplier_address,
                              hintText: tr.product_form_optional_hint,
                              prefixIcon: Icons.location_on_outlined,
                              height: 80,
                            ),
                            context.vMd,
                            CustomTextField(
                              controller: _notes,
                              labelText: tr.supplier_notes,
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
                        onTap: () => _submit(
                          context.read<SupplierFormCubit>(),
                          state.selectedCompany?.id,
                        ),
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
