import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/data/models/email_sent_screen_data.dart';
import 'package:pharmacy_app/features/auth/data/models/register_details_model.dart';

import 'package:pharmacy_app/features/auth/presentation/widgets/register/buttons_footer.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/register/progress_bar.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/top_section.dart';

class RegisterCredentialsScreen extends StatelessWidget {
  const RegisterCredentialsScreen({
    super.key,
    required this.registerDetailsModel,
  });
  final RegisterDetailsModel registerDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterCredentialsBody(registerDetailsModel: registerDetailsModel),
    );
  }
}

class RegisterCredentialsBody extends StatefulWidget {
  const RegisterCredentialsBody({
    super.key,
    required this.registerDetailsModel,
  });
  final RegisterDetailsModel registerDetailsModel;

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

  void _createAccount() {
    if (formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.push(
        AppRoutesKeys.emailSent,
        extra: EmailSentScreenData(
          email: emailController.text.trim(),
          type: EmailSentScreenType.verification,
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
                  icon: LucideIcons.pill,
                  title: context.tr.auth_signup_account_title,
                  subTitle: context.tr.auth_signup_account_subtitle,
                ),
                context.vLg,
                ProgressBar(currentStep: 2, totalSteps: 2),
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

                context.vMd,
                CreateAccountFooter(
                  onBack: () {
                    context.pop();
                  },
                  onTap: () {
                    _createAccount();
                  },
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
