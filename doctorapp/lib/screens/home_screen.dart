import 'package:doctorapp/models/colors.dart';
import 'package:doctorapp/screens/make_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.topBar,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.topBar,
        leading: Padding(
          padding: const EdgeInsets.only(left: 13),
          child: Icon(
            Icons.menu,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 13),
            child: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 13, 13),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColors.appBody,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.only(left: 18, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi, Olivia',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                        color: AppColors.fontColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColors.fontColor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 18),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                              color: Colors.grey.shade300)
                        ],
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            style:
                                TextStyle(fontFamily: 'Roboto', fontSize: 20),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                label: Text(
                                  'Search...',
                                  style: TextStyle(
                                      color: Color(0xFFABABAB),
                                      fontFamily: 'Roboto',
                                      fontSize: 20),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: 55,
                          decoration: BoxDecoration(
                              color: AppColors.appCards,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'See all',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color(0xFF5E5D5D)),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        cards(
                            type: 'assets/images/dental.png',
                            name: 'Dental',
                            doctors: '26 Doctors'),
                        cards(
                            type: 'assets/images/heart.png',
                            name: 'Heart',
                            doctors: '18 Doctors'),
                        cards(
                            type: 'assets/images/brain.png',
                            name: 'Brain',
                            doctors: '32 Doctors'),
                        cards(
                            type: 'assets/images/bone.png',
                            name: 'Bone',
                            doctors: '10 Doctors')
                      ],
                    ),
                  ),
                  const SizedBox(),
                  Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top rated',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'See all',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                color: Color(0xFF5E5D5D)),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      doctorCard(
                          picture: 'assets/images/img1.png',
                          name: 'Dr. Fred Mask',
                          occupation: 'Heart Surgeon',
                          rating: '4.9',
                          distance: '3.1 km'),
                      doctorCard(
                          picture: 'assets/images/img2.png',
                          name: 'Dr. Stella Kane',
                          occupation: 'Bone Specialist',
                          rating: '4.7',
                          distance: '4.6 km'),
                      doctorCard(
                          picture: 'assets/images/img3.png',
                          name: 'Dr. Zac Wolff',
                          occupation: 'Eyes Specialist',
                          rating: '4.5',
                          distance: '4.6 km')
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cards({type, name, doctors}) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 25),
      padding: const EdgeInsets.fromLTRB(15, 18, 15, 18),
      decoration: BoxDecoration(
          color: AppColors.appCards,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: const Offset(0, 10))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            type,
            height: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(40, 217, 255, 250),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              doctors,
              style: const TextStyle(
                  fontFamily: 'Roboto', fontSize: 10, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget doctorCard({picture, name, occupation, rating, distance}) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const MakeAppointment())),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 18, bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 10))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        occupation,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            color: Color(0xFFABABAB)),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.yellowIcons,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        rating,
                        style:
                            const TextStyle(fontFamily: 'Roboto', fontSize: 12),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      '|',
                      style: TextStyle(fontSize: 15, color: Color(0xFFE1E1E1)),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.yellowIcons,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        distance,
                        style:
                            const TextStyle(fontFamily: 'Roboto', fontSize: 12),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
