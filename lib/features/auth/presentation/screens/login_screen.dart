import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_pill_logo.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/remember_me_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppSpaces.vHuge,
                  AuthPillLogo(),
                  AppSpaces.vXl,
                  Text(
                    context.tr.auth_login_title,
                    style: context.text.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppSpaces.vSm,
                  Text(
                    context.tr.auth_login_subtitle,
                    style: context.text.bodyLarge?.copyWith(
                      color: context.colors.secondary,
                    ),
                  ),
                  AppSpaces.vXxl,
                  CustomTextField(
                    blockArabic: true,
                    labelText: context.tr.auth_email_label,
                    hintText: "example@example.com",
                    prefixIcon: LucideIcons.mail,
                    validator: (value) {
                      return ValidatorsManager.emailValidator(
                        value,
                      )?.localizedMessage(context);
                    },
                    controller: emailController,
                  ),
                  AppSpaces.vLg,
                  CustomTextField(
                    blockArabic: true,
                    labelText: context.tr.auth_password_label,
                    hintText: "••••••••",
                    isPassword: true,
                    prefixIcon: LucideIcons.lock,
                    validator: (value) {
                      return ValidatorsManager.passwordValidator(
                        value,
                      )?.localizedMessage(context);
                    },
                    controller: passwordController,
                  ),
                  AppSpaces.vSm,
                  RememberMeRow(
                    rememberMe: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                  ),
                  AppSpaces.vMd,
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        // Handle login action
                      }
                    },
                    text: context.tr.auth_login_button,
                  ),
                  AppSpaces.vLg,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${context.tr.auth_no_account} ",
                        style: context.text.bodyMedium!.copyWith(
                          color: context.colors.secondary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to the registration screen
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          context.tr.auth_create_account,
                          style: context.text.bodyMedium!.copyWith(
                            color: context.colors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.vLg,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
