import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/router/app_routes_keys.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/features/authentication/cubit/email_verification/resend_email_verification_cubit.dart';
import 'package:pharmacy_app/features/authentication/cubit/email_verification/resend_email_verification_state.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/auth_prompt_row.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/link_sent_header.dart';
import 'package:pharmacy_app/features/authentication/presentation/widgets/resend_link_button.dart';

class VerificationSentScreen extends StatelessWidget {
  const VerificationSentScreen({super.key, required this.email});

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
        child: VerificationEmailSentBody(
          email: email,
          title: context.tr.emailSentTitle,
          subtitle: context.tr.emailSentTo,
          instruction: context.tr.emailInstruction,
        ),
      ),
    );
  }
}

class VerificationEmailSentBody extends StatelessWidget {
  const VerificationEmailSentBody({
    super.key,
    required this.email,
    required this.title,
    required this.subtitle,
    required this.instruction,
  });

  final String email;
  final String title;
  final String subtitle;
  final String instruction;

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      ResendEmailVerificationCubit,
      ResendEmailVerificationState
    >(
      listenWhen: (previous, current) =>
          previous.screenState != current.screenState,
      listener: (context, state) {
        if (state.screenState is SuccessState) {
          Snackbar.show(
            context: context,
            message: context.tr.resend_link_success,
            color: Colors.green,
          );
        }
        if (state.screenState is FailureState) {
          Snackbar.show(
            context: context,
            message: context.tr.couldnt_resend_link,
            color: Colors.red,
          );
        }
      },
      child: Padding(
        padding: context.pHorizontal,
        child: SingleChildScrollView(
          child: Column(
            children: [
              context.vMd,

              LinkSentHeader(email: email, title: title, subtitle: subtitle),

              context.vXl,

              Text(
                instruction,
                textAlign: TextAlign.center,
                style: context.text.bodyLarge!.copyWith(color: context.muted),
              ),

              context.vMd,

              BlocBuilder<
                ResendEmailVerificationCubit,
                ResendEmailVerificationState
              >(
                builder: (context, state) {
                  if (state.screenState is LoadingState) {
                    return SizedBox(
                      height: context.btnLg,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  final bool canClick = state.canResend;

                  return ResendLinkButton(
                    onTap: canClick
                        ? () {
                            context
                                .read<ResendEmailVerificationCubit>()
                                .resendEmailVerificationLink(email);
                          }
                        : null,

                    buttonText: canClick
                        ? context.tr.resendLink
                        : context.tr.you_can_resend_after(
                            state.remainingSeconds.toString(),
                          ),
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

              context.vLg,

              Container(
                padding: context.pAllMd,
                decoration: BoxDecoration(
                  color: context.isDark
                      ? const Color(0xFFB8860B).withAlpha(50)
                      : const Color(0xFFFFFBEB),
                  borderRadius: context.rLg,
                  border: Border.all(
                    color: const Color(0xFFFFD666),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_outline,
                      color: Color(0xFFFFC107),
                      size: 24,
                    ),
                    context.hMd,
                    Expanded(
                      child: Text(
                        context.tr.didnt_find_email,
                        style: context.text.bodyMedium!.copyWith(
                          color: context.colors.onSurface,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              context.vMd,
            ],
          ),
        ),
      ),
    );
  }
}
