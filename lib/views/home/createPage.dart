import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/appTheme.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  List<String> visionCraftModels = [];
  TextEditingController promptController = TextEditingController();
  FocusNode myfocus = FocusNode();
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
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.greenColor,
                      width: 2,
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
