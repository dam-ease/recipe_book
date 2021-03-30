import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_book/components/rounded_button.dart';
import 'package:recipe_book/favourite/fav_wid.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetails extends StatelessWidget {
  final NetworkImage tag;
  final image;
  final String title, source, shareAs, url;
  final double cal, time, servings;
  final List ingredientLines;
  RecipeDetails(
      {this.image,
      this.servings,
      this.url,
      this.cal,
      this.time,
      this.tag,
      this.ingredientLines,
      this.shareAs,
      this.source,
      this.title});
  final ScrollController _scrollController = ScrollController();

  _launchURL() async {
    String prepUrl = '$url';
    if (await canLaunch(prepUrl)) {
      await launch(prepUrl, forceWebView: true);
    } else {
      throw 'Could not launch $prepUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    int num = ingredientLines.length;
    String calint = cal.toStringAsFixed(2);
    int serv = servings.toInt();
    String text = shareAs.toString();
    String subject = 'Check out this recipe';
    final size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Hero(
              tag: tag,
              child: Container(
                height: height * 0.55,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
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
                      height: height,
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
                              Expanded(
                                child: Text(
                                  '$title',
                                  style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.share),
                                  onPressed: () {
                                    final RenderBox box =
                                        context.findRenderObject();
                                    Share.share(text,
                                        subject: subject,
                                        sharePositionOrigin:
                                            box.localToGlobal(Offset.zero) &
                                                box.size);
                                  }),
                              FavoriteWidget(
                                title: title,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.003125,
                          ),
                          Text(
                            'Source: $source',
                            style:
                                GoogleFonts.roboto(fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: height * 0.0375,
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
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.025),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Calories',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '$calint Cal',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.0278,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[200])),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.025),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Ingredients',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '$num',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.0278,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.grey[200])),
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.025),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Time',
                                          style: GoogleFonts.roboto(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '$time minutes',
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
                            height: height * 0.023,
                          ),
                          Center(
                            child: Text(
                              '$serv Serving(s)',
                              style: GoogleFonts.roboto(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.023,
                          ),
                          Text(
                            "Ingredients",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.00625,
                          ),
                          Expanded(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: Scrollbar(
                                controller: _scrollController,
                                isAlwaysShown: true,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: ingredientLines.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                          ingredientLines[index].toString()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.0375,
                          ),
                          Text(
                            "Preparations",
                            style: GoogleFonts.roboto(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: height * 0.00625),
                          Text(
                              "This recipe is provided by $source. You can view the detailed preparation by clicking the button below."),
                          SizedBox(height: height * 0.023),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                _launchURL();
                              },
                              child: RoundedButton(
                                displayText: "Preparation Instructions",
                                bgColor: Colors.orangeAccent,
                                textColor: Colors.black,
                              ),
                            ),
                          ),
                          Spacer(),
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
