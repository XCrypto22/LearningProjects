import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void runApp() {
  const MaterialApp(
    home: MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF283029),
    );
  }
}
