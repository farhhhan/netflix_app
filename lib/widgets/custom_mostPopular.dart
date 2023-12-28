import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/detials_movie.dart';
import 'package:netflix/widgets/custome_text.dart';

class customPopular extends StatefulWidget {
  customPopular({super.key, required this.mostpopular, required this.texts});
  String texts;
  final List mostpopular;

  @override
  State<customPopular> createState() => _customPopularState();
}

class _customPopularState extends State<customPopular> {
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
                itemCount: widget.mostpopular.length,
                itemBuilder:
                    (BuildContext context, int Index, int pageViewIndex) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetialsScreen(
                                Title: widget.mostpopular[Index]
                                    ['original_name'],
                                imageUrl: 'https://image.tmdb.org/t/p/w500/' +
                                    widget.mostpopular[Index]['backdrop_path'],
                                overView: widget.mostpopular[Index]['overview'],
                                rate: widget.mostpopular[Index]['vote_average']
                                    .toString(),
                                date: widget.mostpopular[Index]
                                    ['first_air_date']),
                          ));
                    },
                    child: Image.network(
                      'http://image.tmdb.org/t/p/w500' +
                          widget.mostpopular[Index]['poster_path'],
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
