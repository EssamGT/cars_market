import 'package:flutter/material.dart';
import 'package:search/presentation/widgets/c_search_bar.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CSearchBar(isOnResultsScreen: true, onChanged: (s) {}),
    );
  }
}
