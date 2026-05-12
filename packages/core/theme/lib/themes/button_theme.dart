import 'package:constants/color_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';

ButtonThemeData lightButtonTheme() {
  return ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    splashColor: ColorManager.background,
    buttonColor: ColorManager.primary,

    height: AppSize.s50,
    minWidth: double.infinity,
    padding: EdgeInsets.all(AppPadding.p12),
  );
}
ButtonThemeData darkButtonTheme() {
  return ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    splashColor: ColorManager.backgroundDark,
    buttonColor: ColorManager.primaryDark,

    height: AppSize.s50,
    minWidth: double.infinity,
    padding: EdgeInsets.all(AppPadding.p12),
  );
}
