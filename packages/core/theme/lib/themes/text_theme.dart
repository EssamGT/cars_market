import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/fonts/font_manager.dart';
import 'package:theme/fonts/style_manger.dart';

TextTheme lightTextTheme() {
  return TextTheme(
    titleLarge: getExtraBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s30,
    ),
    titleMedium: getBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s24,
    ),
    titleSmall: getSemiBoldStyle(
      color: ColorManager.textPrimary,
      fontSize: FontSize.s22,
    ),
    displaySmall:  getMediumStyle(
      color: ColorManager.background,
      fontSize: FontSize.s18,
      fontFamily: FontConstants.lato
      
    ),
    bodySmall: getMediumStyle(
      color: ColorManager.textTertiary,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.lato
      
    ),
    bodyMedium: getMediumStyle(
      color: ColorManager.primary,
      fontSize: FontSize.s14,
      fontFamily: FontConstants.lato
      
    ),

    labelSmall: getRegularStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s16,
    ),
    labelMedium: getMediumStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s16,
    ),
  );
}
