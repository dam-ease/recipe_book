import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';

class RecipeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              onPressed: () {},
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: size.width * 0.3,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'third');
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
                    'Search by Recipe',
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
                    decoration: kInputDecoration.copyWith(
                        hintText: 'What recipe are you looking for?',
                        contentPadding: EdgeInsets.only(left: 15.0),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white,
                        hintStyle: kHintStyle2),
                    onChanged: (value) => {print(value)},
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
