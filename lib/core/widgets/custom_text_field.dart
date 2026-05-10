import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/theme/appcolors.dart';
import 'package:pharmacy_app/core/extensions/theme_colors_ext.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.blockArabic = false,
    this.onlyDigits = false,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.height,
  });

  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final void Function()? onTap;
  final bool blockArabic;
  final bool onlyDigits;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final double? height;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: theme.textTheme.titleSmall),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.top,

            expands: widget.height != null,
            maxLines: widget.height != null ? null : 1,
            minLines: widget.height != null ? null : 1,
            onFieldSubmitted: widget.onFieldSubmitted,
            onEditingComplete: widget.onEditingComplete,
            controller: widget.controller,
            focusNode: widget.focusNode,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            validator: widget.validator,
            obscureText: widget.isPassword ? _obscureText : false,
            obscuringCharacter: '•',
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            inputFormatters: [
              if (widget.blockArabic)
                FilteringTextInputFormatter.deny(RegExp(r'[\u0600-\u06FF]')),

              if (widget.keyboardType == TextInputType.phone ||
                  widget.onlyDigits)
                FilteringTextInputFormatter.digitsOnly,
            ],

            style: theme.textTheme.bodyLarge,

            decoration: InputDecoration(
              hintText: widget.hintText,

              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: context.muted.withValues(alpha: 0.5),
              ),
              filled: true,
              fillColor: colorScheme.surface,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: context.muted, size: 22)
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: context.muted,
                        size: 20,
                      ),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: context.muted.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.primaryVariant,
                  width: 1.8,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.redAccent, width: 1),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.redAccent,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
