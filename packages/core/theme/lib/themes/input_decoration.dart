import 'package:constants/color_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/color_theme.dart';
import 'package:theme/themes/text_theme.dart';

InputDecorationThemeData lightInputDecoration() {
  return InputDecorationThemeData(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: Colors.transparent, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),

    fillColor: ColorManager.surfaceVariant,

    filled: true,
    activeIndicatorBorder: BorderSide(color: ColorManager.surfaceVariant),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(
        color: lightThemeColors().primary.withAlpha(100),
        // width: 2,
      ),
    ),
    hintStyle: lightTextTheme().bodyMedium,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: lightThemeColors().error),
    ),
    errorStyle: lightTextTheme().bodySmall!.copyWith(
      color: lightThemeColors().error,
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: lightThemeColors().error),
    ),
  );
}

InputDecorationThemeData darkInputDecoration() {
  return InputDecorationThemeData(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: Colors.transparent, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),

    fillColor: ColorManager.surfaceVariantDark,

    filled: true,
    activeIndicatorBorder: BorderSide(color: ColorManager.surfaceVariantDark),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(
        color: darkThemeColors().primary.withAlpha(100),
        // width: 2,
      ),
    ),
    hintStyle: darkTextTheme().bodyMedium,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: darkThemeColors().error),
    ),
    errorStyle: darkTextTheme().bodySmall!.copyWith(
      color: darkThemeColors().error,
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: darkThemeColors().error),
    ),
  );
}
