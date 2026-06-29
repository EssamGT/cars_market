import 'package:cars_market/di/di.dart';
import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:constants/values_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:router/routes_manager.dart';

class CSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String)? onChanged;
  final bool isOnResultsScreen;
  const CSearchBar({super.key, this.onChanged, this.isOnResultsScreen = false});

  @override
  State<CSearchBar> createState() => _CSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);
}

class _CSearchBarState extends State<CSearchBar> {
  late TextEditingController searchController;
  late FocusNode searchFocusNode;
  @override
  initState() {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void clearSearch() {
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p10,
      ),
      child: SearchBar(
        controller: searchController,
        constraints: const BoxConstraints(maxHeight: AppSize.s60),
        leading: Icon(
          Iconsax.search_normal,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: StringsManager.searchForCars,
        hintStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyMedium,
        ),
        autoFocus: false,
        focusNode: searchFocusNode,
        onTapOutside: (event) {
          searchFocusNode.unfocus();
        },
        onSubmitted: (value) {
          searchFocusNode.unfocus();
        },

        onChanged: (value) => widget.onChanged?.call(value),
        padding: WidgetStateProperty.all(const EdgeInsets.all(AppPadding.p10)),
        trailing: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(RoutesManager.filterScreen);
            },
            icon: Icon(
              Iconsax.filter,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
        onTap: () {
          if (widget.isOnResultsScreen) {
            context.push(RoutesManager.search);
          }
        },
        elevation: WidgetStateProperty.all(AppSize.s8),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Theme.of(context).colorScheme.scrim,
            width: AppSize.s1_5,
          ),
        ),
        textStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
