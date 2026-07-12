import 'package:pharmacy_app/l10n/app_localizations.dart';

/// Maps a backend `movement_type` to its localized label.
///
/// Shared by the per-product movements tab and the pharmacy-wide stock
/// adjustments log (both render `StockMovementModel`s).
String movementLabel(AppLocalizations tr, String type) {
  return switch (type) {
    'purchase_in' => tr.movement_purchase_in,
    'customer_return_in' => tr.movement_customer_return_in,
    'adjustment_in' => tr.movement_adjustment_in,
    'sale_out' => tr.movement_sale_out,
    'supplier_return_out' => tr.movement_supplier_return_out,
    'adjustment_out' => tr.movement_adjustment_out,
    'expiry_out' => tr.movement_expiry_out,
    _ => type,
  };
}
