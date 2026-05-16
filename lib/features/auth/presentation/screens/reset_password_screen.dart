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
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/custom_text_field.dart';
import 'package:pharmacy_app/features/auth/cubit/reset_password_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/reset_password_state.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/auth/presentation/widgets/icon_container.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.token,
    required this.email,
  });
  final String token;
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
        child: ResetPasswordBody(email: email, token: token),
      ),
    );
  }
}

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({
    super.key,
    required this.token,
    required this.email,
  });
  final String token;
  final String email;
  @override
  State<ResetPasswordBody> createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          failure: (failure) {
            final errorMessage = failure.localizedMessage(context);
            Snackbar.show(
              context: context,
              message: errorMessage,
              color: Colors.red,
              icon: LucideIcons.x,
            );
          },
          success: () {
            Snackbar.show(
              context: context,
              message: context.tr.reset_password_success,
              color: Colors.green,
              icon: LucideIcons.check,
            );
            context.go(AppRoutesKeys.login);
          },
        );
      },
      child: Padding(
        padding: context.pHorizontal,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                context.vLg,

                // Header
                IconContainer(icon: LucideIcons.lock),
                context.vXl,

                // Instruction texts
                Text(
                  context.tr.reset_password_title,
                  textAlign: TextAlign.center,
                  style: context.text.headlineLarge,
                ),
                context.vMd,
                Text(
                  context.tr.reset_password_subtitle,
                  textAlign: TextAlign.center,
                  style: context.text.bodyLarge!.copyWith(color: context.muted),
                ),
                context.vXl,
                CustomTextField(
                  isPassword: true,
                  hintText: "••••••••",
                  labelText: context.tr.new_password_label,
                  controller: newPasswordController,
                  prefixIcon: LucideIcons.lock,
                  validator: (value) => ValidatorsManager.passwordValidator(
                    value,
                  )?.localizedMessage(context),
                ),
                context.vMd,
                CustomTextField(
                  isPassword: true,
                  hintText: "••••••••",
                  labelText: context.tr.auth_confirm_password_label,
                  controller: confirmPasswordController,
                  prefixIcon: LucideIcons.lock,
                  validator: (value) =>
                      ValidatorsManager.confirmPasswordValidator(
                        value,
                        newPasswordController.text,
                      )?.localizedMessage(context),
                ),
                context.vLg,
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      orElse: () => false,
                      loading: () => true,
                    );
                    if (isLoading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<ResetPasswordCubit>().resetPassword(
                            email: widget.email.trim(),
                            password: newPasswordController.text.trim(),
                            passwordConfirmation:
                                confirmPasswordController.text,
                            token: widget.token,
                          );
                        }
                      },
                      text: context.tr.reset_password_btn,
                    );
                  },
                ),
                context.vMd,
                AuthPromptRow(
                  promptText: context.tr.changed_your_mind,
                  actionText: context.tr.auth_signin,
                  onPressed: () {
                    context.go(AppRoutesKeys.login);
                  },
                ),
                // context.vMd,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
