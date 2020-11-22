import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/screens/grid_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Welcome extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 253, 208, 0.9),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "images/logout.png",
                    width: 24,
                  ),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushNamed(context, 'second');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridPage(),
        ],
      ),
    );
  }
}
