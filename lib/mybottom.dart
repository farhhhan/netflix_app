import 'package:flutter/material.dart';
import 'package:netflix/accout_screen.dart';
import 'package:netflix/home_screen.dart';
import 'package:netflix/hotandnew.dart';
import 'package:netflix/search.dart';


class MyBottom extends StatefulWidget {
  const MyBottom({super.key});

  @override
  State<MyBottom> createState() => _MyBottomState();
}

class _MyBottomState extends State<MyBottom> {
 

  List screens = [HomeScreens(), SearchScreen(), hotandnew(), AccountScreen()];
  int indx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.black.withAlpha(200),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hd_sharp),
            label: "New&Hot",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: "My Netflix",
          ),
        ],
        currentIndex: indx,
        onTap: (int index) {
          setState(() {
            indx = index;
          });
        },
      ),
      body: screens.elementAt(indx),
    );
  }
}
