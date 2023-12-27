import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vision_craft_mobile/utils/sample_image_urls.dart';
import 'package:vision_craft_mobile/views/home/view_image.dart';

import '../../theme/appTheme.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> exploreImageUrls = SampleImageUrls.images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
        child: GridView.builder(
          itemCount: exploreImageUrls.length,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(
                  () => ViewImagePage(
                        src: exploreImageUrls[index],
                      ),
                  transition: Transition.downToUp),
              child: Card(
                color: AppTheme.mainColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    exploreImageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
