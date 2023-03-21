import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MovieDetailsScreenController extends GetxController {
  ScrollController scrollController = ScrollController();
  ItemScrollController itemScrollController = ItemScrollController();
  var activeIndex = 0.obs;
  setIndex(int selected){
    activeIndex.value=selected;
    setPage(selected);
  }
  setPage(int p){
    itemScrollController.scrollTo(index: p,duration: const Duration(milliseconds: 400));
  }

}