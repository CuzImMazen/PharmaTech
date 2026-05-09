import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';

import 'package:pharmacy_app/core/extensions/text_theme_ext.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
            return Checkbox(
              value: value,
              onChanged: isLoading ? null : onChanged,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            );
          },
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
          onPressed: () {
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
  }
}
