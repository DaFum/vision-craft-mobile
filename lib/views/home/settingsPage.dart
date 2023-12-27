import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
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

                  GestureDetector(
                    onTap: () {
                      openWebview(
                          title: "Support", urlString: AppConstants.support);
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.star_outline,
                            color: Colors.white,
                          ),
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
                  //share with firends
                  GestureDetector(
                    onTap: () {
                      openWebview(urlString: AppConstants.help, title: "Help");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
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
                  //feedback
                  GestureDetector(
                    onTap: () {
                      openWebview(
                          urlString: AppConstants.about, title: "About Us");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                          ),
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
                  //Privacy policy
                  GestureDetector(
                    onTap: () {
                      openWebview(
                          urlString: AppConstants.offcialSite,
                          title: "Official Site");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.privacy_tip_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Official Site",
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
                  //Privacy policy
                  GestureDetector(
                    onTap: () {
                      openWebview(
                          urlString: AppConstants.owner, title: "Owners");
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.privacy_tip_rounded,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Owners",
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
              "Version 1.0.0",
              style: GoogleFonts.josefinSans(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
