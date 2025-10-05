import 'package:constants/color_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/color_theme.dart';

NavigationBarThemeData lightNavigationBarTheme() {
  return NavigationBarThemeData(
    height: AppSize.s80,
    backgroundColor: lightThemeColors().surface,
    indicatorColor: ColorManager.transparent,
    elevation: AppSize.s10,
    shadowColor: lightThemeColors().shadow,

    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: lightThemeColors().secondary, size: AppSize.s25),
    ),
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    // labelPadding: EdgeInsets.all(AppPadding.p2),
    // surfaceTintColor: lightThemeColors().shadow,
    overlayColor: WidgetStatePropertyAll(lightThemeColors().shadow),
  );
}
