
class NewsArt {
  String imgUrl;
  String newsHead;

  String newsDec;
  String newsCnt;
  String newsUrl;

  NewsArt({
    required this.imgUrl,
    required this.newsHead,
    required this.newsDec,
    required this.newsCnt,
    required this.newsUrl,
  });

   static NewsArt fromApiToApp(Map<String, dynamic> articles) {
    return NewsArt(
      imgUrl: articles["urlToImage"] ??
          "https://img.freepik.com/premium-vector/breaking-news-template-with-3d-red-blue-badge-breaking-news-text-dark-blue-with-earth-world-map-background_34645-1113.jpg",
      newsHead: articles["title"] ?? "--",
      newsDec: articles["description"] ?? "--",
      newsCnt: articles["content"] ?? "--",
      newsUrl: articles["Url"] ??
          "https://news.google.com/home?hl=en-US&gl=US&ceid=US:en",
    );
  }
}
