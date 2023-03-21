import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintTxt;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final double? borderRadius;

  CustomPasswordTextField({
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.borderRadius
  });

  @override
  _CustomPasswordTextFieldState createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: TextFormField(
        cursorColor: AppColors.borderColor,
        controller: widget.controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: defaultTitleRegular.copyWith(color: AppColors.greyColor),
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          setState(() {
            widget.textInputAction == TextInputAction.done
                ? FocusScope.of(context).consumeKeyboardToken()
                : FocusScope.of(context).requestFocus(widget.nextNode);
          });
        },
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,color: AppColors.borderColor), onPressed: _toggle),
          hintText: widget.hintTxt ?? '',
          contentPadding: const EdgeInsets.symmetric(vertical: Dimensions.paddingDefault, horizontal: Dimensions.paddingDefault),
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius?? 0),
              borderSide: const BorderSide(color: AppColors.borderColor)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius?? 0),
              borderSide: const BorderSide(color: AppColors.borderColor)
          ),
          hintStyle: defaultTitleRegular.copyWith(color: AppColors.greyColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
