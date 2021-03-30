import 'package:flutter/material.dart';
import 'package:recipe_book/screens/related_search.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<String> modURLs = [
    "images/breakfast.jpg",
    "images/lunch.jpg",
    "images/dinner.jpg",
    "images/desserts.jpg"
  ];
  List<String> modNames = ["Breakfast", "Lunch", "Dinner", "desserts"];
  List<String> hmURLs = [
    "images/vegan.jpg",
    "images/vegetarian.jpg",
    "images/lowsugar.jpg",
    "images/nutfree.jpg"
  ];
  List<String> hmNames = ["Vegan", "Vegetarian", "Low-Sugar", "Nut Free"];

  List<String> dmURLs = [
    "images/balanced.jpg",
    "images/highprotein.jpg",
    "images/lowcarb.jpg",
    "images/lowfat.jpg"
  ];
  List<String> dmNames = ["Balanced", "High-Protein", "Low-Carb", "Low-Fat"];
  List<String> atwURLs = [
    "images/American.jpg",
    "images/asian.jpg",
    "images/french.jpg",
    "images/hungarian.jpg",
    "images/indian.jpg",
    "images/italian.jpg",
    "images/mexican.png",
    "images/persian.jpg"
  ];
  List<String> atwNames = [
    "American",
    "Asian",
    "French",
    "Hungarian",
    "Indian",
    "Italian",
    "Mexican",
    "Persian"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            "Explore",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          bottom: TabBar(
              indicatorColor: Colors.white,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  text: "Meals of the Day",
                ),
                Tab(
                  text: "Healthy Meals",
                ),
                Tab(
                  text: "Diet Meals",
                ),
                Tab(
                  text: "Around the World",
                ),
              ]),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: modURLs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: modNames[index],
                              );
                            }));
                          },
                          child: TypeCont(
                            imageURL: modURLs[index],
                            text: modNames[index],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: hmURLs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: hmNames[index],
                              );
                            }));
                          },
                          child: TypeCont(
                            imageURL: hmURLs[index],
                            text: hmNames[index],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: dmURLs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: dmNames[index],
                              );
                            }));
                          },
                          child: TypeCont(
                            imageURL: dmURLs[index],
                            text: dmNames[index],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: atwURLs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RelatedSearch(
                                ingredient: atwNames[index],
                              );
                            }));
                          },
                          child: TypeCont(
                            imageURL: atwURLs[index],
                            text: atwNames[index],
                          ),
                        );
                      }),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class TypeCont extends StatelessWidget {
  final String imageURL, text;
  final Function onPress;
  TypeCont({this.imageURL, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Container(
      margin: EdgeInsets.only(
          top: height * 0.03125,
          left: width * 0.0833,
          right: width * 0.0833,
          bottom: height * 0.0156),
      color: Colors.white,
      child: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [Image.asset(imageURL)],
          ),
          Container(
            height: height * 0.078,
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
