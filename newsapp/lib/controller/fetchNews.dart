//https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=ec47d406d4784f8db5de7116a84ba384

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:newsapp/model/newArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var sourcesID = sourcesId[random.nextInt(sourcesId.length)];
    print(sourcesID);

    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourcesId&apiKey=ec47d406d4784f8db5de7116a84ba384"));
    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    final Newrandom = Random();
    var myArticle = articles[random.nextInt(articles.length)];

    return NewsArt.fromApiToApp(myArticle);
  }
}
