import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:profile/data/models/settings_model.dart';
import 'package:profile/presentation/widgets/list_card.dart';
import 'package:router/routes_manager.dart';

class AccountList extends StatelessWidget {
  AccountList({super.key});
  final List<SettingsModel> account = [
    SettingsModel(
      name: StringsManager.personalInformations,
      routeName: RoutesManager.personalInfo,
      icon: Icons.privacy_tip_outlined,
    ),
    SettingsModel(
      name: StringsManager.listedCars,
      routeName: RoutesManager.listedCars,
      icon: Icons.garage_outlined,
    ),
    SettingsModel(
      name: StringsManager.notifications,
      routeName: RoutesManager.notifications,
      icon: Icons.notifications_outlined,
    ),
  ];
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
              StringsManager.account,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.start,
            ),
          ),
          ...account.map(
            (accountList) => ListCard(
              icon: accountList.icon,
              route: accountList.routeName,
              title: accountList.name,
            ),
          ),
        ],
      ),
    );
  }
}
