import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/consts/assets.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

import 'package:pharmacy_app/core/utils/helpers/image_helper.dart';

class ContinueWithGoogleButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ContinueWithGoogleButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.btnLg,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: context.colors.surface,
          foregroundColor: context.colors.onSurface,
          side: BorderSide(color: context.muted.withAlpha(100)),
          shape: RoundedRectangleBorder(borderRadius: context.rLg),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage.svg(AppAssets.googleLogo, height: 20, width: 20),
            context.hMd,
            Text(context.tr.auth_signin_with_google),
          ],
        ),
      ),
    );
  }
}
