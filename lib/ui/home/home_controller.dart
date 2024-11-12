import 'package:get/get.dart';
import 'package:universal_color_translator/utils/color_converter.dart';

class HomeController extends GetxController {
  final colorName = ''.obs;
  final hexCode = ''.obs;
  final error = ''.obs;

  void convertColor(String input) {
    try {
      colorName.value = input.toLowerCase();
      if (input.isEmpty) {
        error.value = 'Please enter a color name';
        hexCode.value = '';
        return;
      }

      hexCode.value = ColorConverter.convertColorNameToHex(input);
      error.value = '';
    } catch (e) {
      error.value = 'Invalid color name';
      hexCode.value = '';
    }
  }
}
