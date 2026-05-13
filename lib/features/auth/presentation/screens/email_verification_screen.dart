import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/email_verification/email_verification_header.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/email_verification/resend_link_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(child: EmailVerificationBody(email: email)),
    );
  }
}

class EmailVerificationBody extends StatelessWidget {
  const EmailVerificationBody({super.key, required this.email, this.onResend});

  final String email;
  final VoidCallback? onResend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.vXxl,

            // Header
            EmailVerificationHeader(email: email),

            context.vXl,

            // Instruction texts
            Text(
              context.tr.emailInstruction,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge!.copyWith(color: context.muted),
            ),

            context.vMd,

            // Resend button
            ResendLinkButton(onTap: onResend),

            context.vMd,

            // Footer
            Text(
              context.tr.emailNotFound,
              textAlign: TextAlign.center,
              style: context.text.bodyMedium!.copyWith(color: context.muted),
            ),

            context.vMd,
          ],
        ),
      ),
    );
  }
}
