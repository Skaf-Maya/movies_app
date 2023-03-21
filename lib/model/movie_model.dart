import 'dart:convert';

import 'package:get/get.dart';

class Movies {
  Movies({
    this.movies,
  });

  List<MovieElement>? movies;


  factory Movies.fromJson(String str) => Movies.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movies.fromMap(Map<String, dynamic> json) => Movies(
    movies: json["movies"] == null ? null : List<MovieElement>.from(json["movies"].map((x) => MovieElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "movies": movies == null ? null : List<dynamic>.from(movies!.map((x) => x.toJson())),
  };
}

class MovieElement {
  MovieElement({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.summary,
    required this.actors,
    required this.director,
    required this.writers,
    required this.rating,
    required this.youtubeVideoId,
    required this.year,
  });

  int id;
  int categoryId;
  String title;
  String summary;
  List<Actor> actors;
  String director;
  List<String> writers;
  double rating;
  String youtubeVideoId;
  String year;
  var favorite = false.obs;

  factory MovieElement.fromJson(String str) => MovieElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieElement.fromMap(Map<String, dynamic> json) => MovieElement(
    id: json["id"],
    categoryId: json["category_id"],
    title: json["title"],
    summary: json["summary"],
    actors: List<Actor>.from(json["actors"].map((x) => Actor.fromMap(x))),
    director: json["director"],
    writers: List<String>.from(json["writers"].map((x) => x)),
    rating: json["rating"]?.toDouble(),
    youtubeVideoId: json["youtube_video_id"],
    year: json["year"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category_id": categoryId,
    "title": title,
    "summary": summary,
    "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
    "director": director,
    "writers": List<dynamic>.from(writers.map((x) => x)),
    "rating": rating,
    "youtube_video_id": youtubeVideoId,
    "year": year,
  };
}

class Actor {
  Actor({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Actor.fromJson(String str) => Actor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Actor.fromMap(Map<String, dynamic> json) => Actor(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
