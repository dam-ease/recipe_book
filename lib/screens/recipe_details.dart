import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetails extends StatefulWidget {
  final String image;

  const RecipeDetails({this.image});
  @override
  _PracticeDetailsState createState() => _PracticeDetailsState();
}

class _PracticeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Hero(
              tag: 'red',
              child: Container(
                height: size.height * 0.55,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                // margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            DraggableScrollableSheet(
                maxChildSize: 1,
                initialChildSize: 0.6,
                minChildSize: 0.6,
                builder: (context, controller) {
                  return SingleChildScrollView(
                    controller: controller,
                    child: Container(
                      height: size.height,
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tomatoes',
                                style: GoogleFonts.roboto(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              IconButton(
                                  icon: Icon(Icons.share), onPressed: () {}),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Source: Food52',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[200])),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Calories',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '180KCal',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[200])),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Ingredients',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '06',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[200])),
                                    padding: EdgeInsets.symmetric(vertical: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Time',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '3 hours',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            "Recipe",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          //We are going to be using a listView Builder here but for the mean time
                          Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
