import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theme/fonts/font_manager.dart';
import 'package:theme/fonts/style_manger.dart';
import 'package:theme/themes/color_theme.dart';

AppBarTheme lightAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: getSemiBoldStyle(
      color: lightThemeColors().onError,
      fontSize: FontSize.s16,
    ),
     
    foregroundColor: lightThemeColors().onError,
  );
}
AppBarTheme darkAppBarTheme() {
  return AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: getSemiBoldStyle(
      color: darkThemeColors().onError,
      fontSize: FontSize.s16,
    ),
     
    foregroundColor: darkThemeColors().onError,
  );
}
