import 'package:flutter/material.dart';
import 'package:recipe_book/screens/recipe_details.dart';
import 'package:recipe_book/services/getApi.dart';

class RelatedSearch extends StatefulWidget {
  final String ingredient;

  RelatedSearch({
    this.ingredient,
  });

  @override
  _RelatedSearchState createState() => _RelatedSearchState();
}

class _RelatedSearchState extends State<RelatedSearch> {
  final GetApi _getApi = new GetApi();
  var ingredientModel;

  void initState() {
    ingredientModel = _getApi.getIngredients(widget.ingredient);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.transparent,
        title: Text(
          'Search Result',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder(
        future: ingredientModel,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var ingredient = snapshot.data;
          List list = ingredient['hits'];
          print('$list here');
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                //print("Im here");
                return makeItem(
                    tag: NetworkImage(list[index]['recipe']['image']),
                    context: context,
                    title: list[index]['recipe']['label'].toString(),
                    shareAs: list[index]['recipe']['shareAs'],
                    source: list[index]['recipe']['source'].toString(),
                    ingredientLines: list[index]['recipe']['ingredientLines'],
                    cal: list[index]['recipe']['calories'],
                    time: list[index]['recipe']['totalTime'],
                    url: list[index]['recipe']['url'],
                    servings: list[index]['recipe']['yield'],
                    image: NetworkImage(list[index]['recipe']['image']));
              });
        },
      ),
    );
  }

  Widget makeItem(
      {image,
      url,
      tag,
      context,
      title,
      shareAs,
      source,
      servings,
      ingredientLines,
      cal,
      time}) {
    return Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetails(
                          image: image,
                          tag: tag,
                          title: title,
                          shareAs: shareAs,
                          source: source,
                          ingredientLines: ingredientLines,
                          cal: cal,
                          time: time,
                          servings: servings,
                          url: url,
                        )));
          },
          child: Container(
            height: 250,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            //margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                  '$title',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
        ));
  }
}
