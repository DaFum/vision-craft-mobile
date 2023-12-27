import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/utils/iconsData.dart';

import '../../theme/appTheme.dart';

class SettingsViewPage extends StatefulWidget {
  const SettingsViewPage({super.key});

  @override
  State<SettingsViewPage> createState() => _SettingsViewPageState();
}

class _SettingsViewPageState extends State<SettingsViewPage> {
  SvgPicture svgImage(String icon) {
    return SvgPicture.asset(
      icon,
      height: 22,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.purpleColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: svgImage(IconsData.back),
        ),
        title: Text(
          "Developers",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppTheme.mainColor,
              AppTheme.purpleColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Metimol - Python Backend Developer, AI Creator
              developerCard(
                "Metimol - Python Backend Developer, AI Creator",
                "Metimol is a proficient Python Backend Developer and an innovative AI creator. With a deep understanding of backend technologies and a mastery of Python, Metimol ensures the robust functionality and performance of your server-side applications. Additionally, Metimol's expertise extends to artificial intelligence, contributing valuable insights and solutions to integrate intelligent features into your projects.",
              ),
              // Nurmuhammad Nizomov - Backend Developer
              developerCard(
                "Nurmuhammad Nizomov - Backend Developer",
                "Nurmuhammad Nizomov is a dedicated Backend Developer known for his expertise in crafting scalable and efficient server-side solutions. Proficient in a variety of backend technologies, Nizomov brings a systematic and detail-oriented approach to building the backbone of your applications. His commitment to optimizing performance and maintaining data integrity makes him a valuable asset to the backend development team.",
              ),
              // Karl Kiyotaka - Flutter Cross Platform Developer
              developerCard(
                "Karl Kiyotaka - Flutter Cross Platform Developer",
                "Karl Kiyotaka is a versatile Flutter Cross Platform Developer who has played a pivotal role in developing the official mobile app and Flutter package for your projects. With a focus on cross-platform compatibility, Karl ensures that your applications deliver a consistent and high-quality user experience across different devices and operating systems. His expertise in Flutter technology makes him an invaluable contributor to your mobile development initiatives.",
              ),
              // Hussain Panahy - Frontend Developer
              developerCard(
                "Hussain Panahy - Frontend Developer",
                "Hussain Panahy is a skilled Frontend Developer with a keen eye for user interface design and a passion for creating seamless and visually appealing web experiences. With a strong command of HTML, CSS, and JavaScript, Hussain brings creativity and technical expertise to the front end of your projects. He excels at turning design concepts into responsive and intuitive user interfaces that enhance the overall user experience.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget developerCard(String name, String description) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: AppTheme.cardColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppTheme.purpleColor),
    ),
    child: Column(
      children: [
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(width: 8),
            Text(
              "$name:",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}
