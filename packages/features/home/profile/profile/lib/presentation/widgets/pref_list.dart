import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/widgets/list_card.dart';
import 'package:router/routes_manager.dart';

class PrefList extends StatelessWidget {
  const PrefList({super.key});

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
            onChanged: (value) {},
            value: false,
          ),
        ],
      ),
    );
  }
}
