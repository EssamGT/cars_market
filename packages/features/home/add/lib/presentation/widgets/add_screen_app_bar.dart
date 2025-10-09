import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddScreenAppBar extends StatelessWidget  implements PreferredSizeWidget {
  const AddScreenAppBar({super.key});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
        title: Text(
          StringsManager.list,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium,
        ),
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
      );
  }
  
  @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}