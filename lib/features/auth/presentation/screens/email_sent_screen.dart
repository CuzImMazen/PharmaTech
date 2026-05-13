import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
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
    String getTitle(BuildContext context) {
      switch (data.type) {
        case EmailSentScreenType.verification:
          return context.tr.emailSentTitle;
        case EmailSentScreenType.resetPassword:
          return context.tr.reset_password_title;
      }
    }

    String getSubtitle(BuildContext context) {
      switch (data.type) {
        case EmailSentScreenType.verification:
          return context.tr.emailSentTo;
        case EmailSentScreenType.resetPassword:
          return context.tr.reset_password_sent_subtitle;
      }
    }

    String getInstruction(BuildContext context) {
      switch (data.type) {
        case EmailSentScreenType.verification:
          return context.tr.emailInstruction;
        case EmailSentScreenType.resetPassword:
          return context.tr.reset_password_sent_instruction;
      }
    }

    return Padding(
      padding: context.pHorizontal,
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.vMd,

            // Header
            EmailVerificationHeader(
              email: data.email,
              title: getTitle(context),
              subtitle: getSubtitle(context),
            ),

            context.vXl,

            // Instruction texts
            Text(
              getInstruction(context),
              textAlign: TextAlign.center,
              style: context.text.bodyLarge!.copyWith(color: context.muted),
            ),

            context.vMd,

            // Resend button
            ResendLinkButton(onTap: () {}, buttonText: context.tr.resendLink),

            context.vMd,
            AuthPromptRow(
              promptText: context.tr.changed_your_mind,
              actionText: context.tr.auth_signin,
              onPressed: () {
                context.go(AppRoutesKeys.login);
              },
            ),
            context.vLg,
            Container(
              padding: context.pAllMd,
              decoration: BoxDecoration(
                color: context.isDark
                    ? const Color(0xFFB8860B).withAlpha(50)
                    : const Color(0xFFFFFBEB),
                borderRadius: context.rLg,
                border: Border.all(color: const Color(0xFFFFD666), width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xFFFFC107),
                    size: 24,
                  ),
                  context.hMd,
                  // The Arabic text
                  Expanded(
                    child: Text(
                      context.tr.didnt_find_email,

                      style: context.text.bodyMedium!.copyWith(
                        color: context.colors.onSurface,
                        // const Color(0xFFB8860B)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.vMd,
          ],
        ),
      ),
    );
  }
}
