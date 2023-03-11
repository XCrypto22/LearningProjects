import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullStory extends StatefulWidget {
  const FullStory(
      {super.key,
      required this.image,
      required this.author,
      required this.story,
      required this.time,
      required this.title,
      required this.views,
      required this.tag});
  final String image;
  final String author;
  final String title;
  final String story;
  final String time;
  final String views;
  final String tag;

  @override
  State<FullStory> createState() => _FullStoryState();
}

class _FullStoryState extends State<FullStory> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceHeight / 1.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover)),
              child: Container(
                  padding: const EdgeInsets.only(left: 25, top: 20, bottom: 80),
                  //width: double.infinity,
                  //height: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          stops: const [
                        0.2,
                        0.8
                      ],
                          colors: [
                        Colors.blue.withOpacity(.8),
                        Colors.blue.withOpacity(.06),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'story',
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                widget.tag,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 40, top: 10),
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  )),
            ),
            Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                //margin: EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                //height: deviceHeight,
                child: Column(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.pink,
                          radius: 22,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.author,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.time} ago | ${widget.views} views',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.story,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.shade600),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
