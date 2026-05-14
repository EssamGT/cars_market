import 'package:constants/strings_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class StepsIndicator extends StatelessWidget {
  final int index;
  const StepsIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12,vertical: AppPadding.p5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: AppSize.s5,
            children: [
              Text(
                "${StringsManager.steps} ${index + 1} ${StringsManager.of} 3",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: AppMargin.m8),
            width: screenSize.width - AppSize.s20,
            height: AppSize.s8,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: (screenSize.width - AppSize.s24) / 3 * (index + 1),
                  height: AppSize.s8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(AppMargin.m8),
            width: screenSize.width / AppSize.s30,
            height: AppSize.s4,
            decoration: BoxDecoration(
              color: index == 0
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          ),
          Container(
            margin: EdgeInsets.all(AppMargin.m8),
            width: screenSize.width / AppSize.s30,
            height: AppSize.s4,
            decoration: BoxDecoration(
              color: index == 1
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          ),
          Container(
            margin: EdgeInsets.all(AppMargin.m8),
            width: screenSize.width / AppSize.s30,
            height: AppSize.s4,
            decoration: BoxDecoration(
              color: index == 2
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          ),
        ],
      ), */
