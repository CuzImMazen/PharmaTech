import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/extensions/space_ext.dart';
import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) =>
          prev.rememberMe != curr.rememberMe ||
          prev.screenState != curr.screenState,
      builder: (context, state) {
        final isLoading = state.screenState is LoadingState;

        void toggle() {
          if (!isLoading) {
            context.read<LoginCubit>().toggleRememberMe();
          }
        }

        return Row(
          children: [
            Checkbox(
              value: state.rememberMe,
              onChanged: isLoading ? null : (_) => toggle(),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),

            context.hSm,

            Text(
              context.tr.auth_remember_me,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),

            const Spacer(),

            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: isLoading
                  ? null
                  : () {
                      // TODO: Navigate to forgot password
                    },
              child: Text(
                context.tr.auth_forgot_password,
                style: context.text.labelMedium?.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
