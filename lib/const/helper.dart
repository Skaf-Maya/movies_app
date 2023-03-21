import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static customSnackBar(BuildContext context,String text,Color color){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: color,
    ));
  }

  static saveWatchlist(){
    Movies watchLists = Movies();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("wishlist", watchLists.toJson());
    });
  }

}