import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:constants/values_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:router/routes_manager.dart';

class CSearchBar extends StatelessWidget {
  const CSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: SearchBar(
        leading: Icon(
          Iconsax.search_normal,
          color: Theme.of(context).colorScheme.primary,
        ),
        hintText: StringsManager.searchForCars,
        hintStyle: WidgetStateProperty.all(
          Theme.of(context).textTheme.bodyMedium,
        ),

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
            borderRadius: BorderRadius.circular(AppSize.s30),
          ),
        ),
        elevation: WidgetStateProperty.all(AppSize.s8),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Theme.of(context).colorScheme.scrim,
            width: AppSize.s1_5,
          ),
        ),
      ),
    );
  }
}
