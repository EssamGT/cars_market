import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final bool isActive;
  final bool inline;
  const AnimatedBar({super.key, required this.isActive, this.inline = false});

  @override
  Widget build(BuildContext context) {
    return inline
        ? AnimatedContainer(
            duration: Duration(milliseconds: 800),
            // curve: Curves.easeInOut,
            // margin: EdgeInsets.only(bottom: AppMargin.m2),
            height: isActive ? AppSize.s30 : AppSize.s0,
            width: isActive ? AppSize.s2 : AppSize.s0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 200),
            margin: EdgeInsets.only(bottom: AppMargin.m2),
            height: AppSize.s4,
            width: isActive ? AppSize.s20 : AppSize.s0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
          );
  }
}
