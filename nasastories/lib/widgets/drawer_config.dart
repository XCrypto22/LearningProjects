import 'package:flutter/material.dart';
import 'package:nasastories/screens/home_screen.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 30, 14, 255),
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Container(
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
            ),
          )),
          Column(children: <Widget>[
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      ModalRoute.withName("/Home"));
                  //Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text(
                  "My Stories",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  setState(() {
                    text = "settings pressed";
                  });
                }),
            ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text(
                  "Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  setState(() {
                    text = "settings pressed";
                  });
                }),
            ListTile(
                leading: const Icon(Icons.rocket_launch),
                title: const Text(
                  "Missions",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  setState(() {
                    text = "settings pressed";
                  });
                }),
            ListTile(
                leading: const Icon(Icons.web),
                title: const Text(
                  "NASA Website",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {}),
            ListTile(
                leading: const Icon(Icons.info),
                title: const Text(
                  "About",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400),
                ),
                onTap: () {
                  showAboutDialog(
                      context: context,
                      applicationName: "NASA Stories",
                      applicationVersion: "v1.0.0",
                      applicationIcon: Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                      ),
                      applicationLegalese:
                          'Developed by Elton T. Fungirai - eltonfungirai@gmail.com');
                }),
          ])
        ],
      ),
    );
  }
}
