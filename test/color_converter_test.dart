import 'package:flutter_test/flutter_test.dart';
import 'package:universal_color_translator/data/color_data.dart';
import 'package:universal_color_translator/utils/color_converter.dart';

void main() {
  group('ColorConverter Tests', () {
    group('Basic Color Conversions', () {
      test('should convert basic colors correctly', () {
        expect(ColorConverter.convertColorNameToHex('red'), '#FF0000');
        expect(ColorConverter.convertColorNameToHex('green'), '#008000');
        expect(ColorConverter.convertColorNameToHex('blue'), '#0000FF');
        expect(ColorConverter.convertColorNameToHex('yellow'), '#FFFF00');
        expect(ColorConverter.convertColorNameToHex('purple'), '#800080');
        expect(ColorConverter.convertColorNameToHex('orange'), '#FFA500');
      });

      test('should handle black and white', () {
        expect(ColorConverter.convertColorNameToHex('black'), '#000000');
        expect(ColorConverter.convertColorNameToHex('white'), '#FFFFFF');
      });
    });

    group('Extended Colors Conversions', () {
      test('should convert extended colors correctly', () {
        expect(ColorConverter.convertColorNameToHex('navy'), '#000080');
        expect(ColorConverter.convertColorNameToHex('aqua'), '#00FFFF');
        expect(ColorConverter.convertColorNameToHex('teal'), '#008080');
        expect(ColorConverter.convertColorNameToHex('maroon'), '#800000');
        expect(ColorConverter.convertColorNameToHex('olive'), '#808000');
        expect(ColorConverter.convertColorNameToHex('gray'), '#808080');
        expect(ColorConverter.convertColorNameToHex('silver'), '#C0C0C0');
        expect(ColorConverter.convertColorNameToHex('lime'), '#00FF00');
      });
    });

    group('Additional Shades Conversions', () {
      test('should convert additional shades correctly', () {
        expect(ColorConverter.convertColorNameToHex('pink'), '#FFC0CB');
        expect(ColorConverter.convertColorNameToHex('brown'), '#A52A2A');
        expect(ColorConverter.convertColorNameToHex('beige'), '#F5F5DC');
        expect(ColorConverter.convertColorNameToHex('cyan'), '#00FFFF');
        expect(ColorConverter.convertColorNameToHex('magenta'), '#FF00FF');
        expect(ColorConverter.convertColorNameToHex('gold'), '#FFD700');
        expect(ColorConverter.convertColorNameToHex('indigo'), '#4B0082');
        expect(ColorConverter.convertColorNameToHex('violet'), '#EE82EE');
        expect(ColorConverter.convertColorNameToHex('coral'), '#FF7F50');
        expect(ColorConverter.convertColorNameToHex('crimson'), '#DC143C');
        expect(ColorConverter.convertColorNameToHex('azure'), '#F0FFFF');
        expect(ColorConverter.convertColorNameToHex('ivory'), '#FFFFF0');
        expect(ColorConverter.convertColorNameToHex('lavender'), '#E6E6FA');
        expect(ColorConverter.convertColorNameToHex('salmon'), '#FA8072');
        expect(ColorConverter.convertColorNameToHex('turquoise'), '#40E0D0');
      });
    });

    group('Case Sensitivity Tests', () {
      test('should handle different case formats', () {
        // Testing uppercase
        expect(ColorConverter.convertColorNameToHex('RED'), '#FF0000');
        expect(ColorConverter.convertColorNameToHex('BLUE'), '#0000FF');

        // Testing mixed case
        expect(ColorConverter.convertColorNameToHex('ReD'), '#FF0000');
        expect(ColorConverter.convertColorNameToHex('bLuE'), '#0000FF');

        // Testing lowercase
        expect(ColorConverter.convertColorNameToHex('red'), '#FF0000');
        expect(ColorConverter.convertColorNameToHex('blue'), '#0000FF');
      });
    });

    group('Input Validation Tests', () {
      test('should throw ArgumentError for invalid color names', () {
        expect(
          () => ColorConverter.convertColorNameToHex('invalidColor'),
          throwsArgumentError,
        );
        expect(
          () => ColorConverter.convertColorNameToHex(''),
          throwsArgumentError,
        );
        expect(
          () => ColorConverter.convertColorNameToHex(' '),
          throwsArgumentError,
        );
      });

      test('should handle whitespace correctly', () {
        expect(ColorConverter.convertColorNameToHex(' red '), '#FF0000');
        expect(ColorConverter.convertColorNameToHex('blue  '), '#0000FF');
        expect(ColorConverter.convertColorNameToHex('  green'), '#008000');
      });
    });

    group('Color Validation Tests', () {
      test('should correctly validate color names', () {
        // Valid colors
        expect(ColorConverter.isValidColorName('red'), true);
        expect(ColorConverter.isValidColorName('blue'), true);
        expect(ColorConverter.isValidColorName('GREEN'), true);

        // Invalid colors
        expect(ColorConverter.isValidColorName('invalidColor'), false);
        expect(ColorConverter.isValidColorName(''), false);
        expect(ColorConverter.isValidColorName(' '), false);
      });
    });

    group('Complete Color Database Tests', () {
      test('should have all colors defined in ColorData', () {
        for (var colorEntry in ColorData.colorMap.entries) {
          expect(
            ColorConverter.convertColorNameToHex(colorEntry.key),
            colorEntry.value,
            reason: 'Color ${colorEntry.key} should match its hex value',
          );
        }
      });

      test('should have correct hex format for all colors', () {
        final hexPattern = RegExp(r'^#[0-9A-F]{6}$');

        for (var colorEntry in ColorData.colorMap.entries) {
          expect(
            hexPattern.hasMatch(colorEntry.value),
            true,
            reason: 'Color ${colorEntry.key} should have valid hex format',
          );
        }
      });
    });

    group('Performance Tests', () {
      test('should handle multiple conversions efficiently', () {
        final stopwatch = Stopwatch()..start();

        for (var i = 0; i < 1000; i++) {
          ColorConverter.convertColorNameToHex('red');
          ColorConverter.convertColorNameToHex('blue');
          ColorConverter.convertColorNameToHex('green');
        }

        stopwatch.stop();

        // Ensure 3000 conversions take less than 100ms
        expect(stopwatch.elapsedMilliseconds < 100, true);
      });
    });
  });
}
