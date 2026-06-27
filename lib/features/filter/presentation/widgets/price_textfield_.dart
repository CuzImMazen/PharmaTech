import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class PriceTextField extends StatefulWidget {
  const PriceTextField({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  State<PriceTextField> createState() => _PriceTextFieldState();
}

class _PriceTextFieldState extends State<PriceTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: _isFocused ? widget.labelText : null,
        hintText: widget.hintText,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.mutedSurface),
          borderRadius: BorderRadius.circular(8.0),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
