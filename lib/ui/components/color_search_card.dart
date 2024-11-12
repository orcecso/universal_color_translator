import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_color_translator/ui/home/home_controller.dart';

class ColorSearchCard extends GetView<HomeController> {
  const ColorSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchField(),
            const SizedBox(height: 16),
            _buildResultSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Enter color name',
        hintText: 'e.g., red, blue, green',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.color_lens),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
      onChanged: controller.convertColor,
    );
  }

  Widget _buildResultSection() {
    return Obx(() {
      if (controller.error.isNotEmpty) {
        return _buildErrorMessage();
      }

      if (controller.hexCode.isEmpty) {
        return const SizedBox.shrink();
      }

      return _buildColorResult();
    });
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade700),
          const SizedBox(width: 8),
          Text(
            controller.error.value,
            style: TextStyle(
              color: Colors.red.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorResult() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.colorName.value.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                controller.hexCode.value,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          _buildColorPreview(),
        ],
      ),
    );
  }

  Widget _buildColorPreview() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(
          int.parse(
            controller.hexCode.value.replaceFirst('#', '0xFF'),
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
