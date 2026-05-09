import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:go_router/go_router.dart';
import 'package:home/presentation/widgets/navigation_controller.dart';
import 'package:profile/presentation/cubit/profile_cubit.dart';
import 'package:router/routes_manager.dart';

class SupportList extends StatelessWidget {
  SupportList({super.key});
  final controller = Get.put(NavigationController());
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
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          spacing: AppSize.s20,
          children: [
            FilledButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size(double.infinity, AppSize.s48),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.support_agent),
                  SizedBox(width: AppSize.s8),
                  Text(
                    StringsManager.support,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
            FilledButton(
              onPressed: () {
                ProfileCubit.get(context).logOut();
                context.go(RoutesManager.login);
                controller.resetIndex();
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                side: WidgetStatePropertyAll(
                  BorderSide(color: Theme.of(context).colorScheme.onError),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                  ),
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size(double.infinity, AppSize.s48),
                ),
                overlayColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary.withAlpha(40),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                  SizedBox(width: AppSize.s8),
                  Text(
                    StringsManager.logout,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
