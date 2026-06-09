import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    this.isEmail = false,
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
    this.onlyLetters = false,
    this.enabled = true,
  });

  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool isEmail;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final void Function()? onTap;
  final bool blockArabic;
  final bool onlyLetters;
  final bool onlyDigits;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final double? height;
  final bool enabled;

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
        Text(
          widget.labelText,
          style: theme.textTheme.titleSmall?.copyWith(
            color: widget.enabled ? null : context.muted,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: widget.height,
          child: TextFormField(
            enabled: widget.enabled,
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
            keyboardType: widget.isEmail
                ? TextInputType.emailAddress
                : (widget.isPassword
                      ? TextInputType.visiblePassword
                      : widget.keyboardType),
            inputFormatters: [
              // 1. Strict pattern formatting that rejects the ENTIRE keystroke (including ghost spaces)
              // if an invalid character like an emoji is detected in the stream.
              if (widget.onlyLetters)
                _StrictRegexFormatter(RegExp(r'^[a-zA-Z\u0600-\u06FF\s]*$')),
              if (widget.isEmail)
                _StrictRegexFormatter(RegExp(r'^[a-zA-Z0-9@._\-\+]*$')),
              if (widget.isPassword)
                _StrictRegexFormatter(RegExp(r'^[\x20-\x7E]*$')),
              if (widget.onlyDigits ||
                  widget.keyboardType == TextInputType.phone)
                _StrictRegexFormatter(RegExp(r'^[0-9]*$')),

              // 2. Fallbacks for generic fields
              if (widget.blockArabic && !widget.onlyLetters)
                FilteringTextInputFormatter.deny(RegExp(r'[\u0600-\u06FF]')),
              if (!widget.onlyLetters &&
                  !widget.isEmail &&
                  !widget.isPassword &&
                  !widget.onlyDigits)
                FilteringTextInputFormatter.deny(
                  RegExp(
                    r'[\u{1F300}-\u{1F6FF}\u{2600}-\u{26FF}\u{2700}-\u{27BF}\u{1F900}-\u{1F9FF}\u{1F1E6}-\u{1F1FF}]',
                    unicode: true,
                  ),
                ),
            ],
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: theme.textTheme.bodyLarge?.copyWith(
                color: context.muted.withValues(alpha: 0.5),
              ),
              filled: true,
              fillColor: widget.enabled
                  ? colorScheme.surface
                  : colorScheme.surface.withValues(alpha: 0.6),
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
                      onPressed: widget.enabled
                          ? () => setState(() => _obscureText = !_obscureText)
                          : null,
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
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: context.muted.withValues(alpha: 0.15),
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

class _StrictRegexFormatter extends TextInputFormatter {
  final RegExp pattern;

  _StrictRegexFormatter(this.pattern);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    // Checks if the ENTIRE new string matches our rules
    if (pattern.hasMatch(newValue.text)) {
      return newValue;
    }

    // If it fails (e.g., contains an emoji + a space), return the old value untouched.
    return oldValue;
  }
}
