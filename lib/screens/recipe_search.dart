import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';
import 'package:recipe_book/screens/explore.dart';
import 'package:recipe_book/screens/ingredient_search.dart';
import 'package:recipe_book/screens/related_search.dart';

class RecipeSearch extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  String recipeInput;
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
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
                Navigator.pop(context);
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
                  return IngredientSearch();
                }));
              },
              shape: StadiumBorder(),
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Text(
                'Tap to search by ingredients',
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
        // height: size.height * 0.33,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/img14.jpg"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: height * 0.041,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.055, right: width * 0.055),
                  child: Text(
                    'Search by Recipe',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Apercu Pro',
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.0156,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.055, right: width * 0.055),
                  child: TextFormField(
                    controller: myController,
                    decoration: kInputDecoration.copyWith(
                        hintText: 'What recipe are you looking for?',
                        contentPadding: EdgeInsets.only(left: width * 0.0417),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (myController.text.isNotEmpty) {
                              print(myController.text);
                              recipeInput = myController.text;
                              print(recipeInput);
                              //GetApi().getIngredients(ingredientInput);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RelatedSearch(
                                  ingredient: myController.text,
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
                  ),
                ),
                SizedBox(
                  height: height * 0.07656,
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
                        title: 'Easy Mexican Casserole',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Easy Mexican Casserole',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                        title: 'Kimchi Pasta',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Kimchi Pasta',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                        title: 'Perfect Sushi Rice',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Perfect Sushi Rice',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                          title: 'Thai Chicken Balls',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Thai Chicken Balls',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Honey Mustard Pork Chops',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Honey Mustard Pork Chops',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Salsa Chicken Rice Casserole',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Salsa Chicken Rice Casserole',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Banana Cinnamon Roll Casserole',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Banana Cinnamon Roll Casserole',
                              );
                            }));
                          }),
                      // customDivider(),
                      SizedBox(
                        height: height * 0.05625,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ExplorePage();
                          }));
                        },
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

  Divider customDivider() {
    return Divider(
      color: Colors.grey[300],
      indent: 18.0,
      endIndent: 20.0,
    );
  }
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
