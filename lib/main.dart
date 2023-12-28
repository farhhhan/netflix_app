import 'package:flutter/material.dart';
import 'package:netflix/mybottom.dart';
import 'package:netflix/splash.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: splashScreen(),
    );
  }
}
