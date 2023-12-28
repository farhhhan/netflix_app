String apiKey = '04f2d06f535941820a67d0c227a7cada';

String trendingweekurl =
    "https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey";

String noewplayingmovieurl =
    "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

String nowpopularmovieurl =
    "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

String topratedMoviesurl =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey";

String upcommingUrl =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

Map<String, String> dates = {
  "01":"JAN",
  "02":"FEB",
  "03":"MAR",
  "04":"APR",
  "05":"MAY",
  "06":"JUN",
  "07":"JUL",
  "08":"AGU",
  "09":"SEP",
  "10":"OCT",
  "11":"NOV",
  "12":"DEC",
};
