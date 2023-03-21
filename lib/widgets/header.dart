import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';

class Header extends StatelessWidget {
  final IconData? prefixIcon;
  final String? text;
  final String? suffixIcon;
  final Callback? prefixTap;
  final Callback? suffixTap;
  final TextOverflow? textOverflow;

  const Header({
    this.prefixIcon,
    this.text,
    this.suffixIcon,
    this.prefixTap,
    this.suffixTap,
    this.textOverflow
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 60,
      color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingLarge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            prefixIcon == null ? const Center() :
            GestureDetector(
                onTap: prefixTap,
                child: Icon(prefixIcon,color: Colors.white,size: Dimensions.fontSizeExtraMedium)
            ),
            text == null ?  const Center() :
            Center(
              child: Text(text!,
                style: largeTitleRegular.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            suffixIcon == null ? const Center() :
            GestureDetector(
                onTap: suffixTap,
                child: SvgPicture.asset(suffixIcon!,width: Dimensions.fontSizeLarge,height: Dimensions.fontSizeLarge)),
          ],
        ),
      ),
    );
  }
}