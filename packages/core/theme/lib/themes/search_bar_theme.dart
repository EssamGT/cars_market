import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/color_theme.dart';
import 'package:theme/themes/text_theme.dart';

SearchBarThemeData lightSearchBarTheme() {
  return SearchBarThemeData(
    textStyle: WidgetStatePropertyAll(
      lightTextTheme().bodyMedium,
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(AppSize.s15),),
    ),
    shadowColor: WidgetStatePropertyAll(lightThemeColors().shadow),
    // overlayColor: WidgetStatePropertyAll(lightThemeColors().secondary)
    elevation: WidgetStatePropertyAll(AppSize.s10),
    backgroundColor: WidgetStatePropertyAll(lightThemeColors().surface),
    side: WidgetStatePropertyAll(
      BorderSide(
        color: lightThemeColors().onSurface.withAlpha(40),
        width: 1,
      ),
    ),
  
  );
}

SearchBarThemeData darkSearchBarTheme() {
  return SearchBarThemeData(
    textStyle: WidgetStatePropertyAll(
      darkTextTheme().bodyMedium,
    ),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(AppSize.s15),),
    ),
    shadowColor: WidgetStatePropertyAll(darkThemeColors().shadow),
    // overlayColor: WidgetStatePropertyAll(darkThemeColors().secondary)
    elevation: WidgetStatePropertyAll(AppSize.s10),
    backgroundColor: WidgetStatePropertyAll(darkThemeColors().surface),
    side: WidgetStatePropertyAll(
      BorderSide(
        color: darkThemeColors().onSurface.withAlpha(40),
        width: 1,
      ),
    ),
  
  );
}
