import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/detials_movie.dart';
import 'package:netflix/widgets/custome_text.dart';

// ignore: must_be_immutable
class custom_trending extends StatefulWidget {
  custom_trending(
      {super.key, required this.trendingMovie, required this.texts});
  String texts;
  final List trendingMovie;

  @override
  State<custom_trending> createState() => _custom_trendingState();
}

class _custom_trendingState extends State<custom_trending> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: customText(
            text: widget.texts,
            size: 25,
            space: 2.5,
            wight: FontWeight.w700,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 200,
              child: CarouselSlider.builder(
                itemCount: widget.trendingMovie.length,
                itemBuilder:
                    (BuildContext context, int Index, int pageViewIndex) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetialsScreen(
                                  Title: widget.trendingMovie[Index]['title'],
                                  imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                                      widget.trendingMovie[Index]
                                          ['backdrop_path'],
                                  overView: widget.trendingMovie[Index]
                                      ['overview'],
                                  rate: widget.trendingMovie[Index]
                                          ['vote_average']
                                      .toString(),
                                  date: widget.trendingMovie[Index]
                                      ['release_date']),
                            ));
                      },
                      child: Container(
                          width: 200,
                          height: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                              'http://image.tmdb.org/t/p/w500' +
                                  widget.trendingMovie[Index]['poster_path'],
                            ),
                            fit: BoxFit.fill,
                          )),
                          child: customText(
                            text: "${Index + 1}",
                            size: 40,
                            wight: FontWeight.w800,
                          )));
                },
                options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 1,
                  viewportFraction: .4,
                  onPageChanged: (Index, reason) {
                    setState(() {
                      currentIndex = Index;
                    });
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
