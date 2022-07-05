import 'dart:convert';

class Recipe {
  final String? name;
  final String? images;
  final double? ratings;
  final String? totalTime;
  Recipe({this.name, this.images, this.ratings, this.totalTime});
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'],
        images: json['images'][0]['hostedLargeUrl'],
        ratings: json['ratings'],
        totalTime: json['totalTime']);
  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe{name:$name,image:$images,ratings:$ratings,totalTime:$totalTime}';
  }
}
