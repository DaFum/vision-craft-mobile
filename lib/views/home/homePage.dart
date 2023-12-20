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
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: selectedIndex,
        onDestinationSelected: changePage,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              IconsData.create,
              height: 22,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? AppTheme.purpleColor : AppTheme.mainColor,
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
                selectedIndex == 1 ? AppTheme.purpleColor : AppTheme.mainColor,
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
                selectedIndex == 2 ? AppTheme.purpleColor : AppTheme.mainColor,
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
