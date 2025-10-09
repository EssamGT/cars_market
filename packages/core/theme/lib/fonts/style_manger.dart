import 'package:flutter/material.dart';
import 'package:theme/fonts/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String fontFamily,
  double spacing,
  double height,
) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    wordSpacing: spacing,
    height: height,
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    fontFamily,
    spacing,
    height,
  );
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.medium,
    color,
    fontFamily,
    spacing,
    height,
  );
}

// medium style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    fontFamily,
    spacing,
    height,
  );
}

// bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    fontFamily,
    spacing,
    height,
  );
}

TextStyle getExtraBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.extraBold,
    color,
    fontFamily,
    spacing,
    height,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  double spacing = 0,
  double height = 0,

  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.semiBold,
    color,
    fontFamily,
    spacing,
    height,
  );
}
