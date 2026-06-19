import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_checkEmptyState);
  }

  void _checkEmptyState() {
    final bool isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isEmpty) {
      setState(() {
        _isEmpty = isEmpty;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_checkEmptyState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pHorizontal,
      child: TextField(
        controller: widget.controller,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: "Search by name ",
          prefixIcon: Icon(
            Icons.search,
            color: context.colors.onSurface.withAlpha(140),
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
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
