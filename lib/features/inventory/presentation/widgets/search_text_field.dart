import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.hintText = 'Search by name',
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final String hintText;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _controller;
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_checkEmptyState);
  }

  void _checkEmptyState() {
    final bool isEmpty = _controller.text.isEmpty;
    if (isEmpty != _isEmpty) {
      setState(() {
        _isEmpty = isEmpty;
      });
    }
    widget.onChanged?.call(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_checkEmptyState);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: TextField(
        controller: _controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(
            Icons.search,
            color: context.colors.onSurface.withAlpha(140),
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    widget.onClear?.call();
                  },
                  child: Icon(
                    Icons.clear,
                    color: context.colors.onSurface.withAlpha(140),
                  ),
                )
              : null,

          enabledBorder: OutlineInputBorder(
            borderRadius: context.rMd,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline.withAlpha(170),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: context.rMd,
            borderSide: BorderSide(color: AppColors.primary.withAlpha(150)),
          ),
        ),
      ),
    );
  }
}
