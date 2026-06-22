import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';

class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(flex: 3, child: _OrderContainer()),
          context.hSm,
          const Expanded(flex: 3, child: _FilterContainer()),
          context.hSm,
          Expanded(flex: 2, child: _ViewTypeContainer()),
        ],
      ),
    );
  }
}

class _OrderContainer extends StatelessWidget {
  const _OrderContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        color: context.mutedSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_drop_down_sharp, color: context.muted),
              context.hXs,
              Text("Name A-Z", style: context.text.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterContainer extends StatelessWidget {
  const _FilterContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        color: context.colors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.tune, color: Colors.white),
              context.hSm,
              Text(
                "Filters",
                style: context.text.bodyMedium!.copyWith(color: Colors.white),
              ),
              context.hSm,
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    "3",
                    style: context.text.bodyMedium!.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewTypeContainer extends StatelessWidget {
  const _ViewTypeContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: context.rLg,
        color: context.mutedSurface,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, // Centers icons inside its allocated space
            children: [
              Icon(Icons.grid_view, color: context.muted, size: context.sLg),
              context.hSm,
              Icon(
                Icons.format_list_bulleted,
                color: context.colors.primary,
                size: context.sLg,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
