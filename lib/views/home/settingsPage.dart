import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
import 'package:vision_craft_mobile/views/home/webview.dart';

import '../../utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        child: SettingsList(
          lightTheme: const SettingsThemeData(
            settingsListBackground: Colors.transparent,
          ),
          physics: const BouncingScrollPhysics(),
          applicationType: ApplicationType.material,
          contentPadding: EdgeInsets.zero,
          brightness: Brightness.light,
          platform: DevicePlatform.iOS,
          sections: [
            //support
            SettingsSection(
              title: Text(
                'Support',
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (context) {
                    Get.to(
                      () => WebsiteView(
                        urlString: AppConstants.support,
                        title: "How-Tos",
                      ),
                    );
                  },
                  trailing: SizedBox(),
                  title: const Text(
                    'How-Tos',
                    style: TextStyle(
                      fontFamily: "SF",
                      fontSize: 15,
                    ),
                  ),
                ),
                SettingsTile.navigation(
                  onPressed: (context) {
                    Get.to(
                      () => WebsiteView(
                        urlString: AppConstants.offcialSite,
                        title: "LPG Level Sensor Documentation",
                      ),
                    );
                  },
                  trailing: SizedBox(),
                  title: const Text(
                    'LPG Level Sensor Documentation',
                    style: TextStyle(
                      fontFamily: "SF",
                      fontSize: 15,
                    ),
                  ),
                ),
                SettingsTile.navigation(
                  onPressed: (context) {
                    Get.to(
                      () => WebsiteView(
                        urlString: AppConstants.offcialSite,
                        title: "Privacy Policy",
                      ),
                    );
                  },
                  trailing: SizedBox(),
                  title: const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontFamily: "SF",
                      fontSize: 15,
                    ),
                  ),
                ),
                SettingsTile.navigation(
                  onPressed: (context) {
                    Get.to(
                      () => WebsiteView(
                        urlString: AppConstants.owner,
                        title: "FAQs",
                      ),
                    );
                  },
                  trailing: SizedBox(),
                  title: const Text(
                    'FAQs',
                    style: TextStyle(
                      fontFamily: "SF",
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: Text(
                'More Information',
                style: GoogleFonts.lato(
                  color: Colors.white,
                ),
              ),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  onPressed: (context) {
                    Get.to(
                      () => WebsiteView(
                        urlString: AppConstants.about,
                        title: "More information",
                      ),
                    );
                  },
                  trailing: SizedBox(),
                  title: const Text(
                    'About Us',
                    style: TextStyle(
                      fontFamily: "SF",
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
