import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';

// ColorScheme lightThemeColors() {
//   return ColorScheme(
//     brightness: Brightness.light,
//     primary: ColorManager.primary,
//     onPrimary: ColorManager.darkGray,
//     secondary: ColorManager.background,
//     onSecondary: ColorManager.lightGray,
//     error: ColorManager.error,
//     onError: ColorManager.black,
//     surface: ColorManager.black,
//     onSurface: ColorManager.lightGray,
//   );
// }
ColorScheme lightThemeColors() {
  return ColorScheme(
    brightness: Brightness.light,
    primary: ColorManager.primary,
    onPrimary: ColorManager.primaryLight,
    secondary: ColorManager.secondary,
    onSecondary: ColorManager.onSecondary,
    error: ColorManager.error,
    onError: ColorManager.textPrimary,
    surface: ColorManager.background,
    surfaceContainerHighest : ColorManager.surfaceVariant,
    onSurface: ColorManager.secondary,
    outline: ColorManager.outline,
    shadow: ColorManager.shadow,
    scrim: ColorManager.textPrimary.withAlpha(50),
    
    
    
    
  );
}
