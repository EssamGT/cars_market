import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final bool isActive;
  const AnimatedBar({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: AppMargin.m2),
      height: AppSize.s4,
      width: isActive? AppSize.s20: AppSize.s0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    );
  }
}
