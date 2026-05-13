import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/features/auth/data/models/email_sent_screen_data.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/email_verification/email_verification_header.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/email_verification/resend_link_button.dart';

class EmailSentScreen extends StatelessWidget {
  const EmailSentScreen({super.key, required this.data});

  final EmailSentScreenData data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(child: EmailSentScreenBody(data: data)),
    );
  }
}

class EmailSentScreenBody extends StatelessWidget {
  const EmailSentScreenBody({super.key, required this.data});

  final EmailSentScreenData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.vXxl,

            // Header
            EmailVerificationHeader(
              email: data.email,
              title: data.title,
              subtitle: data.subtitle,
            ),

            context.vXl,

            // Instruction texts
            Text(
              data.instruction,
              textAlign: TextAlign.center,
              style: context.text.bodyLarge!.copyWith(color: context.muted),
            ),

            context.vMd,

            // Resend button
            ResendLinkButton(onTap: () {}, buttonText: data.buttonText),

            context.vMd,

            // Footer
            Text(
              data.footerText,
              textAlign: TextAlign.center,
              style: context.text.bodyMedium!.copyWith(color: context.muted),
            ),
            context.vMd,
            AuthPromptRow(
              promptText: context.tr.go_back,
              actionText: context.tr.login_screen,
              onPressed: () {
                context.go(AppRoutesKeys.login);
              },
            ),
            context.vMd,
          ],
        ),
      ),
    );
  }
}
