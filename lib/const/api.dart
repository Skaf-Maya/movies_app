import 'dart:convert';

import 'package:movies_app/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/movie_model.dart';

class Api {

  static Future<List<CategoryElement>?> getCategories() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://darsoft.b-cdn.net/movies_categories.json'));
    request.body = json.encode({
      "customer_id": -1,
      "company_id": "7126dcfd5f2fdf83c0bca1b0b647f424172a78d818ad1508f0b78748378dfb914a9fc8cede2f525bab9f50ea02add1b030552f135c24fba09a4afa27182827c23e2c2b15cb676cf112e7280e4e97f82aa25853b1f05d4e9ba702625957eec1c93901",
      "locale": "en"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data= await response.stream.bytesToString();
      // print(data);
      return Categories.fromMap(jsonDecode(data)).categories;
    }
    else {
      return <CategoryElement>[];
    }
  }

  static Future<List<MovieElement>> getMovies() async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://darsoft.b-cdn.net/movies.json'));
    request.body = json.encode({
      "customer_id": -1,
      "company_id": "7126dcfd5f2fdf83c0bca1b0b647f424172a78d818ad1508f0b78748378dfb914a9fc8cede2f525bab9f50ea02add1b030552f135c24fba09a4afa27182827c23e2c2b15cb676cf112e7280e4e97f82aa25853b1f05d4e9ba702625957eec1c93901",
      "locale": "en"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String data= await response.stream.bytesToString();
      // print(data);
      return Movies.fromMap(jsonDecode(data)).movies!;
    }
    else {
     return <MovieElement>[];
    }

  }

}