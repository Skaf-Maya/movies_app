import 'dart:convert';

class Categories {
  Categories({
    required this.categories,
  });

  List<CategoryElement>? categories;

  factory Categories.fromJson(String str) => Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    categories: json["categories"] == null ? null : List<CategoryElement>.from(json["categories"].map((x) => CategoryElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class CategoryElement {
  CategoryElement({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory CategoryElement.fromJson(String str) => CategoryElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryElement.fromMap(Map<String, dynamic> json) => CategoryElement(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
  };
}
