import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/detials_movie.dart';
import 'package:netflix/widgets/custome_text.dart';

class customCansoler extends StatefulWidget {
  customCansoler({
    super.key,
  });

  @override
  State<customCansoler> createState() => _customCansolerState();
}

class _customCansolerState extends State<customCansoler> {
  int currentindex = 0;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            print(currentindex);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: double.infinity,
              height: 600,
              child: CarouselSlider.builder(
                itemCount: trendingweeklist.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewindex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetialsScreen(
                                Title: trendingweeklist[index]['title'],
                                imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                                    trendingweeklist[index]['backdrop_path'],
                                overView: trendingweeklist[index]['overview'],
                                rate: trendingweeklist[index]['vote_average']
                                    .toString(),
                                date: trendingweeklist[index]['release_date']),
                          ));
                    },
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500' +
                          trendingweeklist[index]['poster_path'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: .1,
                  animateToClosest: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentindex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 70,
          child: Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.black45)),
                  onPressed: () {},
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        customText(
                          text: "Play",
                          size: 22,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: 30,
              ),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.black45)),
                  onPressed: () {},
                  child: Container(
                    width: 100,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        customText(
                          text: "List",
                          size: 22,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
