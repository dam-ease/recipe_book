import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/search_data.dart';
import 'package:recipe_book/screens/ingredient_search.dart';
import 'package:recipe_book/screens/login.dart';
import 'package:recipe_book/screens/recipe_search.dart';
import 'package:recipe_book/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipe_book/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyRecipeBook());
}

class MyRecipeBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchData(),
      child: MaterialApp(
        initialRoute: 'third',
        routes: {
          'first': (context) => SignUp(),
          'second': (context) => LogIn(),
          'third': (context) => IngredientSearch(),
          'fourth': (context) => RecipeSearch(),
          'fifth': (context) => Welcome(),
        },
      ),
    );
  }
}
