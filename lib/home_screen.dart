import 'package:flutter/material.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/widgets/custom_slider.dart';
import 'package:netflix/widgets/custom_trending.dart';
import 'package:netflix/widgets/custome_cansoler.dart';
import 'package:netflix/widgets/custome_text.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(popularmovielist);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.black.withAlpha(150),
            elevation: 0,
            title: Container(
              height: 50,
              width: 50,
              child: Image.network(
                'https://venturebeat.com/wp-content/uploads/2016/06/netflix-logo.png?w=1200&strip=all',
                fit: BoxFit.fill,
              ),

              // child: Text(
              //   "N",
              //   style: TextStyle(
              //     fontSize: 50,
              //     fontWeight: FontWeight.w700,
              //     color: Colors.red,
              //     letterSpacing: 3.5,
              //   ),
              // ),
            )),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.black.withAlpha(200),
                title: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: customText(text: "TV Show", size: 16)),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Center(child: customText(text: "Movie", size: 16)),
                      ),
                    )
                  ],
                ),
                floating: true,
              )
            ];
          },
          body: ListView(
            children: [
              customCansoler(),
              custom_trending(
                  texts: "Trending", trendingMovie: trendingweeklist),
              custom_sliders(
                  trendingMovie: nowplayinglist, texts: "Now Playing"),
              custom_sliders(
                  trendingMovie: popularmovielist, texts: "Most Popular"),
              custom_sliders(
                  trendingMovie: topRatedMovielist, texts: "Top Rated"),
            ],
          ),
        ));
  }
}
