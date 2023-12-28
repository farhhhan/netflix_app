import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:netflix/widgets/custom_trending.dart';
import 'package:netflix/widgets/custome_text.dart';

import 'Api/functon_api.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(20),
        elevation: 0,
        title: Text(
          "My Netflix",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 3.5,
          ),
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
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.bars),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      child: Image.network(
                          "https://th.bing.com/th?q=Netflix+Profile+Icons+Green&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.3&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247"),
                    ),
                    customText(
                      text: "Mike",
                      size: 24,
                      wight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.red,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                  ),
                ),
              ),
              title: customText(
                text: "Notifications",
                size: 22,
                wight: FontWeight.w500,
              ),
              trailing: FaIcon(FontAwesomeIcons.angleRight),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.orange,
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.download,
                    color: Colors.white,
                  ),
                ),
              ),
              title: customText(
                text: "Downloads",
                size: 22,
                wight: FontWeight.w500,
              ),
              trailing: FaIcon(FontAwesomeIcons.angleRight),
            ),
            custom_trending(
              trendingMovie: trendingweeklist,
              texts: "Now Trending",
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
