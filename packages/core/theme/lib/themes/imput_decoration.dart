import 'package:constants/color_manager.dart';
import 'package:constants/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:theme/fonts/font_manager.dart';
import 'package:theme/fonts/style_manger.dart';

// InputDecorationThemeData lightInputDecoration() {
//   return InputDecorationThemeData(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(color: ColorManager.transparent),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(color: ColorManager.black.withAlpha(50),
//       width: 2,
//       ),
//     ),
//     disabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(color: ColorManager.transparent),
//     ),
//     fillColor: ColorManager.lightGray,
//     filled: true,
//     activeIndicatorBorder: BorderSide(color: ColorManager.lightGray),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(
//         color: ColorManager.primary.withAlpha(100),
//         // width: 2,
//       ),
//     ),
//     hintStyle: getRegularStyle(
//       color: ColorManager.text,
//       fontFamily: FontConstants.lato,
//       fontSize: FontSize.s16,
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(color: ColorManager.error),
//     ),
//     errorStyle: getMediumStyle(
//       color: ColorManager.error,
//       fontSize: FontSize.s12,
//       fontFamily: FontConstants.lato,
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(AppSize.s10),
//       borderSide: BorderSide(color: ColorManager.error),
//     ),
//   );
// }


InputDecorationThemeData lightInputDecoration() {
  return InputDecorationThemeData(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.textPrimary.withAlpha(50),
      width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.transparent),
    ),
    fillColor: ColorManager.surfaceVariant,
    filled: true,
    activeIndicatorBorder: BorderSide(color: ColorManager.surfaceVariant),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(
        color: ColorManager.primary.withAlpha(100),
        // width: 2,
      ),
    ),
    hintStyle: getRegularStyle(
      color: ColorManager.textPrimary,
      fontFamily: FontConstants.lato,
      fontSize: FontSize.s16,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.error),
    ),
    errorStyle: getMediumStyle(
      color: ColorManager.error,
      fontSize: FontSize.s12,
      fontFamily: FontConstants.lato,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s10),
      borderSide: BorderSide(color: ColorManager.error),
    ),
  );
}
