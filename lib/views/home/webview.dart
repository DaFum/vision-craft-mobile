import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision_craft_mobile/theme/appTheme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebsiteView extends StatelessWidget {
  final String urlString;
  final String title;

  WebsiteView({super.key, required this.urlString, required this.title});

  RxBool isDone = false.obs;

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
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "SF",
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          ),
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
