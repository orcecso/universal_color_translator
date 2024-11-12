import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_color_translator/ui/home/home_controller.dart';
import '../../../data/color_data.dart';

class ColorCategoriesSection extends GetView<HomeController> {
  const ColorCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCategorySection('Popular Colors',
            ['red', 'blue', 'green', 'yellow', 'purple', 'orange']),
        const SizedBox(height: 24),
        _buildCategorySection('Extended Colors', [
          'navy',
          'aqua',
          'teal',
          'maroon',
          'olive',
          'gray',
          'silver',
          'lime'
        ]),
        const SizedBox(height: 24),
        _buildCategorySection('Additional Shades', [
          'pink',
          'brown',
          'beige',
          'cyan',
          'magenta',
          'gold',
          'indigo',
          'violet',
          'coral',
          'crimson',
          'azure',
          'ivory',
          'lavender',
          'salmon',
          'turquoise'
        ]),
      ],
    );
  }

  Widget _buildCategorySection(String title, List<String> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '(${colors.length})',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: _buildColorChips(colors),
          ),
        ),
      ],
    );
  }

  Widget _buildColorChips(List<String> colors) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colors.map((color) => _buildColorChip(color)).toList(),
    );
  }

  Widget _buildColorChip(String color) {
    final hexCode = ColorData.colorMap[color]!;
    final colorValue = Color(
      int.parse(hexCode.replaceFirst('#', '0xFF')),
    );

    // Calculate contrasting text color
    final brightness = ThemeData.estimateBrightnessForColor(colorValue);
    final textColor =
        brightness == Brightness.light ? Colors.black : Colors.white;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => controller.convertColor(color),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colorValue,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: colorValue.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.color_lens_outlined,
                size: 16,
                color: textColor,
              ),
              const SizedBox(width: 4),
              Text(
                color.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
