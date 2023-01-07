import 'package:flutter/material.dart';

import '../models/colors.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  var selectedCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBody,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.appCards,
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.topBar,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 13),
            child: Icon(
              Icons.notifications_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 18, 25),
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                          offset: const Offset(0, 10))
                    ],
                    color: AppColors.topBar,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                child: Row(
                  children: [
                    SizedBox(
                      height: 125,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/img1.png')),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dr. Fred Mask',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Heart Surgen',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Color.fromARGB(255, 223, 223, 223)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowIcons,
                              size: 18,
                            ),
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowIcons,
                              size: 18,
                            ),
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowIcons,
                              size: 18,
                            ),
                            const Icon(Icons.star,
                                color: AppColors.yellowIcons, size: 18),
                            const Icon(
                              Icons.star,
                              color: AppColors.yellowIcons,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 1,
                            offset: const Offset(0, 5))
                      ]),
                  child: const Icon(
                    Icons.location_on,
                    color: AppColors.yellowIcons,
                    size: 35,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'April 2020',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fontColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          days(day: 'Mon', date: '21', selected: true),
                          days(day: 'Tue', date: '22'),
                          days(day: 'Wed', date: '23'),
                          days(day: 'Thur', date: '24'),
                          days(day: 'Fri', date: '25'),
                        ],
                      )),
                  const SizedBox(),
                  const Text(
                    'Morning',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fontColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            time(shift: '08:30 AM'),
                            time(shift: '09:00 AM', selected: true),
                            time(shift: '09:30 AM'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            time(shift: '10:00 AM'),
                            time(shift: '10:30 AM'),
                            time(shift: '11:00 AM'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Evening',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fontColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            time(shift: '05:30 PM'),
                            time(shift: '06:00 PM'),
                            time(shift: '06:30 PM'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            time(shift: '07:00 PM'),
                            time(shift: '07:30 PM'),
                            time(shift: '08:00 PM'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    margin: const EdgeInsets.only(right: 18, bottom: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.appCards,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              offset: const Offset(0, 10))
                        ]),
                    child: const Center(
                      child: Text(
                        'Make An Appointment',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget days({day, date, selected = false}) {
    return Container(
      width: 60,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(right: 20, bottom: 30),
      decoration: BoxDecoration(
          color: selected ? AppColors.appCards : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10,
                offset: const Offset(0, 10))
          ]),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : AppColors.fontColor),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            date,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : AppColors.fontColor),
          ),
        ],
      ),
    );
  }

  Widget time({shift, selected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: selected
          ? BoxDecoration(
              boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: const Offset(0, 5))
                ],
              color: selected ? AppColors.appCards : Colors.white,
              borderRadius: BorderRadius.circular(5))
          : BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(
            Icons.watch_rounded,
            size: 20,
            color: selected ? Colors.white : Colors.grey.shade400,
          ),
          Text(
            shift,
            style: TextStyle(
                fontFamily: 'Roboto',
                color: selected ? Colors.white : AppColors.fontColor,
                fontSize: 13),
          )
        ],
      ),
    );
  }
}
