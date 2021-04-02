import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';
import 'package:recipe_book/screens/explore.dart';
import 'package:recipe_book/screens/related_search.dart';
import 'package:recipe_book/screens/recipe_search.dart';

class IngredientSearch extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  String ingredientInput;

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage("images/img7.jpg"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: height * 0.04),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.0555, right: width * 0.0555),
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
                  height: height * 0.0156,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.0555, right: width * 0.0555),
                  child: TextFormField(
                    controller: myController,
                    decoration: kInputDecoration.copyWith(
                        hintText: 'What ingredient are you looking for?',
                        contentPadding: EdgeInsets.only(left: width * 0.04167),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (myController.text.isNotEmpty) {
                              print(myController.text);
                              ingredientInput = myController.text;
                              print(ingredientInput);
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
                    // onChanged: (value) => {print(value)},
                  ),
                ),
                SizedBox(
                  height: height * 0.0765,
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
                        title: 'Flour',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Flour',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                        title: 'Pasta',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Pasta',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                        title: 'Rice',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RelatedSearch(
                              ingredient: 'Rice',
                            );
                          }));
                        },
                      ),
                      customDivider(),
                      CustomListTile(
                          title: 'Chicken',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Chicken',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Honey',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Honey',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Vegetable',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Vegetable',
                              );
                            }));
                          }),
                      customDivider(),
                      CustomListTile(
                          title: 'Banana',
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: 'Banana',
                              );
                            }));
                          }),
                      // customDivider(),
                      SizedBox(
                        height: height * 0.056,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ExplorePage();
                          }));
                        },
                        child: Text(
                          'Explore recipes',
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
