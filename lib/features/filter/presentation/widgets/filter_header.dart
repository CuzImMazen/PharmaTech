import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/core/theme/app_colors.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Reset filters?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.cozyRose,
                            ),
                          ),
                          content: const Text(
                            "This will clear all selected filters. This action cannot be undone.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),
                            FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                                {}
                              },
                              child: const Text("Reset"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Reset",
                    style: context.text.labelLarge?.copyWith(
                      color: AppColors.cozyRose,
                    ),
                  ),
                ),
              ),
            ),

            Text(
              "Filters & Sort",
              style: context.text.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: Icon(Icons.close, color: context.muted),
                ),
              ),
            ),
          ],
        ),
        context.vMd,
        //  Divider(color: context.mutedSurface, thickness: 2.0),
      ],
    );
  }
}
