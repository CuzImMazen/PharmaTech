import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/data/models/register_credentials_model.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/register/progress_bar.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/top_section.dart';

class RegisterCredentialsScreen extends StatelessWidget {
  const RegisterCredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterCredentialsBody());
  }
}

class RegisterCredentialsBody extends StatefulWidget {
  const RegisterCredentialsBody({super.key});

  @override
  State<RegisterCredentialsBody> createState() =>
      _RegisterCredentialsBodyState();
}

class _RegisterCredentialsBodyState extends State<RegisterCredentialsBody> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _next() {
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.push(
        AppRoutesKeys.registerDetails,
        extra: RegisterCredentialsModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: context.pHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.vLg,
                TopSection(
                  title: context.tr.auth_signup_account_title,
                  subTitle: context.tr.auth_signup_account_subtitle,
                ),
                context.vLg,
                ProgressBar(currentStep: 1, totalSteps: 2),
                context.vLg,
                // Email Field
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  blockArabic: true,
                  labelText: context.tr.auth_email_label,
                  hintText: "example@example.com",
                  prefixIcon: LucideIcons.mail,
                  controller: emailController,
                  validator: (value) {
                    return ValidatorsManager.emailValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                  onEditingComplete: () {
                    _passwordFocusNode.requestFocus();
                  },
                ),
                context.vLg,
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  blockArabic: true,
                  labelText: context.tr.auth_password_label,
                  hintText: "••••••••",
                  isPassword: true,
                  prefixIcon: LucideIcons.lock,
                  focusNode: _passwordFocusNode,
                  controller: passwordController,
                  onEditingComplete: () {
                    _confirmPasswordFocusNode.requestFocus();
                  },
                  validator: (value) {
                    return ValidatorsManager.passwordValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                ),
                context.vLg,
                CustomTextField(
                  textInputAction: TextInputAction.done,
                  blockArabic: true,
                  labelText: context.tr.auth_confirm_password_label,
                  hintText: "••••••••",
                  isPassword: true,
                  prefixIcon: LucideIcons.lock,
                  focusNode: _confirmPasswordFocusNode,
                  controller: confirmPasswordController,
                  validator: (value) {
                    return ValidatorsManager.confirmPasswordValidator(
                      passwordController.text,
                      value,
                    )?.localizedMessage(context);
                  },
                ),
                context.vLg,
                CustomButton(
                  onTap: _next,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.tr.auth_next,
                        style: context.text.labelLarge?.copyWith(
                          color: context.colors.onPrimary,
                        ),
                      ),
                      context.hSm,
                      Icon(
                        size: 20,
                        Icons.arrow_forward,
                        color: context.colors.onPrimary,
                      ),
                    ],
                  ),
                ),
                context.vMd,
                AuthPromptRow(
                  promptText: context.tr.already_have_account,
                  actionText: context.tr.auth_signin,
                  onPressed: () => context.pop(),
                ),
                context.vLg,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
