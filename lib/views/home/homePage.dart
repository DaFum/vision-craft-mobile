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

  String titles() {
    if (selectedIndex == 0) {
      return "Vision Craft";
    } else if (selectedIndex == 1) {
      return "Discover";
    } else {
      return "Settings";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.purpleColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          titles(),
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppTheme.navigationBarColor,
        selectedIndex: selectedIndex,
        onDestinationSelected: changePage,
        indicatorColor: AppTheme.indicatorColor,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              IconsData.create,
              height: 22,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? AppTheme.purpleColor : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Create",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              IconsData.explore,
              height: 22,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? AppTheme.purpleColor : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Discover",
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              IconsData.cog,
              height: 22,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? AppTheme.purpleColor : Colors.white60,
                BlendMode.srcIn,
              ),
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
