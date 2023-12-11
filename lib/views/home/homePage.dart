import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
import 'package:vision_craft_mobile/utils/iconsData.dart';
import 'package:vision_craft_mobile/views/home/createPage.dart';
import 'package:vision_craft_mobile/views/home/explorePage.dart';
import 'package:vision_craft_mobile/views/home/settingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const CreatePage(),
    const ExplorePage(),
    const SettingsPage(),
  ];
  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.purpleColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedLabelStyle: GoogleFonts.lato(),
        selectedLabelStyle: GoogleFonts.lato(),
        unselectedItemColor: AppTheme.mainColor,
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsData.create,
              colorFilter: const ColorFilter.mode(
                AppTheme.mainColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsData.explore,
              colorFilter: const ColorFilter.mode(
                AppTheme.mainColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconsData.cog,
              colorFilter: const ColorFilter.mode(
                AppTheme.mainColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Settings",
          ),
        ],
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
      ),
    );
  }
}
