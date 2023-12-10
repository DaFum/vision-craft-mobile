import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';

import '../home/homePage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> runSplash() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(() => HomePage());
  }

  @override
  void initState() {
    super.initState();
    runSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
            colors: [
              AppTheme.mainColor,
              AppTheme.purpleColor,
            ],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Turn Your ',
                    ),
                    TextSpan(
                      text: 'Imaginations',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.purpleAccent,
                      ),
                    ),
                    const TextSpan(
                      text: ' Into Instant ',
                    ),
                    TextSpan(
                      text: 'Images',
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "© VisionCraft 2024",
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
