import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/color/appcolors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    required this.validator,
    required this.controller,
    // Removed isNumber and added keyboardType
    this.keyboardType = TextInputType.text,
    this.isName = false,
    this.readOnly = false,
    this.onTap,
    this.blockArabic = false,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
    this.onFieldSubmitted,
  });

  final String hintText;
  final String labelText;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType keyboardType; // Changed to TextInputType
  final bool isName;
  final bool readOnly;
  final void Function()? onTap;
  final bool blockArabic;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<CustomTextField> {
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
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
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
            textAlign: TextAlign.start,

            // Now using the passed keyboardType directly
            keyboardType: widget.keyboardType,

            inputFormatters: [
              if (widget.blockArabic)
                FilteringTextInputFormatter.deny(RegExp(r'[\u0600-\u06FF]')),
            ],

            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: colorScheme.secondary.withValues(alpha: 0.5),
                fontSize: 16,
              ),
              filled: true,
              fillColor: colorScheme.surface,

              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: colorScheme.secondary,
                      size: 22,
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: colorScheme.secondary,
                        size: 20,
                      ),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    )
                  : null,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: colorScheme.secondary.withValues(alpha: 0.2),
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
