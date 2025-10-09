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
      RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(AppSize.s8),),
    ),
    shadowColor: WidgetStatePropertyAll(lightThemeColors().shadow),
    // overlayColor: WidgetStatePropertyAll(lightThemeColors().secondary)
    elevation: WidgetStatePropertyAll(AppSize.s5),
    backgroundColor: WidgetStatePropertyAll(lightThemeColors().surface.withAlpha(200)),
     side: WidgetStatePropertyAll(
      BorderSide(width: 0.5,
      color: lightThemeColors().outline
      
      ),
     )
  
  );
}
