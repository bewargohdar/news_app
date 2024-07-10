import 'package:news_flutter/features/news/data/models/source_model.dart';

class ArticleEntity {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final Source source;
  final String author;

  ArticleEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
    required this.author,
    required this.content,
  });
}
