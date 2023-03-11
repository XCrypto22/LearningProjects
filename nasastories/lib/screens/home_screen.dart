import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:nasastories/models/image_data.dart';
import 'package:nasastories/models/mission_data.dart';
import 'package:nasastories/models/story_data.dart';
import 'package:nasastories/screens/full_story.dart';
import 'package:nasastories/screens/tales_page.dart';
import 'package:nasastories/services/remote_service.dart';
import 'package:nasastories/widgets/gallery_item.dart';
import 'package:nasastories/widgets/story_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Stories>? stories = [];
  List<Gallery>? images = [];
  List<Missions>? missions = [];
  var isStoryLoaded = false;
  var isImageLoaded = false;
  var isMissionLoaded = false;
  int active_tab = 0;
  final List<String> _listItem = [
    'assets/images/atemis.jpg',
    'assets/images/station.jpg',
    'assets/images/atemis.jpg',
    'assets/images/station.jpg',
    'assets/images/atemis.jpg',
    'assets/images/station.jpg',
    'assets/images/atemis.jpg',
    'assets/images/station.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetch all data from API
    getStoryData();
    getImageData();
    getMissionData();
  }

  // fetch stories
  void getStoryData() async {
    stories = await StoriesRemoteService().getStories();
    if (stories != null) {
      setState(() {
        isStoryLoaded = true;
      });
    }
  }

  // fetch images
  void getImageData() async {
    images = await GalleryRemoteService().getPhotos();
    if (images != null) {
      setState(() {
        isImageLoaded = true;
      });
    }
  }

  // fetch missions
  void getMissionData() async {
    missions = await MissionsRemoteService().getMissions();
    if (missions != null) {
      setState(() {
        isMissionLoaded = true;
      });
    }
  }

  Widget gallery_photos() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 370,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: [
          PopularItem(
            image_url: 'assets/images/atemis.jpg',
            sub_title: 'NASA World',
          ),
          PopularItem(
            image_url: 'assets/images/station.jpg',
            sub_title: 'NASA World',
          ),
          PopularItem(
            image_url: 'assets/images/sat.png',
            sub_title: 'NASA World',
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    Widget home() {
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: Text("N A S A"),
            actions: [
              IconButton(
                  onPressed: () {
                    showAboutDialog(
                        context: context,
                        applicationName: "NASA Stories",
                        applicationVersion: "v1.0.0",
                        applicationIcon: Image.asset(
                          'assets/images/logo.png',
                          height: 40,
                        ),
                        applicationLegalese:
                            'Developed by Elton T. Fungirai - eltonfungirai@gmail.com');
                  },
                  icon: const Icon(Icons.info_outline))
            ],
            pinned: true,
            backgroundColor: Colors.black,
            expandedHeight: deviceHeight / 2.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Lottie.asset('assets/animations/space-a.json',
                      fit: BoxFit.cover),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            stops: const [
                          0.4,
                          0.9
                        ],
                            colors: [
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.4),
                        ])),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  )
                ],
              ),
              title: const Text(
                'N A S A  S T O R I E S',
                style:
                    TextStyle(fontFamily: 'Arial', fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mission Events',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => showModal(
                                configuration:
                                    const FadeScaleTransitionConfiguration(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                ),
                                context: context,
                                builder: (ctx) => AlertDialog(
                                    scrollable: true,
                                    title: Text('NASA Mission'),
                                    content: Column(
                                      children: [
                                        Image.asset('assets/images/atemis.jpg'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Artemis I to hit the ground',
                                            style: TextStyle(
                                                fontFamily: 'Robot',
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20),
                                        Text(
                                            'Not so in Paris. I watched someone on the Paris Métro try to get off the train and fail. When the train came to his station, he got up and stood patiently in front of the door, waiting for it to open. It never opened.',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16)),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.blue),
                                          child: const Text(
                                            '21 Feb 2023 - 05:57am UTC',
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        )
                                      ],
                                    ))),
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/atemis.jpg'),
                                      fit: BoxFit.cover),
                                  color: Colors.deepPurple),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomRight,
                                        stops: const [
                                          0.3,
                                          0.9
                                        ],
                                        colors: [
                                          Colors.blue.withOpacity(.6),
                                          Colors.blue.withOpacity(.08),
                                        ])),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: Text(
                                        'Artemis 1 to hit the ground',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 1),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue),
                                      child: const Text(
                                        '21 Feb 2023',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/station.jpg'),
                                    fit: BoxFit.cover),
                                color: Colors.deepPurple),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      stops: const [
                                        0.3,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.blue.withOpacity(.6),
                                        Colors.blue.withOpacity(.2),
                                      ])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Text(
                                      'Space walk to fix Antenna',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue),
                                    child: const Text(
                                      '21 Feb 2023',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/sat.png'),
                                    fit: BoxFit.cover),
                                color: Colors.deepPurple),
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 10),
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      stops: const [
                                        0.3,
                                        0.9
                                      ],
                                      colors: [
                                        Colors.black.withOpacity(.6),
                                        Colors.black.withOpacity(.2),
                                      ])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 20,
                                    ),
                                    child: Text(
                                      'Starlink Mission 146',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '05 Feb 2023',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(CupertinoIcons.arrow_right,
                                      color: Colors.black)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(children: [
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Top Stories',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: 'story',
                    child: SettingItem(
                      image: 'assets/images/station.jpg',
                      title: 'NASA to take down the Space Station',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FullStory(
                            image: 'assets/images/station.jpg',
                            title: 'The Space Station to be repaired next week',
                            tag: 'Astronomic',
                            time: '2hrs',
                            views: '700',
                            author: 'Elton Fungirai',
                            story:
                                'Why do we need to know about the human mind? Because things are designed to be used by people, and without a deep understanding of people, the designs are apt to be faulty, difficult to use, difficult to understand. That is why it is useful to consider the seven stages of action. The mind is more difficult to comprehend than actions.',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SettingItem(
                    image: 'assets/images/sat.png',
                    title:
                        'The new Verizon Satellite brings hope to scientific research about planets',
                  ),
                  const SettingItem(
                    image: 'assets/images/sat2.png',
                    title:
                        'Mars Colonization is as easy as you might not imagine',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            'All stories',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 100, 97, 97)),
                          )),
                    ],
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300)
                ])),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
              child: Column(
                children: [
                  const Text(
                    'Gallery',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  gallery_photos(),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  'Tales of the void',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),
                ),
                const SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: 'tale',
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: deviceHeight / 2.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/sat4.png'),
                            fit: BoxFit.cover),
                        color: Colors.deepPurple),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              stops: const [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.6),
                                Colors.black.withOpacity(.6),
                              ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                              'The Last Signal',
                              style: TextStyle(
                                  fontFamily: 'Astoria',
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'A story about the last civilization in the year 2140',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          MaterialButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyTale(),
                              ),
                            ),
                            minWidth: 300,
                            //color: const Color.fromARGB(255, 0, 140, 255),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text(
                              "Read Story",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: deviceHeight / 2.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/background.jpg'),
                          fit: BoxFit.cover),
                      color: Colors.deepPurple),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            begin: Alignment.center,
                            stops: const [
                              0.3,
                              0.9
                            ],
                            colors: [
                              Colors.black.withOpacity(.6),
                              Colors.black.withOpacity(.6),
                            ])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 10, left: 10),
                          child: Text(
                            'Vision from the Stars',
                            style: TextStyle(
                                fontFamily: 'Astoria',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Antony is a 21 year old boy who claims to have all knowledge of the universe',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 300,
                          //color: const Color.fromARGB(255, 0, 140, 255),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              const Text(
                                "unlocks in 3hrs",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.white,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
                  width: double.infinity,
                  child: Lottie.asset('assets/animations/space-ride.json')),
              Positioned(
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      const Text('Rate this App',
                          style:
                              TextStyle(fontSize: 18, fontFamily: 'Poppins')),
                      Row(mainAxisSize: MainAxisSize.min, children: const [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow)
                      ])
                    ],
                  ),
                ),
              )
            ],
          )),
        ],
      );
    }

    Widget all_stories() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: deviceHeight / 3,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animations/space.json', height: 150),
                  Image.asset('assets/images/nasa.png', width: 100)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'All Stories',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            height: deviceHeight / 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: const [
                  SettingItem(
                    image: 'assets/images/station.jpg',
                    title: 'NASA to take down the Space Station',
                  ),
                  SettingItem(
                    image: 'assets/images/station.jpg',
                    title: 'NASA to take down the Space Station',
                  ),
                  SettingItem(
                    image: 'assets/images/station.jpg',
                    title: 'NASA to take down the Space Station',
                  ),
                  SettingItem(
                    image: 'assets/images/station.jpg',
                    title: 'NASA to take down the Space Station',
                  ),
                  SettingItem(
                    image: 'assets/images/station.jpg',
                    title: 'NASA to take down the Space Station',
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget all_photos() {
      return SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: <Widget>[
            Container(
              height: deviceHeight / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.3),
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'N A S A  G A L L E R Y',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        'Visit NASA Website',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(0),
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: _listItem
                    .map((e) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(e), fit: BoxFit.cover)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ));
    }

    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: GNav(
            backgroundColor: Colors.black,
            tabBackgroundColor: const Color.fromARGB(255, 4, 0, 24),
            activeColor: Colors.white,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                iconColor: Colors.white70,
                iconActiveColor: Colors.blue,
                text: 'Home',
                onPressed: () {
                  setState(() {
                    active_tab = 0;
                  });
                },
              ),
              const GButton(
                icon: Icons.favorite,
                iconColor: Colors.white70,
                iconActiveColor: Colors.red,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.book,
                iconColor: Colors.white70,
                iconActiveColor: Colors.yellow,
                text: 'Stories',
                onPressed: () {
                  setState(() {
                    active_tab = 3;
                  });
                },
              ),
              GButton(
                icon: Icons.photo_library,
                iconColor: Colors.white70,
                iconActiveColor: Colors.pink,
                text: 'Gallery',
                onPressed: () {
                  setState(() {
                    active_tab = 4;
                  });
                },
              ),
            ],
          ),
        ),
        body: active_tab == 0
            ? home()
            : active_tab == 3
                ? all_stories()
                : active_tab == 4
                    ? all_photos()
                    : const Placeholder());
  }
}
