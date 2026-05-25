import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/app/session/session_cubit.dart';
import 'package:pharmacy_app/core/error/failure.dart';
import 'package:pharmacy_app/core/error/failure_types.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/login/login_state.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/login/continue_withgoogle_btn.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/login/or_divider.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/login/remember_me_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/top_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const LoginScreenBody());
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenBody> {
  bool _shownSnackbar = false;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  void _handleLogin() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
        email: emailController.text,
        password: passwordController.text,
        rememberMe: _rememberMe.value,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //show snack bar when comming from deeplink after email verification success

    final verified = GoRouterState.of(context).uri.queryParameters['verified'];

    if (!_shownSnackbar && verified == 'success') {
      _shownSnackbar = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        AppSnackbar.success(message: context.tr.email_verification_success);
      });
    }
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
    final isEmailLoading = context.select<LoginCubit, bool>(
      (cubit) =>
          cubit.state.maybeWhen(loading: () => true, orElse: () => false),
    );

    final isGoogleLoading = context.select<LoginCubit, bool>(
      (cubit) =>
          cubit.state.maybeWhen(googleLoading: () => true, orElse: () => false),
    );

    final isAnyLoading = isEmailLoading || isGoogleLoading;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (model) {
            final bool isExistingUser =
                model.pharmacy != null || model.isNewUser == false;

            if (isExistingUser) {
              AppSnackbar.success(message: context.tr.auth_login_success);
              context.read<SessionCubit>().setAuthenticated(model.user);
            } else {
              AppSnackbar.success(
                message: context.tr.signin_success_no_details,
              );
              context.go(
                AppRoutesKeys.completeProfile,
                extra: {
                  "firstName": (model.user.firstName == "Google")
                      ? null
                      : model.user.firstName,
                  "lastName": (model.user.lastName == "User")
                      ? null
                      : model.user.lastName,
                },
              );
            }
          },
          failure: (failure) {
            if (failure case AuthFailure(
              type: AuthFailureType.emailNotVerified,
            )) {
              context.push(
                AppRoutesKeys.verificationSent,
                extra: emailController.text.trim(),
              );
              return;
            }
            if (failure case AuthFailure(
              type: AuthFailureType.googleSignInCanceled,
            )) {
              return;
            }
            AppSnackbar.failure(message: failure.localizedMessage(context));
          },
          orElse: () {},
        );
      },
      child: PopScope(
        canPop: !isAnyLoading,
        child: SafeArea(
          child: Form(
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
                      validator: (value) => ValidatorsManager.emailValidator(
                        value,
                      )?.localizedMessage(context),
                      onEditingComplete: () =>
                          _passwordFocusNode.requestFocus(),
                      enabled: !isAnyLoading,
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
                      validator: (value) => ValidatorsManager.passwordValidator(
                        value,
                      )?.localizedMessage(context),
                      onFieldSubmitted: (_) => _handleLogin(),
                      enabled: !isAnyLoading,
                    ),
                    context.vMd,

                    // Remember Me
                    ValueListenableBuilder<bool>(
                      valueListenable: _rememberMe,
                      builder: (_, rememberMe, _) => RememberMeRow(
                        value: rememberMe,
                        onChanged: isAnyLoading
                            ? null
                            : (value) => _rememberMe.value = value ?? false,
                      ),
                    ),
                    context.vMd,

                    // Login Button
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isEmailLoading
                          ? SizedBox(
                              height: context.btnLg,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : CustomButton(
                              onTap: isAnyLoading ? null : _handleLogin,
                              text: context.tr.auth_login_button,
                            ),
                    ),
                    context.vMd,

                    OrDivider(),
                    context.vMd,

                    // Google Sign In
                    ContinueWithGoogleButton(
                      isLoading: isGoogleLoading,
                      onPressed: isAnyLoading
                          ? null
                          : () => context.read<LoginCubit>().loginWithGoogle(),
                    ),
                    context.vMd,

                    // Create Account Prompt
                    AuthPromptRow(
                      promptText: context.tr.auth_no_account,
                      actionText: context.tr.auth_create_account,
                      onPressed: isAnyLoading
                          ? null
                          : () {
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
      ),
    );
  }
}
