import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_book/constants.dart';
import 'package:recipe_book/screens/related_search.dart';
import 'package:recipe_book/screens/recipe_search.dart';

class IngredientSearch extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  String ingredientInput;

  // final _auth = FirebaseAuth.instance;
  // @override
  // void initState() {
  //   super.initState();
  //   //getIngredients('banana');
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
        //  Provider<String>(
        //   create: (context) => ingredientInput,
        Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            FloatingActionButton(
              mini: true,
              onPressed: () {
                Navigator.pushNamed(context, 'fifth');
              },
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Spacer(),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RecipeSearch();
                }));
              },
              shape: StadiumBorder(),
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Text(
                'Tap to search by Recipe',
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black,
                  fontFamily: 'Apercu Pro',
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(left: 20.0, right: 20.0),
        // height: size.height * 0.33,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/recipe.png"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 26.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'Search by Ingredient',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Apercu Pro',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextFormField(
                    controller: myController,
                    decoration: kInputDecoration.copyWith(
                        hintText: 'What ingredient are you looking for?',
                        contentPadding: EdgeInsets.only(left: 15.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (myController.text.isNotEmpty) {
                              print('Here');
                              ingredientInput = myController.text;
                              print(ingredientInput);
                              //GetApi().getIngredients(ingredientInput);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RelatedSearch(
                                  ingredient: ingredientInput,
                                );
                              }));
                            } else {
                              print('do not do it');
                              // return 'Please enter your Recipe';

                            }
                          },
                        ),
                        fillColor: Colors.white,
                        hintStyle: kHintStyle2),
                    // onChanged: (value) => {print(value)},
                  ),
                ),
                SizedBox(
                  height: 49.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  child: Column(
                    children: [
                      CustomListTile(
                          title: 'My search history', onPressed: () => null),
                      customDivider(),
                      CustomListTile(
                          title: 'My favorite recipes', onPressed: () => null),
                      customDivider(),
                      CustomListTile(
                        title: 'Easy Mexican Casserole',
                        onPressed: () => null,
                      ),
                      customDivider(),
                      CustomListTile(
                          title: 'Thai Chicken Balls', onPressed: () => null),
                      customDivider(),
                      CustomListTile(
                          title: 'Honey Mustard Pork Chops',
                          onPressed: () => null),
                      customDivider(),
                      CustomListTile(
                          title: 'Salsa Chicken Rice Casserole',
                          onPressed: () => null),
                      customDivider(),
                      CustomListTile(
                          title: 'Banana Cinnamon Roll Casserole',
                          onPressed: () => null),
                      // customDivider(),
                      SizedBox(
                        height: 36,
                      ),
                      GestureDetector(
                        child: Text(
                          'Explore more recipes',
                          style: kHintStyle2.copyWith(color: Colors.green),
                        ),
                      ),
                      Divider(
                        indent: 109.0,
                        endIndent: 106.0,
                        color: Colors.green,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Divider customDivider() {
  return Divider(
    color: Colors.grey[300],
    indent: 18.0,
    endIndent: 20.0,
  );
}

class CustomListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  CustomListTile({this.title, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: new Text(title, style: kHintStyle2),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward, size: 20, color: Colors.grey),
            onPressed: onPressed));
  }
}
