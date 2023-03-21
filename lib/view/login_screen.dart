import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/login_screen_controller.dart';
import 'package:movies_app/utill/app_colors.dart';
import 'package:movies_app/utill/custom_themes.dart';
import 'package:movies_app/utill/dimensions.dart';
import 'package:movies_app/widgets/button/custom_button.dart';
import 'package:movies_app/widgets/textfield/custom_password_textfield.dart';
import 'package:movies_app/widgets/textfield/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginScreenController loginScreenController = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginScreenController.formKeyLogin,
        child: Container(
          color: AppColors.primaryColor,
          child: SafeArea(
            child: Container(
              width: Get.width,
              height: Get.height,
              color: AppColors.primaryColor,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraLarge),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome",
                          style: overLargeTitleRegular.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          ),),
                          Text("Login to continue",
                            style: largeTitleRegular.copyWith(
                                color: AppColors.lightGreyColor,
                                fontWeight: FontWeight.w500
                            ),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        width: 230,
                        height: 230,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/login_image.png"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(Dimensions.paddingLarge),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: loginScreenController.email,
                            hintText: "Enter your email",
                            textInputType: TextInputType.emailAddress,
                            focusNode: loginScreenController.emailNode,
                            nextNode: loginScreenController.passNode,
                            borderRadius: 8,
                          ),
                          const SizedBox(height: 15),
                          CustomPasswordTextField(
                            hintTxt: "Enter your password",
                            textInputAction: TextInputAction.done,
                            focusNode: loginScreenController.passNode,
                            controller: loginScreenController.password,
                            borderRadius: 8,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  // todo forget password
                                },
                                child: Text("Forgot Password?",
                                  style: defaultTitleRegular.copyWith(
                                      color: AppColors.lightGreyColor,
                                      fontWeight: FontWeight.w600
                                  ),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingExtraDefault),
                      child: InkWell(
                        onTap: () {
                          loginScreenController.login(context);
                        },
                        child: CustomButton(
                          height: 56,
                          borderRadius: 8,
                          buttonText: "Login",
                          textStyle: largeTitleRegular.copyWith(
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
