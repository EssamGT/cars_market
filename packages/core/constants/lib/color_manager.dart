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
  static const Color disabled = Color(0xffBDBDBD);
  // Text
  static const Color textPrimary = Color(0xff1A1A1A);
  static const Color textSecondary = Color(0xff4A4A4A);
  static const Color textTertiary = Color(0xff757575);

  // Status
  static const Color success = Color(0xffdcfce7);
  static const Color onSuccess = Color(0xff005100);
  static const Color warning = Color(0xffED6C02);
  static const Color error = Color(0xffD32F2F);

  // Neutrals
  static const Color divider = Color(0xffE0E0E0);
  static const Color outline = Color(0xff9E9E9E);
  static const Color shadow = Color(0x1A000000);

  // Utility
  static const Color transparent = Colors.transparent;

  // dark theme adjustments
  static const Color primaryDarkTheme = Color(
    0xff4DA3FF,
  ); // lightened blue for dark bg
  static const Color primaryDarkDarkTheme = Color(
    0xff82BFFF,
  ); // lighter variant
  static const Color primaryLightDarkTheme = Color(
    0xff1E1E1E,
  ); // surface-matched

  // Secondary
  static const Color secondaryDarkTheme = Color(0xff90A4AE); // lighter gunmetal
  static const Color onSecondaryDarkTheme = Color(
    0xff1E1E1E,
  ); // surface-matched

  // Backgrounds & Surfaces — all neutral gray
  static const Color backgroundDark = Color(0xff111111); // base
  static const Color surfaceDark = Color(0xff1E1E1E); // cards / sheets
  static const Color surfaceVariantDark = Color(
    0xff2A2A2A,
  ); // elevated / input bg
  static const Color disabledDark = Color(0xff3A3A3A);

  // Text
  static const Color textPrimaryDark = Color(0xffECEFF4); // near-white
  static const Color textSecondaryDark = Color(0xffB0BEC5);
  static const Color textTertiaryDark = Color(
    0xff90A4AE,
  ); // ✅ was #78909C, boosted for WCAG AA

  // Status
  static const Color successDark = Color(
    0xff2E7D52,
  ); // ✅ was #1B3A2A, lighter to avoid blending
  static const Color onSuccessDark = Color(
    0xffC8F5D8,
  ); // ✅ was #6FCF97, higher contrast
  static const Color warningDark = Color(0xffFFB74D); // softened amber
  static const Color errorDark = Color(0xffEF5350); // softened red

  // Neutrals
  static const Color dividerDark = Color(0xff2E2E2E);
  static const Color outlineDark = Color(0xff4A4A4A);
  static const Color shadowDark = Color(0x1AFFFFFF); //
  // Brand
  // static const Color primaryDarkTheme = Color(
  //   0xff4DA3FF,
  // ); // lightened blue for dark bg
  // static const Color primaryDarkDarkTheme = Color(
  //   0xff82BFFF,
  // ); // lighter variant
  // static const Color primaryLightDarkTheme = Color(
  //   0xff1E1E1E,
  // ); // surface-matched

  // // Secondary
  // static const Color secondaryDarkTheme = Color(0xff90A4AE); // lighter gunmetal
  // static const Color onSecondaryDarkTheme = Color(
  //   0xff1E1E1E,
  // ); // surface-matched

  // // Backgrounds & Surfaces — all neutral gray
  // static const Color backgroundDark = Color(0xff111111); // base
  // static const Color surfaceDark = Color(0xff1E1E1E); // cards / sheets
  // static const Color surfaceVariantDark = Color(
  //   0xff2A2A2A,
  // ); // elevated / input bg
  // static const Color disabledDark = Color(0xff3A3A3A);

  // // Text
  // static const Color textPrimaryDark = Color(0xffECEFF4); // near-white
  // static const Color textSecondaryDark = Color(0xffB0BEC5);
  // static const Color textTertiaryDark = Color(0xff78909C);

  // // Status
  // static const Color successDark = Color(0xff1B3A2A); // deep green tint
  // static const Color onSuccessDark = Color(0xff6FCF97); // readable green
  // static const Color warningDark = Color(0xffFFB74D); // softened amber
  // static const Color errorDark = Color(0xffEF5350); // softened red

  // // Neutrals
  // static const Color dividerDark = Color(0xff2E2E2E);
  // static const Color outlineDark = Color(0xff4A4A4A);
  // static const Color shadowDark = Color(0x29000000); // stronger alpha
}
