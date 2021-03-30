import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/screens/explore.dart';
import 'package:recipe_book/screens/ingredient_search.dart';
import 'package:recipe_book/screens/recipe_search.dart';

class GridPage extends StatelessWidget {
  Items item1 =
      new Items(title: 'Search by Ingredient', img: 'images/search.jpg');
  Items item2 = new Items(title: 'Search by Recipe', img: 'images/search2.jpg');
  Items item3 = new Items(title: 'Favorites', img: 'images/favorite.png');

  Items item4 = new Items(title: 'Explore', img: 'images/explore.png');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    List<Items> myList = [item1, item2, item3, item4];

    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: width * 0.044, right: width * 0.044),
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList
              .map((data) => GestureDetector(
                    onTap: () {
                      int num = myList.indexOf(data);
                      print(num);
                      if (num == 0) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IngredientSearch();
                        }));
                      } else if (num == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RecipeSearch();
                        }));
                      } else if (num == 2) {
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ExplorePage();
                        }));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            data.img,
                            width: width * 0.11667,
                          ),
                          SizedBox(
                            height: height * 0.0219,
                          ),
                          Text(
                            data.title,
                            style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.img, this.title});
}
