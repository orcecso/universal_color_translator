import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_color_translator/ui/components/background_container.dart';
import 'package:universal_color_translator/ui/components/color_categories_section.dart';
import 'package:universal_color_translator/ui/components/color_search_card.dart';
import 'package:universal_color_translator/ui/components/custom_appbar.dart';
import 'package:universal_color_translator/ui/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: BackgroundContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ColorSearchCard(),
                SizedBox(height: 24),
                ColorCategoriesSection(),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
