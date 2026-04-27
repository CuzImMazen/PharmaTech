import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/consts/sizes/sizes.dart';
import 'package:pharmacy_app/core/consts/spaces/spaces.dart';
import 'package:pharmacy_app/core/error/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/remember_me_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/terms_and_conditions_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/top_login_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: LoginScreenBody(),
      ),
    );
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

  void _handleLogin() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().testError();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.screenState != current.screenState,
      listener: (context, state) {
        if (state.screenState is SuccessState) {
          Snackbar.show(
            context: context,
            message: context.tr.auth_login_success,
            color: context.colors.primary,
          );
        } else if (state.screenState case FailureState failureState) {
          Snackbar.show(
            context: context,
            message: failureState.failure.localizedMessage(context),
            color: context.colors.error,
          );
        }
      },
      child: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.common),
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
                RememberMeRow(),
                AppSpaces.vMd,

                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (prev, curr) =>
                      prev.acceptTerms != curr.acceptTerms ||
                      prev.screenState != curr.screenState,
                  builder: (context, state) {
                    final isLoading = state.screenState == const LoadingState();

                    if (isLoading) {
                      return const SizedBox(
                        height: 65,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return CustomButton(
                      onTap: state.acceptTerms ? _handleLogin : null,
                      text: context.tr.auth_login_button,
                    );
                  },
                ),
                AppSpaces.vMd,
                TermsAndConditionsRow(),
                AppSpaces.vMd,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
