import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/const/helper.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/view/home_screen.dart';

class LoginScreenController extends GetxController {
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>() ;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passNode = FocusNode();

  login(BuildContext context) {
    if(formKeyLogin.currentState!.validate()) {
      if(email.text.isNotEmpty && email.text.isEmail){
        if(password.text.isNotEmpty && password.text.length >= 8 && password.text.contains(RegExp(r'[!@#$&*~]'))){

          Helper.customSnackBar(context, "Login successfully", Colors.green);
          Get.off(() => HomeScreen());
        }
        else{
          if(password.text.isEmpty) {
            Helper.customSnackBar(context, "Password field is required", AppColors.redColor);
          }else if(password.text.length < 8){
            Helper.customSnackBar(context, "Password must be at least 8 character", AppColors.redColor);
          } else if(!password.text.contains(RegExp(r'[!@#$&*~]'))){
            Helper.customSnackBar(context, "Password must be more harder", AppColors.redColor);
          }
        }
      }else{
        if(email.text.isEmpty) {
          Helper.customSnackBar(context, "Email field is required", AppColors.redColor);
        }else if(!email.text.isEmail){
          Helper.customSnackBar(context, "Please enter valid email ", AppColors.redColor);
        }
      }
    }

  }

}
