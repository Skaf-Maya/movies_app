import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/splash_screen_controller.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.primaryColor,
            child: Center(
              child: DefaultTextStyle(
                style: overLargeTitleRegular.copyWith(
                    color: AppColors.redColor,
                    fontWeight: FontWeight.w800
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Movies Store'),
                  ],
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
