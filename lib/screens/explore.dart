import 'package:flutter/material.dart';
import 'package:recipe_book/components/groups.dart';
import 'package:recipe_book/screens/related_search.dart';

class ExplorePage extends StatelessWidget {
  List<String> imageURLs = [
    "images/breakfast.jpg",
    "images/lunch.jpg",
    "images/dinner.jpg"
  ];
  List<String> names = ["Breakfast", "Lunch", "Dinner"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            "Explore",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Groups(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: imageURLs.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (names[index] == 'Breakfast') {
                            print(names[index]);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: names[index],
                              );
                            }));
                          } else if (names[index] == 'Lunch') {
                            print(names[index]);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: names[index],
                              );
                            }));
                          } else if (names[index] == 'Dinner') {
                            print(names[index]);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: names[index],
                              );
                            }));
                          }
                        },
                        child: TypeCont(
                          imageURL: imageURLs[index],
                          text: names[index],
                        ),
                      );
                    }),
              ),
            )
          ],
        )));
  }
}

class TypeCont extends StatelessWidget {
  final String imageURL, text;
  final Function onPress;
  TypeCont({this.imageURL, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [Image.asset(imageURL)],
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                '$text',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
