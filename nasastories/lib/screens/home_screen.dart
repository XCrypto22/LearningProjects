import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasastories/models/image_data.dart';
import 'package:nasastories/models/mission_data.dart';
import 'package:nasastories/models/story_data.dart';
import 'package:nasastories/services/remote_service.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetch data from API
    getStoryData();
    getImageData();
    getMissionData();
  }

  void getStoryData() async {
    stories = await StoriesRemoteService().getStories();
    if (stories != null) {
      setState(() {
        isStoryLoaded = true;
      });
    }
  }

  void getImageData() async {
    images = await GalleryRemoteService().getPhotos();
    if (images != null) {
      setState(() {
        isImageLoaded = true;
      });
    }
  }

  void getMissionData() async {
    missions = await MissionsRemoteService().getMissions();
    if (missions != null) {
      setState(() {
        isMissionLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset("assets/animations/space-a.json")),
    );
  }
}
