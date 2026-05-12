import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/color_theme.dart';

ExpansionTileThemeData lightExpansionTileTheme() {
  return ExpansionTileThemeData(
    collapsedBackgroundColor: lightThemeColors().surface,
    backgroundColor: lightThemeColors().surface,
    childrenPadding: EdgeInsets.symmetric(
      vertical: AppPadding.p12,
      horizontal: AppPadding.p5,
    ),
    collapsedIconColor: lightThemeColors().primary,
    tilePadding: EdgeInsets.all(AppPadding.p10),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s20),

      side: BorderSide(color: lightThemeColors().shadow, width: AppSize.s1),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s20),
      side: BorderSide(color: lightThemeColors().shadow, width: AppSize.s1),
    ),
    expansionAnimationStyle: AnimationStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      reverseCurve: Curves.easeIn,
      reverseDuration: const Duration(milliseconds: 300),
    ),
  );
}
ExpansionTileThemeData darkExpansionTileTheme() {
  return ExpansionTileThemeData(
    collapsedBackgroundColor: darkThemeColors().surface,
    backgroundColor: darkThemeColors().surface,
    childrenPadding: EdgeInsets.symmetric(
      vertical: AppPadding.p12,
      horizontal: AppPadding.p5,
    ),
    collapsedIconColor: darkThemeColors().primary,
    tilePadding: EdgeInsets.all(AppPadding.p10),
    collapsedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s20),

      side: BorderSide(color: darkThemeColors().shadow, width: AppSize.s1),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s20),
      side: BorderSide(color: darkThemeColors().shadow, width: AppSize.s1),
    ),
    expansionAnimationStyle: AnimationStyle(
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      reverseCurve: Curves.easeIn,
      reverseDuration: const Duration(milliseconds: 300),
    ),
  );
}
