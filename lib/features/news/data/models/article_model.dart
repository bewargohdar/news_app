import 'package:news_flutter/features/news/data/models/source_model.dart';

class Article {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'urlToImage': urlToImage,
      'content': content,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'source': source,
    };
  }

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        // Calculate minutes ago

        source: Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String,
        description: json['description'] as String?,
        url: json['url'] as String,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] != null
            ? DateTime.parse(json['publishedAt'])
            : DateTime.now(),

        content: json['content'] as String,
      );
}
