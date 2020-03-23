import 'package:reporterr/models/source.dart';

class Article{
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  Article({this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.content, this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      publishedAt: json['publishedAt']
    );
  }


}