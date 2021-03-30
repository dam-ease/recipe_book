import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipe_book/screens/wrapper.dart';
import 'package:recipe_book/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyRecipeBook());
}

class MyRecipeBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
