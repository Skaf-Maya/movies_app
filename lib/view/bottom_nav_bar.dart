import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movies_app/controller/home_screen_controller.dart';
import 'package:movies_app/utill/app_colors.dart';

class BottomNavBar extends StatelessWidget {

  HomeScreenController homeScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(0,5)
              )
            ]
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          onTap: (index) {
            homeScreenController.changeIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: homeScreenController.selected.value,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: homeScreenController.selected.value == 0
                  && homeScreenController.selectCategory.value == -1 ?
              SvgPicture.asset("assets/images/icons/home_selected.svg") : SvgPicture.asset("assets/images/icons/home.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: homeScreenController.selected.value == 1
                  && homeScreenController.selectCategory.value == -1?
              SvgPicture.asset("assets/images/icons/watchlist_selected.svg") : SvgPicture.asset("assets/images/icons/watchlist.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: homeScreenController.selected.value == 2
                  && homeScreenController.selectCategory.value == -1?
              SvgPicture.asset("assets/images/icons/profile.svg",color: AppColors.redColor) : SvgPicture.asset("assets/images/icons/profile.svg"),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}