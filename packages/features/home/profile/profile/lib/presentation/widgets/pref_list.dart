import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:profile/presentation/widgets/list_card.dart';
import 'package:router/routes_manager.dart';
import 'package:theme/theme_controller.dart';

class PrefList extends StatefulWidget {
  const PrefList({super.key});

  @override
  State<PrefList> createState() => _PrefListState();
}

class _PrefListState extends State<PrefList> {
  ThemeController themeController = Get.find<ThemeController>();
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(AppSize.s12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(40),
            blurRadius: 5,
            offset: Offset(0, 2),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
            child: Text(
              StringsManager.preferences,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
            ),
          ),
          ListCard(
            route: RoutesManager.language,
            icon: Icons.language,
            title: StringsManager.language,
          ),
          ListCardToggle(
            icon: Icons.dark_mode,
            title: StringsManager.darkMode,
            onChanged: (value) {
              themeController.changeThemeMode(value ? 2 : 1);
            },
            value: context.isDarkMode,
          ),
        ],
      ),
    );
  }
}
