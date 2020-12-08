import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/screens/explore.dart';
import 'package:recipe_book/screens/todo.dart';

class GridPage extends StatelessWidget {
  Items item1 =
      new Items(title: 'Search by Ingredient', img: 'images/search.jpg');
  Items item2 = new Items(title: 'Search by Recipe', img: 'images/search2.jpg');
  Items item3 = new Items(title: 'Favorites', img: 'images/favorite.png');
  Items item4 = new Items(title: 'History', img: 'images/history.png');
  Items item5 = new Items(title: 'Explore', img: 'images/explore.png');
  Items item6 = new Items(title: 'ToDo', img: 'images/todo.jpg');
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];

    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList
              .map((data) => GestureDetector(
                    onTap: () {
                      int num = myList.indexOf(data);
                      print(num);
                      if (num == 0) {
                        Navigator.pushNamed(context, 'third');
                      } else if (num == 1) {
                        Navigator.pushNamed(context, 'fourth');
                      } else if (num == 2) {
                      } else if (num == 3) {
                      } else if (num == 4) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ExplorePage();
                        }));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ToDo();
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
                            width: 42,
                          ),
                          SizedBox(
                            height: 14,
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
