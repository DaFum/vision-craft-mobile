import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../theme/appTheme.dart';
import '../../widgets/loader.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.imageResult});
  final Uint8List imageResult;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  CustomLoader customLoader = CustomLoader();
  Future saveImage() async {
    try {
      await ImageGallerySaver.saveImage(widget.imageResult);
      customLoader.hideLoader();
      Get.snackbar(
        "Success",
        "Image downloaded successfully!",
        backgroundColor: AppTheme.greenColor,
        colorText: Colors.white,
      );
    } catch (e) {
      customLoader.hideLoader();
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: AppTheme.mainColor,
        colorText: Colors.white,
      );
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
          "Image Result",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
            Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: MemoryImage(widget.imageResult),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                customLoader.showLoader(context);
                saveImage();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.purpleColor,
                      AppTheme.pinkColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Download Image",
                    style: GoogleFonts.lato(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
