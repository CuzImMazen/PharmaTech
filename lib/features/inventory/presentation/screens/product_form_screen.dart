import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_dropdown_field.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_form/product_form_cubit.dart';
import 'package:pharmacy_app/features/inventory/cubit/product_form/product_form_state.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_detail_model.dart';

/// Full-screen Add/Edit Product form. Required: barcode, brand name, category,
/// buying price, selling price. The rest is optional. Dropdowns are loaded from
/// the backend via [ProductFormCubit.loadOptions]. On success the saved
/// `ProductDetailModel` is forwarded to the parent [ProductDetailCubit] (for
/// edit) and the screen pops with `true` so the inventory list refreshes.
class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({super.key, this.productId, this.existing});

  /// When non-null the form is in edit mode for this product.
  final int? productId;
  final ProductDetailModel? existing;

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  late final TextEditingController _barcode;
  late final TextEditingController _brandName;
  late final TextEditingController _scientificName;
  late final TextEditingController _arName;
  late final TextEditingController _strength;
  late final TextEditingController _buyingPrice;
  late final TextEditingController _sellingPrice;
  late final TextEditingController _taxRate;
  late final TextEditingController _discountRate;
  late final TextEditingController _minStock;
  late final TextEditingController _unitsPerBase;
  late final TextEditingController _shelf;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _barcode = TextEditingController(text: e?.barcode ?? '');
    _brandName = TextEditingController(text: e?.brandName ?? '');
    _scientificName = TextEditingController(text: e?.scientificName ?? '');
    _arName = TextEditingController(text: e?.arName ?? '');
    _strength = TextEditingController(text: e?.strength ?? '');
    _buyingPrice = TextEditingController(text: e == null ? '' : '${e.buyingPrice}');
    _sellingPrice = TextEditingController(text: e == null ? '' : '${e.sellingPrice}');
    _taxRate = TextEditingController(text: e == null ? '' : '${e.taxRate}');
    _discountRate = TextEditingController(text: e == null ? '' : '${e.discountRate}');
    _minStock = TextEditingController(text: e == null ? '' : '${e.minStock}');
    _unitsPerBase = TextEditingController(text: e == null ? '' : '${e.unitsPerBase}');
    _shelf = TextEditingController(text: e?.shelf ?? '');
  }

  @override
  void dispose() {
    for (final c in [
      _barcode,
      _brandName,
      _scientificName,
      _arName,
      _strength,
      _buyingPrice,
      _sellingPrice,
      _taxRate,
      _discountRate,
      _minStock,
      _unitsPerBase,
      _shelf,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Map<String, dynamic> _buildBody(ProductFormState state) {
    final body = <String, dynamic>{
      'barcode': _barcode.text.trim(),
      'brand_name': _brandName.text.trim(),
      'scientific_name': _scientificName.text.trim(),
      'ar_name': _arName.text.trim(),
      'strength': _strength.text.trim(),
      'buying_price': num.tryParse(_buyingPrice.text.trim()),
      'selling_price': num.tryParse(_sellingPrice.text.trim()),
      'tax_rate': num.tryParse(_taxRate.text.trim()),
      'discount_rate': num.tryParse(_discountRate.text.trim()),
      'min_stock': int.tryParse(_minStock.text.trim()),
      'units_per_base': int.tryParse(_unitsPerBase.text.trim()),
      'shelf': _shelf.text.trim(),
      'prescription_required': state.prescriptionRequired,
      'allow_partial_selling': state.allowPartialSelling,
      if (state.selectedCategory != null)
        'category_id': state.selectedCategory!.id,
      if (state.selectedCompany != null)
        'company_id': state.selectedCompany!.id,
      if (state.selectedBaseUnit != null)
        'base_unit_id': state.selectedBaseUnit!.id,
      if (state.selectedSellingUnit != null)
        'selling_unit_id': state.selectedSellingUnit!.id,
    };
    // For create, drop the numeric fields the user left blank so the backend
    // applies its own defaults. For update, keep only filled ones (PUT is
    // `sometimes`-validated so omitted = unchanged).
    body.removeWhere((k, v) => v == null && k != 'scientific_name' && k != 'ar_name' && k != 'strength' && k != 'shelf');
    return body;
  }

  void _submit(ProductFormCubit cubit, ProductFormState state) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    cubit.submit(productId: widget.productId, body: _buildBody(state));
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final isEdit = widget.productId != null;

    return BlocListener<ProductFormCubit, ProductFormState>(
      listenWhen: (p, c) => p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(isEdit ? tr.product_saved : tr.product_created)),
          );
          // The detail screen owns the ProductDetailCubit (not in scope across
          // a pushed route); pop with a result so it can reload on return.
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure!.localizedMessage(context))),
          );
          context.read<ProductFormCubit>().clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(isEdit ? tr.product_edit_title : tr.product_add_title),
        ),
        body: SafeArea(
          child: BlocBuilder<ProductFormCubit, ProductFormState>(
            builder: (context, state) {
              if (state.isOptionsLoading &&
                  state.categories.isEmpty &&
                  state.units.isEmpty &&
                  state.companies.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return AbsorbPointer(
                absorbing: state.isSaving,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: context.pScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SectionTitle(text: tr.product_form_section_basic),
                        context.vMd,
                        CustomTextField(
                          controller: _barcode,
                          labelText: tr.detail_barcode,
                          hintText: tr.product_form_barcode_hint,
                          onlyDigits: false,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? tr.field_required : null,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _brandName,
                          labelText: tr.product_form_brand_name,
                          hintText: tr.product_form_brand_name_hint,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? tr.field_required : null,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _scientificName,
                          labelText: tr.detail_scientific_name,
                          hintText: tr.product_form_optional_hint,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _arName,
                          labelText: tr.product_form_ar_name,
                          hintText: tr.product_form_optional_hint,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _strength,
                          labelText: tr.detail_strength,
                          hintText: tr.product_form_optional_hint,
                        ),
                        context.vLg,

                        _SectionTitle(text: tr.product_form_section_classification),
                        context.vMd,
                        CustomDropdownField(
                          labelText: tr.detail_category,
                          hintText: tr.product_form_select_category,
                          items: state.categories,
                          itemLabel: (c) => c.name,
                          value: state.selectedCategory,
                          onChanged: context.read<ProductFormCubit>().selectCategory,
                          isLoading: state.isOptionsLoading,
                          hasError: state.hasCategoriesError,
                          onRetry: () => context
                              .read<ProductFormCubit>()
                              .reloadCategories(),
                        ),
                        context.vMd,
                        CustomDropdownField(
                          labelText: tr.detail_company,
                          hintText: tr.product_form_optional_hint,
                          items: state.companies,
                          itemLabel: (c) => c.name,
                          value: state.selectedCompany,
                          onChanged: context.read<ProductFormCubit>().selectCompany,
                          isLoading: state.isOptionsLoading,
                          hasError: state.hasCompaniesError,
                          onRetry: () => context
                              .read<ProductFormCubit>()
                              .reloadCompanies(),
                        ),
                        context.vMd,
                        CustomDropdownField(
                          labelText: tr.product_form_base_unit,
                          hintText: tr.product_form_optional_hint,
                          items: state.units,
                          itemLabel: (u) => u.name,
                          value: state.selectedBaseUnit,
                          onChanged: context.read<ProductFormCubit>().selectBaseUnit,
                          isLoading: state.isOptionsLoading,
                          hasError: state.hasUnitsError,
                          onRetry: () =>
                              context.read<ProductFormCubit>().reloadUnits(),
                        ),
                        context.vMd,
                        CustomDropdownField(
                          labelText: tr.product_form_selling_unit,
                          hintText: tr.product_form_optional_hint,
                          items: state.units,
                          itemLabel: (u) => u.name,
                          value: state.selectedSellingUnit,
                          onChanged:
                              context.read<ProductFormCubit>().selectSellingUnit,
                          isLoading: state.isOptionsLoading,
                          hasError: state.hasUnitsError,
                          onRetry: () =>
                              context.read<ProductFormCubit>().reloadUnits(),
                        ),
                        context.vLg,

                        _SectionTitle(text: tr.detail_section_pricing),
                        context.vMd,
                        CustomTextField(
                          controller: _buyingPrice,
                          labelText: tr.detail_buying_price,
                          hintText: '0',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onlyDigits: false,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? tr.field_required : null,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _sellingPrice,
                          labelText: tr.detail_selling_price,
                          hintText: '0',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onlyDigits: false,
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? tr.field_required : null,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _taxRate,
                          labelText: tr.detail_tax,
                          hintText: '0',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onlyDigits: false,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _discountRate,
                          labelText: tr.detail_discount,
                          hintText: '0',
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onlyDigits: false,
                        ),
                        context.vLg,

                        _SectionTitle(text: tr.detail_section_inventory),
                        context.vMd,
                        CustomTextField(
                          controller: _minStock,
                          labelText: tr.detail_min_stock,
                          hintText: '0',
                          keyboardType: TextInputType.number,
                          onlyDigits: true,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _unitsPerBase,
                          labelText: tr.detail_units_per_base,
                          hintText: '1',
                          keyboardType: TextInputType.number,
                          onlyDigits: true,
                        ),
                        context.vMd,
                        CustomTextField(
                          controller: _shelf,
                          labelText: tr.detail_shelf,
                          hintText: tr.product_form_optional_hint,
                        ),
                        context.vMd,
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: state.prescriptionRequired,
                          onChanged:
                              context.read<ProductFormCubit>().togglePrescriptionRequired,
                          title: Text(tr.detail_prescription),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          value: state.allowPartialSelling,
                          onChanged: context
                              .read<ProductFormCubit>()
                              .toggleAllowPartialSelling,
                          title: Text(tr.detail_allow_partial_selling),
                        ),
                        context.vLg,
                        CustomButton(
                          onTap: state.isSaving
                              ? null
                              : () => _submit(
                                    context.read<ProductFormCubit>(),
                                    state,
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
                              : Text(isEdit ? tr.detail_save : tr.product_create),
                        ),
                      ],
                    ),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
