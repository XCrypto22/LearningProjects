import 'package:flutter/material.dart';

class TheApp extends StatefulWidget {
  const TheApp({super.key});

  @override
  State<TheApp> createState() => _TheAppState();
}

class _TheAppState extends State<TheApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283029),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 70,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'etOS',
            style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 50,
                color: Color(0xFFB9B9B9),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: 230,
            child: LinearProgressIndicator(
              backgroundColor: Color(0xFFF0FBA8),
              color: Color(0xFF19FF19),
              minHeight: 2,
            ),
          )
        ],
      )),
    );
  }
}
