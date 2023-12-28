import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/comming_soon.dart';
import 'package:netflix/watching.dart';
import 'package:netflix/widgets/custome_text.dart';

class hotandnew extends StatefulWidget {
  const hotandnew({super.key});

  @override
  State<hotandnew> createState() => _hotandnewState();
}

class _hotandnewState extends State<hotandnew> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withAlpha(150),
          elevation: 0,
          title: customText(
            text: "New&Hot",
            size: 22,
            wight: FontWeight.w800,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.chromecast),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.search),
            ),
          ],
          bottom: TabBar(
              labelStyle: const TextStyle(color: Colors.black),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "🍿 Coming Soon",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "👀 Everyone's Watching",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [ComminSoon(), watchScreen()]),
      ),
    );
  }
}
