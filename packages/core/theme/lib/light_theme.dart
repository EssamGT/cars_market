import 'package:constants/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/themes/app_bar_theme.dart';
import 'package:theme/themes/button_theme.dart';
import 'package:theme/themes/color_theme.dart';
import 'package:theme/themes/imput_decoration.dart';
import 'package:theme/themes/light_navigation_bar_theme.dart';
import 'package:theme/themes/text_slection_theme.dart';
import 'package:theme/themes/text_theme.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.background,
    appBarTheme: lightAppBarTheme(),
    colorScheme: lightThemeColors(),
    textTheme: lightTextTheme(),
    primaryTextTheme: TextTheme(),
    inputDecorationTheme: lightInputDecoration(),
    buttonTheme: lightButtonTheme(),
    useMaterial3: true,
    useSystemColors: true,
    textSelectionTheme: lightTextSlectionTheme(),
    navigationBarTheme: lightNavigationBarTheme()
  
  );
}
