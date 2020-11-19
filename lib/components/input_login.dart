import 'package:flutter/material.dart';
import 'package:recipe_book/constants.dart';

class Input extends StatelessWidget {
  final String hint;
  Input({this.hint});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: kHintStyle,
        contentPadding: EdgeInsets.all(10.0),
        border: InputBorder.none,
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide:
              BorderSide(color: Color.fromRGBO(255, 255, 255, 0.5), width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.green, width: 1),
        ),
      ),
    );
  }
}
