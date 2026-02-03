import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';

class FilterScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FilterScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      forceMaterialTransparency: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Theme.of(context).colorScheme.onError,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        StringsManager.filterOptions,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
