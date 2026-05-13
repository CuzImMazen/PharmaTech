import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/data/models/email_sent_screen_data.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/icon_container.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(child: ForgetPasswordBody()),
    );
  }
}

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  late final TextEditingController emailController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              context.vXxl,

              // Header
              IconContainer(icon: LucideIcons.keyRound400),
              context.vXl,

              // Instruction texts
              Text(
                context.tr.forgot_password_title,
                textAlign: TextAlign.center,
                style: context.text.headlineLarge,
              ),
              context.vMd,
              Text(
                context.tr.forgot_password_subtitle,
                textAlign: TextAlign.center,
                style: context.text.bodyLarge!.copyWith(color: context.muted),
              ),
              context.vXl,
              CustomTextField(
                prefixIcon: LucideIcons.mail,
                hintText: 'example@example.com',
                labelText: context.tr.auth_email_label,
                controller: emailController,
                validator: (value) {
                  return ValidatorsManager.emailValidator(
                    value,
                  )?.localizedMessage(context);
                },
              ),
              context.vLg,
              CustomButton(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.push(
                      AppRoutesKeys.emailSent,
                      extra: EmailSentScreenData(
                        email: emailController.text.trim(),
                        title: context.tr.emailSentTitle,
                        subtitle: context.tr.reset_password_subtitle,
                        instruction: context.tr.reset_password_instruction,
                        buttonText: context.tr.resendLink,
                        footerText: context.tr.didnt_find_email,
                      ),
                    );
                  }
                },
                text: context.tr.send_reset_password_link,
              ),
              context.vMd,
              AuthPromptRow(
                promptText: context.tr.remembered_password,
                actionText: context.tr.auth_signin,
                onPressed: () {
                  context.pop();
                },
              ),
              context.vMd,
            ],
          ),
        ),
      ),
    );
  }
}
