import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MaterialApp(
    home: MyProfile(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final List<String> _listItem = [
    'assets/images/pic2.jpeg',
    'assets/images/pic3.jpeg',
    'assets/images/pic4.jpeg',
    'assets/images/pic5.jpeg',
    'assets/images/pic6.jpeg',
    'assets/images/pic7.jpeg',
    'assets/images/pic8.jpeg',
    'assets/images/pic9.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),
                const Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 68,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 64,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Maria',
                  style: TextStyle(fontFamily: 'Comfortaa', fontSize: 36),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'SAN FRANCISCO, CA',
                  style: TextStyle(fontFamily: 'Roboto', fontSize: 13),
                ),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 18),
                    child: Center(
                        child: Text(
                      'FOLLOW MARIA',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                          color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 18),
                    child: Center(
                        child: Text(
                      'MESSAGE',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 13,
                          color: Colors.black),
                    )),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      children: _listItem
                          .map((e) => StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 3,
                                child: Container(
                                    padding: EdgeInsets.all(2),
                                    child: Image.asset(e)),
                              ))
                          .toList(),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
