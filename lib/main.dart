import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application Intro',
      home: HomePage(),
    ));

List<String> imagePath = [
  "assets/images/book.png",
  "assets/images/shop.png",
  "assets/images/box.png"
];

List<String> title = [
  "Discounted Secondhand Books",
  "20 Book Grocers Nationally",
  "Sell or Recycle Your Old Books With Us"
];

List<String> description = [
  "Used and near new secondhand books at great prices.",
  "We've successfully opened 20 stores across Australia.",
  "If you're looking to downsize, sell or recycle old books, the Book Grocer can help."
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      autoPlay: false,
      enableInfiniteScroll: false,
      initialPage: 0,
      reverse: false,
      viewportFraction: 1.0,
      aspectRatio: MediaQuery.of(context).size.aspectRatio,
      height: MediaQuery.of(context).size.height,
      items: [0, 1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width, child: AppIntro(i));
          },
        );
      }).toList(),
    );
  }
}

class AppIntro extends StatefulWidget {
  int index;
  AppIntro(this.index);
  @override
  _AppIntroState createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Text(
              title[widget.index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35, color: Color(0xFF5ABD8C)),
            ),
          ),
          Text(
            description[widget.index],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 19, color: Color(0xFFAFDFC7)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Image.asset(imagePath[widget.index],
                    width: MediaQuery.of(context).size.width),
              ],
            ),
          )
        ],
      ),
    );
  }
}
