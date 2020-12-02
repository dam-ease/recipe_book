import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.displayText, this.bgColor, this.textColor});
  final String displayText;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      color: bgColor,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          displayText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Apercu Pro',
            color: textColor,
          ),
        ),
      ),
    ));
  }
}
