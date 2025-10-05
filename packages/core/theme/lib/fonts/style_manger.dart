import 'package:flutter/material.dart';
import 'package:theme/fonts/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color, [
  String fontFamily = FontConstants.inter,
]) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);
}

// medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,

  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, fontFamily);
}

// medium style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,

  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, fontFamily);
}

// bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,

  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, fontFamily);
}

TextStyle getExtraBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.extraBold,
    color,
    fontFamily,
  );
}

// semibold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  String fontFamily = FontConstants.inter,

  required Color color,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, fontFamily);
}
