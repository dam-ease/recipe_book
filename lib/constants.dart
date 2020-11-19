import 'package:flutter/material.dart';

const kFirstStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: 'SF Pro Display',
    letterSpacing: 0.186384,
    color: Colors.white);
const kSecondStyle = TextStyle(
    fontSize: 36.0,
    fontFamily: 'Apercu Pro',
    letterSpacing: 0.13950896,
    color: Colors.white);
const kWelcome = TextStyle(
    fontSize: 18.0,
    fontFamily: 'Apercu Pro',
    letterSpacing: 0.13950896,
    color: Colors.black);
const kHintStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Apercu Pro',
  color: Colors.white,
);
const kHintStyle2 = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Apercu Pro',
  color: Colors.grey,
);
const kForgotStyle = TextStyle(
  fontSize: 12.0,
  fontFamily: 'Apercu Pro',
  color: Colors.white,
);
const kLoginStyle = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Apercu Pro',
  color: Color.fromRGBO(52, 168, 83, 0.8),
);
const kInputDecoration = InputDecoration(
  hintStyle: kHintStyle,
  contentPadding: EdgeInsets.all(10.0),
  border: InputBorder.none,
  filled: true,
  fillColor: Color.fromRGBO(255, 255, 255, 0.5),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
