import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:constants/values_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:router/routes_manager.dart';

class CSearchBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function(String)? onChanged;
  const CSearchBar({super.key, this.onChanged});

  @override
  State<CSearchBar> createState() => _CSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);
}

class _CSearchBarState extends State<CSearchBar> {
  late FocusNode searchFocusNode;
  @override
  initState() {
    searchFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p10,
      ),
      child: SearchBar(
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
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),

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
