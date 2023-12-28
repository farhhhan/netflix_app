import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/detials_movie.dart';
import 'package:netflix/widgets/custome_text.dart';

// ignore: must_be_immutable
class custom_sliders extends StatefulWidget {
  custom_sliders({super.key, required this.trendingMovie, required this.texts});
  String texts;
  final List trendingMovie;

  @override
  State<custom_sliders> createState() => _custom_slidersState();
}

class _custom_slidersState extends State<custom_sliders> {
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
              height: 270,
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
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500' +
                          widget.trendingMovie[Index]['poster_path'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: .1,
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
