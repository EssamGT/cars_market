import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';

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
    surfaceContainerHighest: ColorManager.surfaceVariant,
    onSurface: ColorManager.secondary,
    outline: ColorManager.outline,
    shadow: ColorManager.shadow,
    scrim: ColorManager.textPrimary.withAlpha(50),
  );
}

ColorScheme darkThemeColors() {
  return ColorScheme(
    brightness: Brightness.dark,
    primary: ColorManager.primaryDarkTheme,
    onPrimary: ColorManager.primaryLightDarkTheme,
    secondary: ColorManager.secondaryDarkTheme,
    onSecondary: ColorManager.onSecondaryDarkTheme,
    error: ColorManager.errorDark,
    onError: ColorManager.textPrimaryDark,
    surface: ColorManager.surfaceDark,
    surfaceContainerHighest: ColorManager.surfaceVariantDark,
    onSurface: ColorManager.secondaryDarkTheme,
    outline: ColorManager.outlineDark,
    shadow: ColorManager.shadowDark,
    scrim: ColorManager.textPrimaryDark.withAlpha(50),
  );
}
