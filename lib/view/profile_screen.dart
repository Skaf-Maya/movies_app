import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
              child: Text("Profile",
                style: overLargeTitleRegular.copyWith(
                  color: AppColors.lightGreyColor,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
