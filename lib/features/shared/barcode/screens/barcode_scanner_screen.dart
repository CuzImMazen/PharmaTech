import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/shared/barcode/barcode_flow.dart';
import 'package:pharmacy_app/l10n/app_localizations.dart';

/// Full-screen barcode scanner. Uses `mobile_scanner` to detect the first
/// barcode and returns its raw value via `Navigator.pop(code)`. Includes a
/// torch toggle and a manual-entry fallback (for when the camera is unavailable
/// or permission is denied).
///
/// When [resolve] is provided (the [BarcodeFlow.start] path), a barcode is not
/// popped immediately: the camera stops and a loading overlay shows while the
/// product lookup runs, *then* the route pops with a [BarcodeLookupResult] so
/// the user never stares at a frozen screen. Without [resolve]
/// ([BarcodeFlow.scanOnly]), the raw `String?` code is popped as before.
///
/// The [MobileScannerController] is created with `autoStart = false` and
/// started manually from [initState] (guarded by the attached-completer
/// timeout inside the controller). All controller interactions — [start],
/// [stop], [toggleTorch] — are wrapped so a [MobileScannerException] (e.g.
/// permission denied, controller not yet attached, or a race with the app
/// lifecycle) surfaces as a snackbar / error view instead of an unhandled
/// async exception that would crash the app.
class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key, this.resolve});

  /// Optional lookup resolver. When set, a captured code is resolved into a
  /// [BarcodeLookupResult] (with a loading overlay) before the route pops.
  final BarcodeLookup? resolve;

  @override
  State<BarcodeScannerScreen> createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen>
    with WidgetsBindingObserver {
  // `autoStart: false` — the widget starts the controller itself once it is
  // attached, so we never hit the "controllerNotAttached" 500ms-timeout throw
  // that mobile_scanner raises when start() races ahead of initState.
  final MobileScannerController _controller = MobileScannerController(
    autoStart: false,
  );
  bool _isDetecting = false;
  bool _popped = false;
  bool _disposed = false;
  bool _isResolving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Start now that the widget is mounted; the controller waits internally for
    // the MobileScanner widget to attach before actually opening the camera.
    // Guarded so a permission denial / lifecycle race becomes an error view
    // rather than an unhandled exception.
    _controller.start().catchError((Object _) {
      // The error is surfaced via the controller's value (errorBuilder) or
      // ignored; swallow here to avoid an unhandled async error.
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Pause/resume the scanner when the app is backgrounded/foregrounded so
    // the camera is released correctly. Guard against exceptions and the
    // controller being disposed (e.g. the screen popped while backgrounded).
    if (_disposed) return;
    switch (state) {
      case AppLifecycleState.resumed:
        _controller.start().catchError((Object _) {});
        break;
      case AppLifecycleState.inactive:
        _controller.stop().catchError((Object _) {});
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    _disposed = true;
    WidgetsBinding.instance.removeObserver(this);
    _isDetecting = true; // suppress any in-flight detection callback
    // `MobileScannerController.dispose()` is async — it calls
    // `super.dispose()` (the ValueNotifier) synchronously, then awaits the
    // platform camera teardown. If we drop that Future here, the async
    // platform callback fires after this State is gone and throws into the
    // root zone — crashing the app when the scanner pops (notably after a
    // manual-entry "not found" that navigates away). Stop the camera first
    // (fire-and-forget, errors swallowed), then dispose and catch any error
    // so it can never escape.
    _controller.stop().catchError((Object _, StackTrace _) {});
    _controller.dispose().catchError((Object _, StackTrace _) {});
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_isDetecting || !mounted || _popped) return;
    final barcode = capture.barcodes.firstOrNull;
    final code = barcode?.rawValue;
    if (code == null || code.isEmpty) return;

    _isDetecting = true;
    _resolveAndPop(code);
  }

  Future<void> _enterManually() async {
    if (_isResolving || _popped || !mounted) return;
    final tr = context.tr;
    final code = await showDialog<String>(
      context: context,
      builder: (dialogContext) => _ManualBarcodeDialog(localizations: tr),
    );
    if (code == null || code.isEmpty || !mounted || _popped) return;

    _isDetecting = true;
    _resolveAndPop(code);
  }

  /// Stops the camera and pops the route. When [widget.resolve] is set (the
  /// `BarcodeFlow.start` path), a loading overlay is shown while the product
  /// lookup runs, and the route pops with a [BarcodeLookupResult] — so the
  /// user sees "Looking up…" instead of a frozen screen after scanning/entering
  /// a code. Otherwise (the `scanOnly` path) the raw code is popped as a
  /// `String`. Guards every step against the route being disposed mid-lookup.
  Future<void> _resolveAndPop(String code) async {
    if (_popped || !mounted) return;
    _popped = true;
    // Stop the camera *before* popping/resolving so no in-flight platform
    // operation is left running when the route tears down (the source of the
    // post-pop crash). Errors are swallowed — they must never escape the
    // lifecycle.
    _controller.stop().catchError((Object _, StackTrace _) {});

    final resolve = widget.resolve;
    if (resolve == null) {
      if (mounted) Navigator.of(context).pop(code);
      return;
    }

    // Show the loading overlay while the lookup runs.
    if (!mounted) return;
    setState(() => _isResolving = true);
    final result = await resolve(context, code);
    if (!mounted) return;
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
              errorBuilder: (context, error) {
                return _ScannerErrorView(
                  message: tr.scan_camera_permission_denied,
                  onEnterManually: _enterManually,
                );
              },
            ),

            // Top bar: back + torch.
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(context.sMd),
                child: Row(
                  children: [
                    _CircleIconButton(
                      icon: Icons.arrow_back_rounded,
                      onTap: () => Navigator.of(context).maybePop(),
                    ),
                    const Spacer(),
                    ValueListenableBuilder<MobileScannerState>(
                      valueListenable: _controller,
                      builder: (context, state, _) {
                        final torchOn = state.torchState == TorchState.on;
                        return _CircleIconButton(
                          icon: torchOn
                              ? Icons.flash_on_rounded
                              : Icons.flash_off_rounded,
                          onTap: () =>
                              _controller.toggleTorch().catchError((Object _) {}),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Bottom: manual entry.
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: context.pAllLg,
                child: FilledButton.icon(
                  onPressed: _isResolving ? null : _enterManually,
                  icon: const Icon(Icons.keyboard_rounded),
                  label: Text(tr.scan_enter_manually),
                ),
              ),
            ),

            // Loading overlay: shown while the product lookup runs (resolve
            // path), so the user sees progress instead of a frozen scanner
            // after scanning/entering a code.
            if (_isResolving)
              Positioned.fill(
                child: ColoredBox(
                  color: Colors.black.withAlpha(170),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(color: Colors.white),
                        context.vMd,
                        Text(
                          tr.scan_looking_up,
                          style: context.text.titleMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.sSm),
          child: Icon(icon, color: Colors.white, size: context.iMd),
        ),
      ),
    );
  }
}

class _ScannerErrorView extends StatelessWidget {
  const _ScannerErrorView({
    required this.message,
    required this.onEnterManually,
  });

  final String message;
  final VoidCallback onEnterManually;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: context.pScreen,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.no_photography_outlined,
              size: context.iXxl,
              color: Colors.white70,
            ),
            context.vMd,
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge?.copyWith(color: Colors.white),
            ),
            context.vLg,
            FilledButton.icon(
              onPressed: onEnterManually,
              icon: const Icon(Icons.keyboard_rounded),
              label: Text(context.tr.scan_enter_manually),
            ),
          ],
        ),
      ),
    );
  }
}

/// Self-contained manual-barcode-entry dialog. Owns its [TextEditingController]
/// and disposes it only when the dialog's element is torn down — which Flutter
/// does *after* the dialog's exit animation finishes. This is the fix for the
/// crash: previously the controller was disposed the instant `showDialog`
/// resolved (i.e. on `pop`), while the dialog's `TextField` was still mounted
/// mid-animation, disposing a controller a live `TextField` still references.
class _ManualBarcodeDialog extends StatefulWidget {
  const _ManualBarcodeDialog({required this.localizations});

  final AppLocalizations localizations;

  @override
  State<_ManualBarcodeDialog> createState() => _ManualBarcodeDialogState();
}

class _ManualBarcodeDialogState extends State<_ManualBarcodeDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = widget.localizations;
    return AlertDialog(
      title: Text(tr.scan_enter_manually),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: tr.product_form_barcode_hint,
          border: const OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr.detail_cancel),
        ),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pop(_controller.text.trim()),
          child: Text(tr.detail_save),
        ),
      ],
    );
  }
}
