import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
import 'package:vision_craft_mobile/utils/iconsData.dart';
import 'package:vision_craft_mobile/views/home/settings_view.dart';
import 'package:vision_craft_mobile/views/home/webview.dart';

import '../../utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void openWebview({required String urlString, required String title}) {
    Get.to(
      () => WebsiteView(urlString: urlString, title: title),
      transition: Transition.cupertino,
    );
  }

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
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(90, 35, 35, 65),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  InkWell(
                    onTap: () {
                      openWebview(
                          title: "Support", urlString: AppConstants.support);
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          svgImage(IconsData.support),
                          const SizedBox(width: 10),
                          Text(
                            "Support",
                            style: GoogleFonts.josefinSans(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: Divider(
                      color: Colors.white12,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      openWebview(urlString: AppConstants.help, title: "Help");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          svgImage(IconsData.help),
                          const SizedBox(width: 10),
                          Text(
                            "Get Help",
                            style: GoogleFonts.josefinSans(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: Divider(
                      color: Colors.white12,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      openWebview(
                          urlString: AppConstants.about, title: "About Us");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          svgImage(IconsData.about),
                          const SizedBox(width: 10),
                          Text(
                            "About Us",
                            style: GoogleFonts.josefinSans(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: Divider(
                      color: Colors.white12,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // open url
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          svgImage(IconsData.bug),
                          const SizedBox(width: 10),
                          Text(
                            "Report Bug",
                            style: GoogleFonts.josefinSans(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.only(left: 40, right: 10),
                    child: Divider(
                      color: Colors.white12,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Get.to(() => const SettingsViewPage(),
                          transition: Transition.cupertino);
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          svgImage(IconsData.owners),
                          const SizedBox(width: 10),
                          Text(
                            "Developers",
                            style: GoogleFonts.josefinSans(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 30),
            //version text.
            Text(
              "@VisionCraft 2024",
              style: GoogleFonts.josefinSans(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
