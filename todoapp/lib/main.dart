import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/utils/adapter.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      primaryColor: const Color(0xFF1E1E1E),
      scaffoldBackgroundColor: const Color(0xFF1E1E1E),
    ),
    home: const HomePage(),
  ));
}
