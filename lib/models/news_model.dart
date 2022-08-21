class NewsModel {
  List<News> news = [];

  NewsModel.fromJson(json) {
    json['articles'].forEach((element) {
      news.add(News.fromJson(element));
    });
  }
}

class News {
  String? title;
  String? url;
  String? urlToImage;
  String? publishedAt;
  News.fromJson(Map json) {
    title = json['title'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
