import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision_craft_mobile/views/intro/splashPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/splashPage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(name: "/splashPage", page: () => const SplashPage()),
      ],
    );
  }
}
