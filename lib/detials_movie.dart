// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/widgets/custom_slider.dart';
import 'package:netflix/widgets/custome_text.dart';

class DetialsScreen extends StatefulWidget {
  DetialsScreen(
      {super.key,
      required this.Title,
      required this.date,
      required this.imageUrl,
      required this.overView,
      required,
      this.rate});

  String? imageUrl;
  String? Title;
  String? date;
  String? rate;
  String? overView;
  @override
  State<DetialsScreen> createState() => _DetialsScreenState();
}

class _DetialsScreenState extends State<DetialsScreen> {
  @override
  Widget build(BuildContext context) {
    List update = widget.date!.split("-");
    for (int i = 0; i < update.length; i++) {
      String last = update.first;
      update.first = update.last;
      update.last = last;
    }
    String date = update.join("-");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withAlpha(150),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imageUrl!),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                top: 100,
                left: 180,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Center(
                    child: Icon(Icons.play_arrow),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 280,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 3),
                  child: customText(
                    text: "${widget.Title}",
                    size: 30,
                    wight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: customText(
                  text: "⭐${widget.rate}",
                  size: 22,
                  wight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 3),
            child: customText(
              text: "Relase Date : ${date}",
              size: 18,
              wight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                customText(text: "2023", size: 16),
                SizedBox(
                  width: 20,
                ),
                Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        customText(text: "U/A ", size: 16),
                        customText(text: "13+", size: 16),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        customText(text: "HD ", size: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: customText(
                wight: FontWeight.w700,
                text: "Watch in Tamil ,Telugu,Kanada and malayalam audio",
                size: 13),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 50,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: Colors.black,
                      ),
                      customText(
                        text: "Play ",
                        size: 20,
                        wight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 8),
            child: Container(
              height: 50,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download,
                        size: 30,
                        color: Colors.white,
                      ),
                      customText(
                        text: "Download",
                        size: 20,
                        wight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: 340,
                child: customText(
                  text: "${widget.overView}",
                  size: 14.5,
                  space: .5,
                )),
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {}, icon: FaIcon(FontAwesomeIcons.add)),
                  Text("My List")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.thumbsUp)),
                  Text("Rate")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share_outlined,
                        size: 29,
                      )),
                  Text("Share")
                ],
              ),
            ],
          ),
          Expanded(
              child: custom_sliders(
                  trendingMovie: trendingweeklist, texts: "Must Watch")),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
