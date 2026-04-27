import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/state/screen_state.dart';
import 'package:pharmacy_app/features/auth/cubit/login_cubit.dart';
import 'package:pharmacy_app/features/auth/cubit/login_state.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Row(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (prev, curr) =>
              prev.acceptTerms != curr.acceptTerms ||
              prev.screenState != curr.screenState,
          builder: (context, state) {
            final isLoading = (state.screenState is LoadingState);
            return Checkbox(
              value: state.acceptTerms,
              onChanged: isLoading
                  ? null
                  : (value) {
                      context.read<LoginCubit>().toggleAcceptTerms();
                    },
            );
          },
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                //
                TextSpan(text: '${context.tr.agree_to} '),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Navigate to terms page
                    },
                    child: Text(
                      context.tr.terms_and_conditions,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                TextSpan(text: ' ${context.tr.and} '),

                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Navigate to privacy page
                    },
                    child: Text(
                      context.tr.privacy_policy,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
