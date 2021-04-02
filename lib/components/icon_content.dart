import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double height = size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: height * 0.0234,
        ),
        Text(
          label,
          style: kWelcome,
        )
      ],
    );
  }
}
