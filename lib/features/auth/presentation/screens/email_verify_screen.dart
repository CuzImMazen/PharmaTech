import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

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
  const EmailVerificationBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: SingleChildScrollView(
        child: Column(
          children: [
            context.vXxl,
            _icon(context),
            context.vXxl,
            _title(context),
            context.vXl,
            _sentTo(context),
            context.vMd,
            _email(context),
            context.vXl,
            _instruction(context),
            context.vMd,
            _resend(context),
            context.vMd,
            _footer(context),
            context.vMd,
          ],
        ),
      ),
    );
  }

  Widget _icon(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sXxl),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.primary.withAlpha(30),
      ),
      child: Icon(
        LucideIcons.mail,
        size: 100,
        color: context.colors.primary.withAlpha(150),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      context.tr.emailVerificationTitle,
      style: context.text.headlineLarge,
    );
  }

  Widget _sentTo(BuildContext context) {
    return Text(
      context.tr.emailSentTo,
      style: context.text.bodyLarge!.copyWith(color: context.muted),
    );
  }

  Widget _email(BuildContext context) {
    final style = context.text.bodyLarge!;

    return Text(
      email,
      style: style.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: style.fontSize! + 2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _instruction(BuildContext context) {
    return Text(
      context.tr.emailInstruction,
      textAlign: TextAlign.center,
      style: context.text.bodyLarge!.copyWith(color: context.muted),
    );
  }

  Widget _resend(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: context.btnLg,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: context.rMd,
          color: context.colors.primary.withAlpha(30),
        ),
        child: Center(
          child: Text(
            context.tr.resendLink,
            style: context.text.bodyLarge!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Text(
      context.tr.emailNotFound,
      textAlign: TextAlign.center,
      style: context.text.bodyMedium!.copyWith(color: context.muted),
    );
  }
}
