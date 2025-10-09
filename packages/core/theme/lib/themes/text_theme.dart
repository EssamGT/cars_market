import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/fonts/font_manager.dart';
import 'package:theme/fonts/style_manger.dart';

TextTheme lightTextTheme() {
  return TextTheme(
    // Headlines / Titles
    displayLarge: getExtraBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s36,
      spacing: -0.5,
    ),
    displayMedium: getBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s30,
    ),
    headlineLarge: getBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s28,
    ),
    headlineMedium: getSemiBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s22,
    ),
    headlineSmall: getMediumStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s18,
    ),

    // Body Text (Lato)
    bodyLarge: getRegularStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s16,
      height: 1.5,
    ),
    bodyMedium: getRegularStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s14,
      height: 1.4,
    ),
    bodySmall: getLightStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s13,
      height: 1.3,
    ),
    // Labels / Captions
    labelLarge: getRegularStyle(
      color: ColorManager.textSecondary,
      fontSize: FontSize.s13,
      fontFamily: FontConstants.lato,
      spacing: 0.2,
    ),
    labelMedium: getRegularStyle(
      color: ColorManager.textTertiary,
      fontSize: FontSize.s13,
      fontFamily: FontConstants.lato,
      spacing: 0.2,
    ),
    labelSmall: getLightStyle(
      color: ColorManager.textTertiary,
      fontSize: FontSize.s12,
      fontFamily: FontConstants.lato,
      spacing: 0.3,
    ),


    // 🚀 Buttons / Call-to-Actions
    titleMedium: getMediumStyle(
      color: ColorManager.background,
      fontSize: FontSize.s16,
      spacing: 0.1,
    ),
    titleSmall: getMediumStyle(
      color: ColorManager.background,
      fontSize: FontSize.s14,
      spacing: 0.1,
    ),
  );
}

  // titleLarge: getExtraBoldStyle(
  //     color: ColorManager.textPrimary,
  //     fontSize: FontSize.s30,
  //   ),
  //   titleMedium: getBoldStyle(
  //     color: ColorManager.textPrimary,
  //     fontSize: FontSize.s24,
  //   ),
  //   titleSmall: getSemiBoldStyle(
  //     color: ColorManager.textPrimary,
  //     fontSize: FontSize.s22,
  //   ),
  //   displaySmall: getMediumStyle(
  //     color: ColorManager.background,
  //     fontSize: FontSize.s18,
  //     fontFamily: FontConstants.lato,
  //   ),
  //   bodySmall: getMediumStyle(
  //     color: ColorManager.textTertiary,
  //     fontSize: FontSize.s14,
  //     fontFamily: FontConstants.lato,
  //   ),
  //   bodyMedium: getMediumStyle(
  //     color: ColorManager.primary,
  //     fontSize: FontSize.s14,
  //     fontFamily: FontConstants.lato,
  //   ),
  //   labelLarge: getBoldStyle(
  //     color: ColorManager.primary,
  //     fontFamily: FontConstants.lato,
  //     fontSize: FontSize.s16,
  //   ),
  //   labelSmall: getRegularStyle(
  //     color: ColorManager.textTertiary,
  //     fontFamily: FontConstants.lato,
  //     fontSize: FontSize.s14,
  //   ),
  //   labelMedium: getMediumStyle(
  //     color: ColorManager.textPrimary,
  //     fontFamily: FontConstants.lato,
  //     fontSize: FontSize.s16,
  //   ),
  // );