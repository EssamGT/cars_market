import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/app_bar_theme.dart';
import 'package:theme/themes/button_theme.dart';
import 'package:theme/themes/color_theme.dart';
import 'package:theme/themes/expansion_tile_theme.dart';
import 'package:theme/themes/input_decoration.dart';
import 'package:theme/themes/light_navigation_bar_theme.dart';
import 'package:theme/themes/outlined_button_theme.dart';
import 'package:theme/themes/search_bar_theme.dart';
import 'package:theme/themes/text_selection_theme.dart';
import 'package:theme/themes/text_theme.dart';

ThemeData darkTheme() {
  return ThemeData(
    disabledColor: ColorManager.disabledDark,
    scaffoldBackgroundColor: ColorManager.backgroundDark,
    appBarTheme: darkAppBarTheme(),

    colorScheme: darkThemeColors(),
    textTheme: darkTextTheme(),
    primaryTextTheme: TextTheme(),
    inputDecorationTheme: darkInputDecoration(),
    buttonTheme: darkButtonTheme(),
    outlinedButtonTheme: darkOutlinedButtonTheme(),
    useMaterial3: true,
    textSelectionTheme: darkTextSelectionTheme(),
    navigationBarTheme: darkNavigationBarTheme(),
    searchBarTheme: darkSearchBarTheme(),
    expansionTileTheme: darkExpansionTileTheme(),
  );
}
