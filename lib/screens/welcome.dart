import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_book/components/icon_content.dart';
import 'package:recipe_book/components/reusable_card.dart';
import 'package:recipe_book/constants.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Damilola',
                  style: kWelcome,
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.0,
                  child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.signOutAlt,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  )),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPressed: () {},
                        color: Colors.black,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.heart,
                          label: 'Favorites',
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
