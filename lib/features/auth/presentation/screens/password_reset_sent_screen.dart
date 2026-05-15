import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/features/auth/presentation/screens/verification_sent_screen.dart';

class PasswordResetSentScreen extends StatelessWidget {
  const PasswordResetSentScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: EmailSentBody(
          email: email,
          title: context.tr.reset_password_title,
          subtitle: context.tr.reset_password_sent_subtitle,
          instruction: context.tr.reset_password_sent_instruction,
        ),
      ),
    );
  }
}
