import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_cubit.dart';
import 'package:pharmacy_app/core/app/auth/sign_out_state.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/extensions/failure_message_localization_ext.dart';
import 'package:pharmacy_app/core/extensions/localization_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';
import 'package:pharmacy_app/core/utils/messages/snackbar.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/features/authentication/data/models/user_model.dart';
import 'package:pharmacy_app/features/profile/cubit/profile_cubit.dart';
import 'package:pharmacy_app/features/profile/cubit/profile_state.dart';

/// Shows the authenticated user's profile (name, email, phone, verification
/// badge) and a Sign Out action. Data comes from `GET /user` via
/// [ProfileCubit]; a cached user seeds the view instantly.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;

    return BlocProvider(
      create: (_) => SignOutCubit(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (p, c) => p.failure != c.failure,
        listener: (context, state) {
          if (state.failure != null) {
            AppSnackbar.failure(message: state.failure!.localizedMessage(context));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr.profile_title),
            actions: [
              BlocBuilder<ProfileCubit, ProfileState>(
                buildWhen: (p, c) => p.isRefreshing != c.isRefreshing,
                builder: (context, state) {
                  return IconButton(
                    icon: state.isRefreshing
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.refresh_rounded),
                    onPressed: state.isRefreshing
                        ? null
                        : () => context.read<ProfileCubit>().refresh(),
                  );
                },
              ),
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state.isLoading && state.user == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                final user = state.user;
                if (user == null) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(tr.profile_load_error),
                        context.vMd,
                        FilledButton(
                          onPressed: () =>
                              context.read<ProfileCubit>().load(),
                          child: Text(tr.inventory_retry),
                        ),
                      ],
                    ),
                  );
                }
                return _ProfileBody(user: user);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody({required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final firstName = user.firstName;
    final fatherName = user.fatherName;
    final lastName = user.lastName;
    final email = user.email;
    final phone = user.phoneNumber;
    final isVerified = user.isVerified;

    final fullName = [firstName, fatherName, lastName]
        .where((s) => s != null && s.trim().isNotEmpty)
        .join(' ');

    final initials = ((firstName.isNotEmpty ? firstName[0] : '') +
            (lastName.isNotEmpty ? lastName[0] : ''))
        .toUpperCase();

    return SingleChildScrollView(
      padding: context.pScreen,
      child: Column(
        children: [
          // Avatar.
          CircleAvatar(
            radius: context.iXxl,
            backgroundColor: AppColors.primary.withAlpha(30),
            child: Text(
              initials.isEmpty ? '?' : initials,
              style: context.text.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          context.vLg,
          Text(
            fullName,
            style: context.text.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          context.vXs,
          Text(
            email,
            style: context.text.bodyMedium?.copyWith(color: context.muted),
          ),
          context.vMd,
          _VerifiedBadge(isVerified: isVerified),
          context.vXl,

          // Details card.
          _DetailCard(
            children: [
              _DetailRow(
                icon: Icons.person_outline_rounded,
                label: context.tr.profile_name,
                value: fullName,
              ),
              _DetailDivider(),
              _DetailRow(
                icon: Icons.alternate_email_rounded,
                label: context.tr.profile_email,
                value: email,
              ),
              if (phone != null && phone.isNotEmpty) ...[
                _DetailDivider(),
                _DetailRow(
                  icon: Icons.phone_outlined,
                  label: context.tr.profile_phone,
                  value: phone,
                ),
              ],
            ],
          ),
          context.vXxl,

          // Sign out.
          const _SignOutSection(),
        ],
      ),
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge({required this.isVerified});

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final color = isVerified ? AppColors.primary : AppColors.cozyAmber;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.sMd,
        vertical: context.sXs,
      ),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(context.sHuge),
        border: Border.all(color: color.withAlpha(120)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isVerified ? Icons.verified_rounded : Icons.warning_amber_rounded,
            size: context.iSm,
            color: color,
          ),
          SizedBox(width: context.sXs),
          Text(
            isVerified ? tr.profile_verified : tr.profile_not_verified,
            style: context.text.labelLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.5,
          color: context.colors.outline.withAlpha(170),
        ),
        color: context.colors.surfaceContainer,
      ),
      child: Column(children: children),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.sMd,
        vertical: context.sMd,
      ),
      child: Row(
        children: [
          Icon(icon, size: context.iMd, color: context.primary),
          context.hMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: context.text.labelSmall?.copyWith(color: context.muted),
                ),
                SizedBox(height: context.sXs),
                Text(
                  value,
                  style: context.text.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: context.colors.outline.withAlpha(80),
      indent: context.sMd,
      endIndent: context.sMd,
    );
  }
}

class _SignOutSection extends StatelessWidget {
  const _SignOutSection();

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocBuilder<SignOutCubit, SignOutState>(
      buildWhen: (p, c) => p.isSigningOut != c.isSigningOut,
      builder: (context, state) {
        return CustomButton(
          onTap: state.isSigningOut ? null : () => _confirm(context),
          child: state.isSigningOut
              ? const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.logout_rounded, color: Colors.white),
                    SizedBox(width: context.sSm),
                    Text(tr.sign_out),
                  ],
                ),
        );
      },
    );
  }

  Future<void> _confirm(BuildContext context) async {
    final tr = context.tr;
    final cubit = context.read<SignOutCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(tr.sign_out_confirm_title),
        content: Text(tr.sign_out_confirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(tr.detail_cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(tr.sign_out),
          ),
        ],
      ),
    );
    if (confirmed == true) cubit.signOut();
  }
}
