import 'package:constants/strings_manager.dart';
import 'package:flutter/material.dart';

enum PaintColors {
  white,
  black,
  silver,
  gray,
  blue,
  darkBlue,
  darkGray,
  red,
  darkRed,
  green,
  darkGreen,
  gold,
  bronze,
  brown,
  mocha,
  olive,
  yellow,
  orange,
  cyan,
  beige,
  champagne,
  petroleum,
  eggplant,
  purple,
  otherCustom,
  none,
}

enum PaintConditions {
  factoryPaint,
  touchUps,
  paritcalPaint,
  fullRepaint,
  none,
}

class PaintColor {
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color silver = const Color(0xFFC0C0C0);
  static Color gray = Colors.grey;
  static Color blue = Colors.blue;
  static Color darkBlue = const Color(0xFF00008B);
  static Color darkGray = Colors.grey[800]!;
  static Color red = Colors.red;
  static Color darkRed = const Color(0xFF8B0000);
  static Color green = Colors.green;
  static Color darkGreen = const Color(0xFF006400);
  static Color gold = const Color(0xFFFFD700);
  static Color bronze = const Color(0xFFCD7F32);
  static Color brown = const Color(0xFFA52A2A);
  static Color mocha = const Color(0xFF967969);
  static Color olive = const Color(0xFF808000);
  static Color yellow = Colors.yellow;
  static Color orange = Colors.orange;
  static Color cyan = Colors.cyan;
  static Color beige = const Color(0xFFF5F5DC);
  static Color champagne = const Color(0xFFFAD5A5);
  static Color petroleum = const Color(0xFF2F4F4F);
  static Color eggplant = const Color(0xFF614051);
  static Color purple = Colors.purple;
  static Color otherCustom = Colors.grey;
}

extension PaintColorsExtension on PaintColors {
  Color getColor() {
    switch (this) {
      case PaintColors.white:
        return PaintColor.white;
      case PaintColors.black:
        return PaintColor.black;
      case PaintColors.silver:
        return PaintColor.silver;
      case PaintColors.gray:
        return PaintColor.gray;
      case PaintColors.blue:
        return PaintColor.blue;
      case PaintColors.darkBlue:
        return PaintColor.darkBlue;
      case PaintColors.darkGray:
        return PaintColor.darkGray;
      case PaintColors.red:
        return PaintColor.red;
      case PaintColors.darkRed:
        return PaintColor.darkRed;
      case PaintColors.green:
        return PaintColor.green;
      case PaintColors.darkGreen:
        return PaintColor.darkGreen;
      case PaintColors.gold:
        return PaintColor.gold;
      case PaintColors.bronze:
        return PaintColor.bronze;
      case PaintColors.brown:
        return PaintColor.brown;
      case PaintColors.mocha:
        return PaintColor.mocha;
      case PaintColors.olive:
        return PaintColor.olive;
      case PaintColors.yellow:
        return PaintColor.yellow;
      case PaintColors.orange:
        return PaintColor.orange;
      case PaintColors.cyan:
        return PaintColor.cyan;
      case PaintColors.beige:
        return PaintColor.beige;
      case PaintColors.champagne:
        return PaintColor.champagne;
      case PaintColors.petroleum:
        return PaintColor.petroleum;
      case PaintColors.eggplant:
        return PaintColor.eggplant;
      case PaintColors.purple:
        return PaintColor.purple;
      case PaintColors.otherCustom:
        return PaintColor.otherCustom;
      case PaintColors.none:
        return Colors.transparent;
    }
  }

  String getColorName() {
    switch (this) {
      case PaintColors.white:
        return StringsManager.white;
      case PaintColors.black:
        return StringsManager.black;
      case PaintColors.silver:
        return StringsManager.silver;
      case PaintColors.gray:
        return StringsManager.gray;
      case PaintColors.blue:
        return StringsManager.blue;
      case PaintColors.darkBlue:
        return StringsManager.darkBlue;
      case PaintColors.darkGray:
        return StringsManager.darkGray;
      case PaintColors.red:
        return StringsManager.red;
      case PaintColors.darkRed:
        return StringsManager.darkRed;
      case PaintColors.green:
        return StringsManager.green;
      case PaintColors.darkGreen:
        return StringsManager.darkGreen;
      case PaintColors.gold:
        return StringsManager.gold;
      case PaintColors.bronze:
        return StringsManager.bronze;
      case PaintColors.brown:
        return StringsManager.brown;
      case PaintColors.mocha:
        return StringsManager.mocha;
      case PaintColors.olive:
        return StringsManager.olive;
      case PaintColors.yellow:
        return StringsManager.yellow;
      case PaintColors.orange:
        return StringsManager.orange;
      case PaintColors.cyan:
        return StringsManager.cyan;
      case PaintColors.beige:
        return StringsManager.beige;
      case PaintColors.champagne:
        return StringsManager.champagne;
      case PaintColors.petroleum:
        return StringsManager.petroleum;
      case PaintColors.eggplant:
        return StringsManager.eggplant;
      case PaintColors.purple:
        return StringsManager.purple;
      case PaintColors.otherCustom:
        return StringsManager.otherCustom;
      case PaintColors.none:
        return StringsManager.selectPaintColor;
    }
  }
}

extension PaintConditionExtension on PaintConditions {
  String getPaintConditionText() {
    switch (this) {
      case PaintConditions.factoryPaint:
        return StringsManager.factoryPaint;
      case PaintConditions.touchUps:
        return StringsManager.touchUps;
      case PaintConditions.paritcalPaint:
        return StringsManager.partialPaint;
      case PaintConditions.fullRepaint:
        return StringsManager.fullRepaint;
      default:
        return '';
    }
  }
}

final List<String> basePaintColors = [
  'White',
  'Black',
  'Silver',
  'Gray',
  'Blue',
  'Red',
  'Green',
  'Brown',
  'Beige',
  'Yellow',
  'Orange',
  'Gold',
  'Bronze',
  'Purple',
  'Other / Custom',
];

final List<String> paintConditions = [
  'Brand New',
  'Excellent',
  'Good',
  'Fair',
  'Needs Repainting',
  'Custom / Wrapped',
  'Repainted (Original Color)',
  'Repainted (Different Color)',
];
