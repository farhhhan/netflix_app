import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix/Api/functon_api.dart';
import 'package:netflix/widgets/custome_text.dart';

class watchScreen extends StatefulWidget {
  const watchScreen({super.key});

  @override
  State<watchScreen> createState() => _watchScreenState();
}

class _watchScreenState extends State<watchScreen> {
  String url =
      "https://occ-0-1007-1009.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABanvhKgwgugxee29kbwM4Ng8FUhZ5qXV4mAwoGHNCJQsVXeymrqPNbFOlSVbFzvtwttoFCC7HCcG5jprGIGFjwXI7gqbEeJII6GDZjWcl-N5bXH0HRb3dFFmG_nHQCO3R95rp87XV2E0xqUDUkqXzgmcSCsJq76tGSlbicFJllaS33G2nQyUsQ.png?r=ec9";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: popularmovielist.length,
      itemBuilder: (context, index) {
        print(popularmovielist);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    popularmovielist[index]['backdrop_path']),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    top: 80,
                    left: 180,
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: Center(
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 80,
                  width: 180,
                  child: Image.network(url),
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
                SizedBox(
                  width: 20,
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
                        onPressed: () {}, icon: FaIcon(FontAwesomeIcons.play)),
                    Text("Play")
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          wight: FontWeight.w700,
                          text:
                              "Watch in Tamil ,Telugu,Kanada and malayalam audio",
                          size: 13),
                      SizedBox(
                        height: 5,
                      ),
                      Text("${popularmovielist[index]['overview']}")
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            )
          ],
        );
      },
    ));
  }
}
