import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/enums/enums.dart';
import 'package:pharmacy_app/core/extensions/app_design_system_ext.dart';
import 'package:pharmacy_app/features/filter/presentation/screens/filter_bottom_sheet.dart';
import 'package:pharmacy_app/features/inventory/cubit/view_mode_cubit.dart';

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

class _OrderContainer extends StatefulWidget {
  const _OrderContainer();

  @override
  State<_OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<_OrderContainer> {
  final GlobalKey _key = GlobalKey();

  String currentSort = "Name A→Z";

  Future<void> _openMenu() async {
    final RenderBox renderBox =
        _key.currentContext!.findRenderObject() as RenderBox;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height + 8,
        offset.dx + size.width,
        offset.dy,
      ),
      color: context.mutedSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      items: const [
        PopupMenuItem(value: "Name A→Z", child: Text("Name A→Z")),
        PopupMenuItem(value: "Name Z→A", child: Text("Name Z→A")),
        PopupMenuItem(value: "Price ↑", child: Text("Price ↑")),
        PopupMenuItem(value: "Price ↓", child: Text("Price ↓")),
        PopupMenuItem(value: "Stock ↑", child: Text("Stock ↑")),
        PopupMenuItem(value: "Stock ↓", child: Text("Stock ↓")),
        PopupMenuItem(value: "Exp Late", child: Text("Latest Expiry ")),
        PopupMenuItem(value: "Exp Soon", child: Text("Soonest Expiry")),
      ],
    );

    if (selected != null) {
      setState(() {
        currentSort = selected;
      });

      // update cubit here if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _openMenu,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: context.rLg,
          color: context.mutedSurface,
        ),
        child: Row(
          children: [
            Icon(Icons.arrow_drop_down_sharp, color: context.muted),
            context.hXs,
            Expanded(
              child: Text(
                currentSort,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodyMedium?.copyWith(
                  color: context.colors.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   DropdownMenuItem<String> _item(BuildContext context, String value) {
//     return DropdownMenuItem(
//       value: value,
//       child: Text(
//         value,
//         maxLines: 1,
//         softWrap: false,
//         overflow: TextOverflow.ellipsis,
//         style: context.text.bodyMedium?.copyWith(
//           color: context.colors.onSurface,
//         ),
//       ),
//     );
//   }
// }
class _FilterContainer extends StatelessWidget {
  const _FilterContainer();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: FilterBottomSheet(),
            );
          },
        );
      },
      child: Container(
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
      ),
    );
  }
}

class _ViewTypeContainer extends StatelessWidget {
  const _ViewTypeContainer();

  @override
  Widget build(BuildContext context) {
    final ViewMode viewMode = context.watch<ViewModeCubit>().state;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<ViewModeCubit>().updateViewMode(ViewMode.list);
                },
                child: Icon(
                  Icons.format_list_bulleted,
                  color: viewMode == ViewMode.list
                      ? context.colors.primary
                      : context.muted,
                  size: context.sLg,
                ),
              ),
              context.hSm,

              GestureDetector(
                onTap: () {
                  context.read<ViewModeCubit>().updateViewMode(ViewMode.grid);
                },
                child: Icon(
                  Icons.grid_view,
                  color: viewMode == ViewMode.grid
                      ? context.colors.primary
                      : context.muted,
                  size: context.sLg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
