import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final String? prefix;
  final bool isValidator;
  final String? validatorMessage;

  CustomTextField({
    this.controller,
    this.hintText,
    this.textInputType,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.borderRadius,
    this.isValidator=false,
    this.validatorMessage,
    this.prefix
  });

  @override
  Widget build(context) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        cursorColor: AppColors.borderColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: defaultTitleRegular.copyWith(color: AppColors.greyColor),
        controller: controller,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        validator: (input){
          if(input!.isEmpty){
            if(isValidator){
              return validatorMessage??"";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: prefix == null ? null :
           Container(
               padding: const EdgeInsets.all(Dimensions.fontSizeDefault),
               child: SvgPicture.asset(prefix!,color: Colors.white)),
          hintText: hintText ?? '',
          contentPadding: const EdgeInsets.symmetric(vertical: Dimensions.paddingDefault, horizontal: Dimensions.paddingDefault),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius?? 0),
              borderSide: const BorderSide(color: AppColors.borderColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius?? 0),
              borderSide: const BorderSide(color: AppColors.borderColor)
          ),
          hintStyle: defaultTitleRegular.copyWith(color: AppColors.greyColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
