import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {

  /// navigation bar
  RxInt selected = 0.obs;
  changeIndex(int selectIndex) {
    selected.value = selectIndex;
    selectCategory.value = -1;
  }

  /// home page
  final ScrollController scrollController = ScrollController();
  TextEditingController search = TextEditingController();
  RxInt selectCategory = (-1).obs;

}