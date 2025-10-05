import 'package:flutter/material.dart';

// abstract class ColorManager {
//   static const Color primary = Color(0xff1A73E8);
//   static const Color background = Color(0xFFf6f7f8);
//   static const Color silver = Color(0xFFC0C0C0);
//   static const Color darkGray = Color(0xFFA9A9A9);
//   static const Color slateGray = Color(0xFF708090);
//   static const Color lightGray = Color(0xFFeceff4);
//   static const Color unselected = Color(0xFF757575);
//   static const Color black = Color(0xFF000000);
//   static const Color text = Color(0xFF333333);
//   static const Color transparent = Colors.transparent;

//   static const Color error = Colors.red;




// }
abstract class ColorManager {
  // Brand
  static const Color primary = Color(0xff1A73E8); // Blue
  static const Color primaryDark = Color(0xff0F5ABD);
  static const Color primaryLight = Color(0xffE3F2FD);

  // Secondary (luxury gray accent)
  static const Color secondary = Color(0xff546E7A); // Gunmetal gray
  static const Color onSecondary = Color(0xffFFFFFF); // Text/icons on secondary

  // Backgrounds & Surfaces
  static const Color background = Color(0xffF9FAFB);
  static const Color surface = Color(0xffFFFFFF);
  static const Color surfaceVariant = Color(0xffECEFF4);

  // Text
  static const Color textPrimary = Color(0xff1A1A1A);
  static const Color textSecondary = Color(0xff4A4A4A);
  static const Color textTertiary = Color(0xff757575);

  // Status
  static const Color success = Color(0xff2E7D32);
  static const Color warning = Color(0xffED6C02);
  static const Color error = Color(0xffD32F2F);

  // Neutrals
  static const Color divider = Color(0xffE0E0E0);
  static const Color outline = Color(0xff9E9E9E);
  static const Color shadow = Color(0x33000000);

  // Utility
  static const Color transparent = Colors.transparent;
}
