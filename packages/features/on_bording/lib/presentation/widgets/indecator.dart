import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class Indecator extends StatelessWidget {
  final int lentgh;
  final int selected;
  const Indecator({super.key, required this.lentgh, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(lentgh, (index) {
        bool isActive = index == selected; 
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          height: AppSize.s7,
          width: AppSize.s28,
          decoration: BoxDecoration(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
            borderRadius: BorderRadius.circular(AppSize.s5),
          ),
        );
      }),
    );
  }
}

