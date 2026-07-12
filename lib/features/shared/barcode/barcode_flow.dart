import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/di/service_locator.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/features/inventory/data/repo/inventory_repository.dart';
import 'package:pharmacy_app/features/shared/barcode/screens/barcode_scanner_screen.dart';

/// Outcome of resolving a scanned/entered barcode into a product action.
sealed class BarcodeLookupResult {
  const BarcodeLookupResult();

  /// A product matched — open its detail.
  const factory BarcodeLookupResult.found(int productId) =
      _BarcodeLookupFound;

  /// No product matched — offer to create one with this barcode.
  const factory BarcodeLookupResult.create(String barcode) =
      _BarcodeLookupCreate;

  /// The lookup failed (network/parse). The localized message is shown.
  const factory BarcodeLookupResult.error(String localizedMessage) =
      _BarcodeLookupError;
}

class _BarcodeLookupFound extends BarcodeLookupResult {
  const _BarcodeLookupFound(this.productId);
  final int productId;
}

class _BarcodeLookupCreate extends BarcodeLookupResult {
  const _BarcodeLookupCreate(this.barcode);
  final String barcode;
}

class _BarcodeLookupError extends BarcodeLookupResult {
  const _BarcodeLookupError(this.localizedMessage);
  final String localizedMessage;
}

/// Resolves a raw barcode into a [BarcodeLookupResult] (does the product
/// lookup). Run on the scanner so a loading overlay can show while it runs.
typedef BarcodeLookup = Future<BarcodeLookupResult> Function(
  BuildContext context,
  String code,
);

/// Coordinates the barcode scan flow shared by the three call sites
/// (Dashboard header, Inventory search, Product form barcode field).
///
/// [start] scans → looks up the product (with a loading overlay on the scanner
/// while the lookup runs) → opens its detail (found) or offers to create a new
/// product pre-filled with the barcode (not found). [scanOnly] scans and
/// returns the raw code without a lookup (used by the product form to fill the
/// barcode field).
///
/// The scanner route is pushed on top of the caller, so when it pops the
/// caller's [BuildContext] is still mounted and safe to navigate from. The
/// heavy lifting (lookup) runs *inside* the scanner via [BarcodeLookup] so the
/// user sees a loading indicator instead of a frozen screen; a
/// `context.mounted` guard after the pop ensures we never touch a torn-down
/// tree.
class BarcodeFlow {
  const BarcodeFlow._();

  /// Opens the scanner, looks up the scanned barcode, and either navigates to
  /// the product detail (found) or offers to create a new product with the
  /// barcode pre-filled (not found). Failures surface as a snackbar.
  static Future<void> start(BuildContext context) async {
    final result = await Navigator.of(context).push<BarcodeLookupResult>(
      MaterialPageRoute(
        builder: (_) => BarcodeScannerScreen(resolve: _resolve),
      ),
    );
    if (!context.mounted || result == null) return;

    switch (result) {
      case _BarcodeLookupFound(:final productId):
        context.push(AppRoutesKeys.productDetailWith(productId));
      case _BarcodeLookupCreate(:final barcode):
        _offerCreate(context, barcode);
      case _BarcodeLookupError(:final localizedMessage):
        AppSnackbar.failure(message: localizedMessage);
    }
  }

  /// The lookup resolver handed to the scanner. Captures the caller's context
  /// only for [AppLocalizations] (failure messages) before any await.
  static Future<BarcodeLookupResult> _resolve(
    BuildContext context,
    String code,
  ) async {
    final repo = sl<InventoryRepository>();
    final result = await repo.lookupByBarcode(code);
    return result.fold(
      (failure) =>
          BarcodeLookupResult.error(failure.localizedMessage(context)),
      (product) => product != null
          ? BarcodeLookupResult.found(product.id)
          : BarcodeLookupResult.create(code),
    );
  }

  static void _offerCreate(BuildContext context, String barcode) {
    final tr = context.tr;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.scan_not_found),
        content: Text(tr.scan_not_found_offer_create),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.push(AppRoutesKeys.productAdd, extra: {'barcode': barcode});
            },
            child: Text(tr.scan_create),
          ),
        ],
      ),
    );
  }

  /// Opens the scanner and returns the raw scanned/entered code without a
  /// lookup. Used by the product form to fill the barcode field.
  static Future<String?> scanOnly(BuildContext context) {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const BarcodeScannerScreen()),
    );
  }
}
