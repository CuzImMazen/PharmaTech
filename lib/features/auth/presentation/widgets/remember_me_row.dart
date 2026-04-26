import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) =>
              prev.rememberMe != curr.rememberMe || prev.status != curr.status,
          builder: (context, state) {
            final isLoading = state.status == ScreenState.loading;
            return Checkbox(
              value: state.rememberMe,
              onChanged: isLoading
                  ? null
                  : (value) {
                      context.read<LoginCubit>().toggleRememberMe();
                    },
            );
          },
        ),
        Text(
          context.tr.auth_remember_me,
          style: context.text.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colors.secondary,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            //TODO Navigate to forgot password screen
          },
          child: Text(
            context.tr.auth_forgot_password,
            style: context.text.bodyMedium!.copyWith(
              color: context.colors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
