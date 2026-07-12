import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/form_section_card.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/cubit/bulk_stock_adjustment_cubit.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/cubit/bulk_stock_adjustment_state.dart';
import 'package:pharmacy_app/features/bulk_stock_adjustment/presentation/widgets/bulk_adjustment_item_row.dart';

/// Full-screen Bulk Stock Adjustment form. Each line item is an add OR remove
/// adjustment; on submit the whole list is POSTed to `/stock-adjustments/bulk`
/// as one atomic transaction (all-or-nothing). On success the screen pops; on
/// failure (a backend 422) the rows stay intact and a snackbar surfaces the
/// error. Per-row validation errors render inline below each row.
class BulkStockAdjustmentScreen extends StatefulWidget {
  const BulkStockAdjustmentScreen({super.key});

  @override
  State<BulkStockAdjustmentScreen> createState() =>
      _BulkStockAdjustmentScreenState();
}

class _BulkStockAdjustmentScreenState extends State<BulkStockAdjustmentScreen> {
  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final cubit = context.read<BulkStockAdjustmentCubit>();

    return BlocListener<BulkStockAdjustmentCubit, BulkStockAdjustmentState>(
      listenWhen: (p, c) =>
          p.failure != c.failure || (!p.saved && c.saved),
      listener: (context, state) {
        if (state.saved) {
          AppSnackbar.success(message: tr.bulk_adjustment_saved);
          Navigator.of(context).pop(true);
          return;
        }
        if (state.failure != null) {
          AppSnackbar.failure(message: state.failure!.localizedMessage(context));
          cubit.clearFailure();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          title: Text(tr.bulk_adjustment_title),
        ),
        body: SafeArea(
          child: BlocBuilder<BulkStockAdjustmentCubit, BulkStockAdjustmentState>(
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state.isSubmitting,
                child: Stack(
                  children: [
                    ListView(
                      padding: context.pScreen,
                      children: [
                        Text(
                          tr.bulk_adjustment_subtitle,
                          style: context.text.bodyMedium?.copyWith(
                            color: context.muted,
                          ),
                        ),
                        context.vLg,
                        FormSectionCard(
                          title: tr.bulk_adjustment_section,
                          subtitle: tr.bulk_adjustment_section_sub,
                          icon: Icons.layers_outlined,
                          children: [
                            for (var i = 0; i < state.items.length; i++)
                              BulkAdjustmentItemRow(index: i),
                            if (state.items.isEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: context.sMd,
                                ),
                                child: Text(
                                  tr.bulk_no_items,
                                  style: context.text.bodyMedium?.copyWith(
                                    color: context.muted,
                                  ),
                                ),
                              ),
                            context.vSm,
                            OutlinedButton.icon(
                              onPressed: cubit.addItem,
                              icon: Icon(Icons.add_rounded, size: context.iSm),
                              label: Text(tr.bulk_add_item),
                            ),
                          ],
                        ),
                        SizedBox(height: context.sXxl + context.btnLg),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _StickySaveBar(
                        isSaving: state.isSubmitting,
                        onTap: () => cubit.submit(),
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
  const _StickySaveBar({required this.isSaving, required this.onTap});

  final bool isSaving;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.pAllMd,
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(
          top: BorderSide(color: context.colors.outline.withAlpha(120), width: 1),
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
                    Text(context.tr.bulk_apply),
                  ],
                ),
        ),
      ),
    );
  }
}
