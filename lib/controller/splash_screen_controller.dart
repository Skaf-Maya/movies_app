import 'dart:async';
import 'package:get/get.dart';
import 'package:movies_app/const/api.dart';
import 'package:movies_app/model/category_model.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/view/login_screen.dart';

class SplashScreenController extends GetxController {

  List<CategoryElement> category = <CategoryElement>[];
  List<MovieElement> movie = <MovieElement>[];
  RxBool loading = false.obs;
  String? categoryName;

  @override
  void onInit() {
    super.onInit();
    getCategories().then((value) {
      Timer(const Duration(seconds: 5), () {
              Get.off(() => LoginScreen());
        },
      );
    });
  }

  Future<void> getCategories() async{
    Api.getCategories().then((value) {
      if(value != null) {
        category = value;
        print(category.length);
      }
    });
  }

  Future<void> getMovies(int categoryIndex) async {
    loading.value = false;
    Api.getMovies().then((value) {
      movie = value.where((item) => item.categoryId == category[categoryIndex].id).toList();
      // print(movie.length);
      categoryName = category[categoryIndex].title;
      // print(category[categoryIndex].id);
      loading.value = true;
    });
  }

}