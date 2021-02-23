import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final String title;
  FavoriteWidget({this.title});
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  Favorites favorites = Favorites();

  bool isFavorited = true;

  void toggleFavorite() {
    setState(() {
      if (isFavorited) {
        isFavorited = false;
        favorites.addFavorite(widget.title);
      } else {
        isFavorited = true;
        favorites.removeFavorite(widget.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          // isFavorited ? Icons.favorite_border : Icons.favorite,
          // color: isFavorited ? null : Colors.redAccent,
          Icons.favorite_border,
        ),
        onPressed: toggleFavorite);
  }
}

class Favorites {
  List favorites = [];

  void addFavorite(title) {
    favorites.add(title);
  }

  void removeFavorite(title) {
    favorites.remove(title);
  }

  bool isFavorite(title) {
    return favorites.contains(title);
  }
}
