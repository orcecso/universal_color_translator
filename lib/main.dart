import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_color_translator/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Color Translator",
      initialRoute: homeView,
      getPages: getRootPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
    ),
  );
}
