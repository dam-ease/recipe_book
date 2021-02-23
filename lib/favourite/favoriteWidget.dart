import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {

  final void Function(bool isFavorite) onFavoriteChanged;
  final bool isFavorite;

  FavoriteWidget({Key key, this.isFavorite, this.onFavoriteChanged}) : super(key: key);

  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {

  bool isFavorited = false;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.isFavorite;
  }

  void toggleFavorite() {
    setState((){
      isFavorited = !isFavorited;
      widget.onFavoriteChanged(isFavorited);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(0.0),
      child: IconButton(
          icon: isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.yellow[500],
          onPressed: toggleFavorite),
    );
  }
}