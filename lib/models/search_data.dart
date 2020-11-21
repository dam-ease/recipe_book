import 'package:flutter/foundation.dart';
import 'package:recipe_book/models/ingredient_model.dart';

class SearchData extends ChangeNotifier {
  List<Recipe> recipes = [];

  int get recipeCount {
    return recipes.length;
  }

  void deleteRecipe(Recipe recipe) {
    recipes.remove(recipe);
    notifyListeners();
  }

  void addRecipe(var newRecipe) {}
}
