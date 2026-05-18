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
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/forget_password_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/password_recovery/forget_password_state.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/icon_container.dart';

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
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          failure: (failure) {
            AppSnackbar.failure(message: failure.localizedMessage(context));
          },
          success: () {
            context.push(
              AppRoutesKeys.resetPasswordSent,
              extra: emailController.text.trim(),
            );
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
                BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                  buildWhen: (prev, curr) =>
                      prev.runtimeType != curr.runtimeType,
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );

                    return Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isLoading
                              ? SizedBox(
                                  height: context.btnLg,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : CustomButton(
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<ForgetPasswordCubit>()
                                          .forgetPassword(
                                            email: emailController.text.trim(),
                                          );
                                    }
                                  },
                                  text: context.tr.auth_login_button,
                                ),
                        ),
                        context.vMd,
                        AuthPromptRow(
                          promptText: context.tr.remembered_password,
                          actionText: context.tr.auth_signin,
                          onPressed: isLoading
                              ? null
                              : () {
                                  context.pop();
                                },
                        ),
                      ],
                    );
                  },
                ),
                context.vMd,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
