import 'package:universal_color_translator/data/color_data.dart';

class ColorConverter {
  static String convertColorNameToHex(String colorName) {
    final String? hexCode = ColorData.colorMap[colorName.toLowerCase()];
    if (hexCode == null) {
      throw ArgumentError('Color "$colorName" not found in the database');
    }
    return hexCode;
  }

  static bool isValidColorName(String colorName) {
    return ColorData.colorMap.containsKey(colorName.toLowerCase());
  }
}