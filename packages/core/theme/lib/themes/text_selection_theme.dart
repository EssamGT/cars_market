import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';

TextSelectionThemeData lightTextSelectionTheme() {
  return TextSelectionThemeData(
    cursorColor: ColorManager.primary,
    selectionHandleColor: ColorManager.primary,
    // selectionColor: ColorManager.primary
  );
}

TextSelectionThemeData darkTextSelectionTheme() {
  return TextSelectionThemeData(
    cursorColor: ColorManager.primaryDark,
    selectionHandleColor: ColorManager.primaryDark,
    // selectionColor: ColorManager.primaryDark
  );
}
