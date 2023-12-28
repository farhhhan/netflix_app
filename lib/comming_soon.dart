import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Api/apikey.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/widgets/custome_text.dart';

class ComminSoon extends StatefulWidget {
  const ComminSoon({super.key});

  @override
  State<ComminSoon> createState() => _ComminSoonState();
}

class _ComminSoonState extends State<ComminSoon> {
  String url =
      "https://occ-0-1007-1009.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABanvhKgwgugxee29kbwM4Ng8FUhZ5qXV4mAwoGHNCJQsVXeymrqPNbFOlSVbFzvtwttoFCC7HCcG5jprGIGFjwXI7gqbEeJII6GDZjWcl-N5bXH0HRb3dFFmG_nHQCO3R95rp87XV2E0xqUDUkqXzgmcSCsJq76tGSlbicFJllaS33G2nQyUsQ.png?r=ec9";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: ListView.builder(
          itemCount: trendingweeklist.length,
          itemBuilder: (context, index) {
            List update = upcommingist[index]['release_date'].split("-");
            for (int i = 0; i < update.length; i++) {
              String last = update.first;
              update.first = update.last;
              update.last = last;
            }
            var months = dates['${update[1]}'];
            var day = update.first;
            String date = update.join("-");
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            customText(
                              text: "${months}",
                              size: 20,
                              wight: FontWeight.w500,
                            ),
                            customText(
                              text: "${day}",
                              size: 25,
                              wight: FontWeight.w800,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 340,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/' +
                                        upcommingist[index]['backdrop_path']),
                                fit: BoxFit.fill)),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500/' +
                                    upcommingist[index]['poster_path'],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.bell)),
                              Text("Remind Me")
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(FontAwesomeIcons.infoCircle)),
                              Text("Info")
                            ],
                          ),
                        ],
                      ),
                      customText(
                        text:
                            "Comming on ${(upcommingist[index]['release_date'] != null) ? date : "25 DECEMBER"}",
                        size: 15,
                        wight: FontWeight.w800,
                      ),
                      SizedBox(
                          width: 340,
                          child: Text("${upcommingist[index]['overview']}")),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ))
      ]),
    );
  }
}
