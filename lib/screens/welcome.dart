import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/models/user.dart';
import 'package:recipe_book/screens/grid_page.dart';
import 'package:provider/provider.dart' as provider;
import 'package:recipe_book/services/auth.dart';
import 'package:recipe_book/services/database.dart';

class Welcome extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    final user = provider.Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData userData = snapshot.data;
          String name = userData.username;
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/img4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.156,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.044,
                          right: width * 0.044,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome $name',
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.00625,
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
                            TextButton.icon(
                              onPressed: () async {
                                await _auth.signOut();
                              },
                              icon: Image.asset(
                                "images/logout.png",
                                width: 24,
                              ),
                              label: Text('Log Out'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0625,
                      ),
                      GridPage(),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/img4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.156,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.044,
                          right: width * 0.044,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.00625,
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
                            TextButton.icon(
                              onPressed: () async {
                                await _auth.signOut();
                              },
                              icon: Image.asset(
                                "images/logout.png",
                                width: 24,
                              ),
                              label: Text(
                                'Log Out',
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      GridPage(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
