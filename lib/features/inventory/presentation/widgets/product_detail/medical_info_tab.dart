import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/features/inventory/data/models/product_medical_info_model.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/detail_section_card.dart';
import 'package:pharmacy_app/features/inventory/presentation/widgets/product_detail/medical_info_empty_state.dart';

/// Tab 3 — Medical Info. Shows a centered empty state when there is no
/// medical info; otherwise renders the populated sections with Edit/Delete
/// actions in the header.
class MedicalInfoTab extends StatelessWidget {
  const MedicalInfoTab({
    super.key,
    this.medicalInfo,
    this.onAdd,
    this.onEdit,
    this.onDelete,
    this.isDeleting = false,
  });

  final ProductMedicalInfoModel? medicalInfo;
  final VoidCallback? onAdd;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    final info = medicalInfo;
    if (info == null || info.isEmpty) {
      return MedicalInfoEmptyState(onAdd: onAdd);
    }
    return _MedicalInfoContent(
      info: info,
      onEdit: onEdit,
      onDelete: onDelete,
      isDeleting: isDeleting,
    );
  }
}

class _MedicalInfoContent extends StatelessWidget {
  const _MedicalInfoContent({
    required this.info,
    this.onEdit,
    this.onDelete,
    this.isDeleting = false,
  });

  final ProductMedicalInfoModel info;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isDeleting;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final na = tr.detail_not_available;

    return ListView(
      padding: context.pScreen,
      children: [
        // Action row: Edit (primary) + Delete (destructive).
        Row(
          children: [
            _ActionButton(
              icon: Icons.edit_outlined,
              label: tr.detail_edit,
              color: context.primary,
              onTap: onEdit,
            ),
            context.hSm,
            _ActionButton(
              icon: isDeleting
                  ? Icons.hourglass_top_rounded
                  : Icons.delete_outline,
              label: tr.detail_delete,
              color: AppColors.cozyRed,
              onTap: isDeleting ? null : onDelete,
            ),
          ],
        ),
        context.vMd,
        _MedicalSection(
          icon: Icons.healing_outlined,
          title: tr.detail_medical_indications,
          body: info.indications ?? na,
        ),
        _MedicalSection(
          icon: Icons.block_outlined,
          title: tr.detail_medical_contraindications,
          body: info.contraindications ?? na,
        ),
        _MedicalSection(
          icon: Icons.warning_amber_outlined,
          title: tr.detail_medical_warnings,
          body: info.warnings ?? na,
        ),
        _MedicalSection(
          icon: Icons.science_outlined,
          title: tr.detail_medical_side_effects,
          body: info.sideEffects ?? na,
        ),
        _MedicalSection(
          icon: Icons.medication_liquid_outlined,
          title: tr.detail_medical_overdose,
          body: info.overdose ?? na,
        ),
        _MedicalSection(
          icon: Icons.pregnant_woman_outlined,
          title: tr.detail_medical_pregnancy_safety,
          body: info.pregnancySafety ?? na,
        ),
        _MedicalSection(
          icon: Icons.child_friendly_outlined,
          title: tr.detail_medical_lactation_safety,
          body: info.lactationSafety ?? na,
        ),
        _MedicalSection(
          icon: Icons.swap_horiz_outlined,
          title: tr.detail_medical_drug_interactions,
          body: info.drugInteractions ?? na,
        ),
        _MedicalSection(
          icon: Icons.scale_outlined,
          title: tr.detail_medical_dose_info,
          body: info.doseInfo ?? na,
        ),
      ],
    );
  }
}

class _MedicalSection extends StatelessWidget {
  const _MedicalSection({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.sMd),
      child: DetailSectionCard(
        icon: icon,
        title: title,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.sSm),
            child: Text(
              body,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small outlined action button (Edit/Delete) for the Medical Info header.
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: context.rLg,
        side: BorderSide(color: color.withAlpha(120), width: 1.5),
      ),
      child: InkWell(
        borderRadius: context.rLg,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.sMd,
            vertical: context.sSm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: context.iSm, color: color),
              SizedBox(width: context.sXs),
              Text(
                label,
                style: context.text.labelLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
