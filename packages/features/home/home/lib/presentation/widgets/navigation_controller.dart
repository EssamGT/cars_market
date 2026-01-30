import 'package:favorites/presentation/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:main/presentation/main_screen.dart';
import 'package:profile/presentation/profile_screen.dart';
import 'package:search/presentation/search_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return MainScreen();
      case 1:
        return SearchScreen();
      // case 2:
      //   return AddScreen();
      case 3:
        return FavoritesScreen();
      case 4:
        return ProfileScreen();
      default:
        return MainScreen();
    }
  }

  final List<IconData> screensItems = [
    Iconsax.home_1_copy,
    Iconsax.search_normal_copy,
    Iconsax.add_circle_copy,
    Icons.favorite_border,
    Icons.person_outline_rounded,
  ];
  final List<IconData> selectedScreensItems = [
    Iconsax.home,
    Iconsax.search_normal,
    Iconsax.add_circle,
    Icons.favorite,
    Icons.person_rounded,
  ];
}
