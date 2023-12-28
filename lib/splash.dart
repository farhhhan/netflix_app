import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/mybottom.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  void initState() {
    // TODO: implement initState
    loadingTrending();
    super.initState();
  }

  Future<void> loadingTrending() async {
    upcommingM();
    nowPlayingloading();
    popularloading();
    topratedloading();
    trendingmovieLoad();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyBottom(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
