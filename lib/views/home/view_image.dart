import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';

import '../../utils/iconsData.dart';

class ViewImagePage extends StatefulWidget {
  const ViewImagePage({super.key, required this.src});
  final String src;

  @override
  State<ViewImagePage> createState() => _ViewImagePageState();
}

class _ViewImagePageState extends State<ViewImagePage> {
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
      backgroundColor: AppTheme.mainColor,
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: svgImage(IconsData.back),
        ),
      ),
      body: Center(
        child: Image.network(widget.src),
      ),
    );
  }
}
