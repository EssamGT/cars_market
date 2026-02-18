import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:home/presentation/widgets/navigation_controller.dart';
import 'package:router/routes_manager.dart';
import 'package:shared_ui/shared_widgets/animated/animated_container.dart';

class BottomCNavBar extends StatelessWidget {
  final NavigationController controller;
  const BottomCNavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.symmetric(vertical: AppMargin.m16),
      child: Container(
        height: AppSize.s60,
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
        margin: EdgeInsets.symmetric(horizontal: AppMargin.m12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary.withAlpha(200),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withAlpha(30),
              // offset: Offset(AppSize.s0, AppSize.s20),
              blurRadius: AppSize.s20,
              spreadRadius: 0.5,
              blurStyle: BlurStyle.outer,
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            5,

            (index) => GestureDetector(
              behavior: HitTestBehavior.translucent,

              onTap: () {
                if (index == 2) {
                  context.push(RoutesManager.sellCarScreen);
                } else {
                  controller.selectedIndex.value = index;
                }
              },
              child: Obx(() {
                final isActive = controller.selectedIndex.value == index;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppSize.s36,
                      width: AppSize.s36,

                      child: Icon(
                        isActive
                            ? controller.selectedScreensItems[index]
                            : controller.screensItems[index],
                        // Iconsax.home,
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                        size: isActive ? AppSize.s35 : AppSize.s26,
                      ),
                    ),
                    AnimatedBar(isActive: isActive),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
