import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_vision_craft/flutter_vision_craft.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vision_craft_mobile/utils/iconsData.dart';
import 'package:vision_craft_mobile/widgets/loader.dart';

import '../../theme/appTheme.dart';
import 'resultPage.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<String> visionCraftModels = [
    "3guofeng3_v3.4",
    "absolutereality_v1.6",
    "absolutereality_v1.8.1",
    "amIReal_v4.1",
    "analog_diffusion_v1",
    "anything_v3.0",
    "anything_v4.5",
    "anything_V5",
    "abyss_orangemix_v3",
    "blazing_drive_v10g",
    "cetusmix_v35",
    "childrensStories_v1_3D",
    "childrensStories_v1_SemiReal",
    "childrensStories_v1_ToonAnime",
    "Counterfeit_v3.0",
    "cuteyukimix_midchapter3",
    "cyberrealistic_v3.3",
    "dalcefo_v4",
    "deliberate_v2",
    "deliberate_v3",
    "dreamlike_anime_v1.0",
    "dreamlike_diffusion_v1.0",
    "dreamlike_photoreal_v2.0",
    "dreamshaper_v6",
    "dreamshaper_v7",
    "dreamshaper_v8",
    "edgeOfRealism_eor_v2.0",
    "EimisAnimeDiffusion_v1",
    "elldreths-vivid",
    "epicrealism_natural_Sin_RC1",
    "ICantBelieveItsNotPhotography_seco",
    "juggernaut_aftermath",
    "lofi_v4",
    "lyriel_v1.6",
    "majicmixRealistic_v4",
    "mechamix_v1.0",
    "meinamix_v9",
    "meinamix_v11",
    "neverendingDream_v1.22",
    "openjourney_v4",
    "pastelMixStylizedAnime_pruned",
    "portraitplus_v1.0",
    "protogen_x3.4",
    "Realistic_Vision_v1.4",
    "Realistic_Vision_v2.0",
    "Realistic_Vision_v4.0",
    "Realistic_Vision_v5.0",
    "redshift_diffusion_v1.0",
    "revAnimated_v1.2.2",
    "rundiffusionFX_v2.5D_v1.0",
    "rundiffusionFX_photorealistic_v1.0",
    "StableDiffusion_v1.4",
    "Stable_Diffusion_v1.5",
    "Stable_Diffusion_v1.5_inpainting",
    "shoninsBeautiful_v1.0",
    "theallys_mix_v2",
    "timeless_v1.0",
    "toonyou_beta6",
  ];
  final VisionCraft visionCraft = VisionCraft();
  Uint8List? imageResult;

  String? selectedModel;
  TextEditingController promptController = TextEditingController();
  FocusNode myfocus = FocusNode();
  String apiKey = dotenv.get('APIKEY');
  CustomLoader customLoader = CustomLoader();

  Future createImage() async {
    String prompt = promptController.text.trim().toString();
    if (promptController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Enter prompt to continue!",
        backgroundColor: AppTheme.mainColor,
        colorText: Colors.white,
      );
    } else if (selectedModel == null) {
      Get.snackbar(
        "Error",
        "Select model to continue!",
        backgroundColor: AppTheme.mainColor,
        colorText: Colors.white,
      );
    } else {
      customLoader.showLoader(context);
      final result = await visionCraft.generateImage(
        apiKey: apiKey,
        prompt: prompt,
        enableBadWords: false,
        model: selectedModel,
      );
      imageResult = result;
      customLoader.hideLoader();
      Get.to(
          () => ResultPage(
                imageResult: imageResult!,
              ),
          transition: Transition.cupertino);
    }
  }

  @override
  void dispose() {
    promptController.dispose();
    myfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => myfocus.unfocus(),
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  constraints: const BoxConstraints(
                    maxHeight: 180,
                    minHeight: 100,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.greenColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text field
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 5,
                          ),
                          child: TextField(
                            maxLines: null,
                            expands: true,
                            maxLength: 500,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                            ),
                            focusNode: myfocus,
                            controller: promptController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your prompt here",
                              hintStyle:
                                  GoogleFonts.lato(color: Colors.white60),
                            ),
                            onEditingComplete: () {
                              myfocus.unfocus();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const SizedBox(width: 8.0),
                    Text(
                      "Choose Model",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(193, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        IconsData.model,
                        colorFilter: const ColorFilter.mode(
                          AppTheme.pinkColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: DropdownButton(
                          value: selectedModel,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: AppTheme.pinkColor,
                          ),
                          hint: Text(
                            "Select Model",
                            style: GoogleFonts.lato(),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          underline: const SizedBox(),
                          isExpanded: true,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "SF",
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          items: visionCraftModels.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(
                                  fontFamily: "SF",
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedModel = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    createImage();
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
                        "Generate Image",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
