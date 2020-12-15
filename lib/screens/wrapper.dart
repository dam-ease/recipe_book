import 'package:recipe_book/authenticate/authenticate.dart';
import 'package:recipe_book/screens/welcome.dart';
import 'package:recipe_book/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = provider.Provider.of<User>(context);

    // return either Home of Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Welcome();
    }
  }
}
