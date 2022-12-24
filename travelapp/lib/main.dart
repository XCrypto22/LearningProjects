import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:travelapp/fadeanimation.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _pageController;
  final ValueNotifier<int> _pageNotifier = new ValueNotifier<int>(0);
  int totalPage = 3;
  double dot = 0;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _pageNotifier.value = index;
            });
          },
          children: <Widget>[
            makePage(
                page: 1,
                image: 'assets/images/pic1.jpeg',
                title: 'Mount Inyangani',
                description:
                    'Mount Nyangani (formerly Mount Inyangani) is the highest mountain in Zimbabwe at 2,592 m (8,504 ft)'),
            makePage(
                page: 2,
                image: 'assets/images/pic2.jpeg',
                title: 'Honde Valley',
                description:
                    "The Honde Valley extends from the eastern border of Zimbabwe into Mozambique."),
            makePage(
                page: 3,
                image: 'assets/images/pic3.jpeg',
                title: 'Mutare',
                description:
                    "Mutare (formerly Umtali) is the most populous city in the province of Manicaland, and the third most populous city in Zimbabwe"),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: CirclePageIndicator(
                  currentPageNotifier: _pageNotifier,
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget makePage({image, title, description, page}) {
    if (page == 2) {
      setState(() {
        dot = 2;
      });
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    page.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '/' + totalPage.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Text(
                        '4.0',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        '(2300)',
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          height: 1.9,
                          fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "READ MORE",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
