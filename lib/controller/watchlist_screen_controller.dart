import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/const/helper.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/utill/app_colors.dart';

class WatchlistScreenController extends GetxController {
  ScrollController scrollController = ScrollController();

  List<MovieElement> watchList = <MovieElement>[];

  addToWatchList(MovieElement movie,BuildContext context){
    for(int i=0; i< watchList.length; i++) {
      if(movie.id == watchList[i].id) {
        Helper.customSnackBar(context, "this movie added before", AppColors.redColor);
        return;
      }
    }
    watchList.add(movie);
    movie.favorite.value = true;
    Helper.customSnackBar(context, "Movie added successfully", Colors.green);
    Helper.saveWatchlist();
    // print(watchList.length);
  }

  bool isFavorite(MovieElement movie) {
    for(int i=0; i< watchList.length; i++) {
      if(movie.id == watchList[i].id) {
        return true;
      }
    }
    return false;
  }
}