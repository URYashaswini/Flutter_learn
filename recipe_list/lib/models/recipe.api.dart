import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});
    final reponse = await http.get(uri, headers: {
      "X-RapidAPI-Key": "10df754d7dmsh03da9b075360bbcp16fa65jsna95ab286ea53",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": 'true'
    });
    Map data = jsonDecode(reponse.body);
    List _temp = [];
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
