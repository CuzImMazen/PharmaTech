import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';

import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';

import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/login/continue_withgoogle_btn.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/login/or_divider.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/login/remember_me_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/top_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginScreenBody());
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenBody> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode _passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  void _handleLogin() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().test();
    }
  }

  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _passwordFocusNode.dispose();
    _rememberMe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (token) {
            Snackbar.show(
              context: context,
              message: context.tr.auth_login_success,
              color: Colors.green,
            );
          },
          failure: (failure) {
            Snackbar.show(
              context: context,
              message: failure.localizedMessage(context),
              color: Colors.red,
            );
          },
          orElse: () {},
        );
      },
      child: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Padding(
            padding: context.pHorizontal,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.vLg,
                  TopSection(
                    icon: LucideIcons.pill,
                    title: context.tr.auth_login_title,
                    subTitle: context.tr.auth_login_subtitle,
                  ),
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
                  context.vMd,
                  ValueListenableBuilder<bool>(
                    valueListenable: _rememberMe,
                    builder: (_, rememberMe, _) {
                      return RememberMeRow(
                        value: rememberMe,
                        onChanged: (value) {
                          _rememberMe.value = value ?? false;
                        },
                      );
                    },
                  ),
                  context.vMd,
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (prev, curr) =>
                        prev.runtimeType != curr.runtimeType,
                    builder: (context, state) {
                      final isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );

                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isLoading
                            ? SizedBox(
                                height: context.btnLg,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : CustomButton(
                                onTap: _handleLogin,
                                text: context.tr.auth_login_button,
                              ),
                      );
                    },
                  ),
                  context.vMd,
                  OrDivider(),
                  context.vMd,

                  ContinueWithGoogleButton(
                    onPressed: () {
                      // TODO: Handle Google Sign-In logic here
                    },
                  ),
                  context.vMd,
                  AuthPromptRow(
                    promptText: context.tr.auth_no_account,
                    actionText: context.tr.auth_create_account,
                    onPressed: () {
                      context.push(AppRoutesKeys.registerDetails);
                      FocusManager.instance.primaryFocus?.unfocus();
                      formKey.currentState?.reset();
                    },
                  ),
                  context.vLg,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
