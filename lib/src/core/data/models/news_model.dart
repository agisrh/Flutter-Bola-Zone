class NewsModel {
  final String title;
  final String thumbnail;
  final String url;

  NewsModel({
    required this.title,
    required this.thumbnail,
    required this.url,
  });

  static NewsModel fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"],
      thumbnail: json["thumbnail"],
      url: json["url"],
    );
  }
}
