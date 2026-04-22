import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/create_account_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/remember_me_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/top_login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginScreenBody());
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenBody> {
  bool rememberMe = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode _passwordFocusNode = FocusNode();

  void _handleLogin() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState?.validate() ?? false) {
      // TODO: login logic
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                AppSpaces.vHuge,
                const TopLoginSection(),
                AppSpaces.vXxl,
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
                AppSpaces.vLg,
                // Password Field
                CustomTextField(
                  textInputAction: TextInputAction.done,
                  blockArabic: true,
                  labelText: context.tr.auth_password_label,
                  hintText: "••••••••",
                  isPassword: true,
                  prefixIcon: LucideIcons.lock,
                  focusNode: _passwordFocusNode,
                  controller: passwordController,
                  validator: (value) {
                    return ValidatorsManager.passwordValidator(
                      value,
                    )?.localizedMessage(context);
                  },
                  onFieldSubmitted: (_) => _handleLogin(),
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
                  onTap: _handleLogin,
                  text: context.tr.auth_login_button,
                ),
                AppSpaces.vLg,
                CreateAccountRow(),
                AppSpaces.vMd,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
