import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/input_validator_error_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/utils/validator/validators_manager.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/authentication/cubit/register/register_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/register/register_state.dart';
import 'package:pharmacy_app/features/authentication/data/models/register_details_model.dart';
import 'package:pharmacy_app/features/authentication/data/models/register_request_model.dart';

import 'package:pharmacy_app/features/authentication/presentation/widgets/register/buttons_footer.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/register/progress_bar.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/top_section.dart';

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

      RegisterRequestModel registerRequestModel = RegisterRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstName: widget.registerDetailsModel.firstName,
        lastName: widget.registerDetailsModel.lastName,
        phoneNumber: widget.registerDetailsModel.phoneNumber,
        pharmacyName: widget.registerDetailsModel.pharmacyName,
        cityId: widget.registerDetailsModel.cityID,
        address: widget.registerDetailsModel.address,
        licenceNumber: widget.registerDetailsModel.licenseNumber,
        passwordConfirmation: confirmPasswordController.text.trim(),
      );

      context.read<RegisterCubit>().register(model: registerRequestModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<RegisterCubit, bool>(
      (cubit) =>
          cubit.state.maybeWhen(loading: () => true, orElse: () => false),
    );

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          failure: (failure) {
            AppSnackbar.failure(message: failure.localizedMessage(context));
          },
          success: () {
            context.push(
              AppRoutesKeys.verificationSent,
              extra: emailController.text.trim(),
            );
          },
        );
      },
      child: PopScope(
        canPop: !isLoading,
        child: SafeArea(
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

                    // Password Field
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

                    // Confirm Password Field
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

                    // Footer
                    if (isLoading)
                      Center(
                        child: SizedBox(
                          height: context.btnLg,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    else
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
        ),
      ),
    );
  }
}
