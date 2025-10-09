import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/color_theme.dart';

OutlinedButtonThemeData lightOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppSize.s8),
        ),
      ),
      side: WidgetStatePropertyAll(
        BorderSide(width: 1, color: lightThemeColors().outline),
      ),

      minimumSize: WidgetStatePropertyAll(Size(250, 55)),
      backgroundColor: WidgetStatePropertyAll(
        lightThemeColors().surfaceContainerHighest,
      ),
    ),
  );
}
