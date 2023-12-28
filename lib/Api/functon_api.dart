import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/Api/apikey.dart';

List<Map<String, dynamic>> popularmovielist = [];
List<Map<String, dynamic>> trendingweeklist = [];
List<Map<String, dynamic>> nowplayinglist = [];
List<Map<String, dynamic>> topRatedMovielist = [];
List<Map<String, dynamic>> upcommingist = [];
List<Map<String, dynamic>> allMovies = [];

Future<void> popularloading() async {
  final popularResponse = await http.get(Uri.parse(nowpopularmovieurl));
  if (popularResponse.statusCode == 200) {
    var tempdata = jsonDecode(popularResponse.body);
    List populatmovie = tempdata['results'];
    for (int i = 0; i < populatmovie.length; i++) {
      popularmovielist.add({
        'title': populatmovie[i]["title"],
        'backdrop_path': populatmovie[i]["backdrop_path"],
        'overview': populatmovie[i]["overview"],
        'vote_average': populatmovie[i]["vote_average"],
        'release_date': populatmovie[i]["release_date"],
        'poster_path': populatmovie[i]["poster_path"],
      });
    }
    allMovies.addAll(popularmovielist);
  } else {
    // Handle the error case
  }
}

Future<void> upcommingM() async {
  final upcommingResponse = await http.get(Uri.parse(upcommingUrl));
  if (upcommingResponse.statusCode == 200) {
    var tempdata = jsonDecode(upcommingResponse.body);
    List upcom = tempdata['results'];
    for (int i = 0; i < upcom.length; i++) {
      upcommingist.add({
        'title': upcom[i]["title"],
        'backdrop_path': upcom[i]["backdrop_path"],
        'overview': upcom[i]["overview"],
        'vote_average': upcom[i]["vote_average"],
        'release_date': upcom[i]["release_date"],
        'poster_path': upcom[i]["poster_path"],
      });
    }
    allMovies.addAll(upcommingist);
  } else {
    // Handle the error case
  }
}

Future<void> nowPlayingloading() async {
  final nowplayResponse = await http.get(Uri.parse(noewplayingmovieurl));
  if (nowplayResponse.statusCode == 200) {
    var tempdata = jsonDecode(nowplayResponse.body);
    var nowplaydata = tempdata['results'];
    for (int i = 0; i < nowplaydata.length; i++) {
      nowplayinglist.add({
        'title': nowplaydata[i]["title"],
        'backdrop_path': nowplaydata[i]["backdrop_path"],
        'overview': nowplaydata[i]["overview"],
        'vote_average': nowplaydata[i]["vote_average"],
        'release_date': nowplaydata[i]["release_date"],
        'poster_path': nowplaydata[i]["poster_path"],
      });
    }
    allMovies.addAll(nowplayinglist);
  } else {
    // Handle the error case
  }
}

Future<void> trendingmovieLoad() async {
  final trendingweek = await http.get(Uri.parse(trendingweekurl));
  if (trendingweek.statusCode == 200) {
    var tempdata = jsonDecode(trendingweek.body);
    List trendingMovie = tempdata['results'];
    for (int i = 0; i < trendingMovie.length; i++) {
      trendingweeklist.add({
        'title': trendingMovie[i]["title"],
        'backdrop_path': trendingMovie[i]["backdrop_path"],
        'overview': trendingMovie[i]["overview"],
        'vote_average': trendingMovie[i]["vote_average"],
        'release_date': trendingMovie[i]["release_date"],
        'poster_path': trendingMovie[i]["poster_path"],
      });
    }
    allMovies.addAll(trendingweeklist);
  }
}

Future<void> topratedloading() async {
  final topratedmoviess = await http.get(Uri.parse(topratedMoviesurl));
  if (topratedmoviess.statusCode == 200) {
    var tempdata = jsonDecode(topratedmoviess.body);
    var topRatedMovies = tempdata['results'];
    for (int i = 0; i < topRatedMovies.length; i++) {
      topRatedMovielist.add({
        'title': topRatedMovies[i]["title"],
        'backdrop_path': topRatedMovies[i]["backdrop_path"],
        'overview': topRatedMovies[i]["overview"],
        'vote_average': topRatedMovies[i]["vote_average"],
        'release_date': topRatedMovies[i]["release_date"],
        'poster_path': topRatedMovies[i]["poster_path"],
      });
    }
    allMovies.addAll(topRatedMovielist);
  } else {
    // Handle the error case
  }
}
