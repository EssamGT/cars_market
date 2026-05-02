import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool blockPop;
  const BaseAppBar({super.key, required this.title, this.blockPop = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      forceMaterialTransparency: true,
      centerTitle: true,
      leading: IconButton(
        onPressed: blockPop
            ? null
            : () {
                context.pop();
              },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
