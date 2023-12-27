import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/iconsData.dart';

class WebsiteView extends StatelessWidget {
  final String urlString;
  final String title;

  WebsiteView({super.key, required this.urlString, required this.title});

  RxBool isDone = false.obs;
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
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isDone.value = true;
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(urlString));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: svgImage(IconsData.back),
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            isDone.value == false
                ? const LinearProgressIndicator(
                    color: AppTheme.mainColor,
                    backgroundColor: Colors.white,
                  )
                : const SizedBox(),
            Expanded(
              child: WebViewWidget(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
