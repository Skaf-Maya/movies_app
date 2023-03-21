import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:movies_app/utill/app_colors.dart';


class CustomButton extends StatelessWidget {
  final Callback? onTap;
  final double? height;
  final double? width;
  final double? borderRadius;
  final String? buttonText;
  final TextStyle? textStyle;


  CustomButton({
    this.onTap,
    this.height,
    this.width,
    this.borderRadius,
    required this.buttonText,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: width?? Get.width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.circular(borderRadius!)),
        child: Text(buttonText!, style: textStyle),
      ),
    );
  }
}
