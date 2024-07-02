import 'package:news_flutter/features/news/data/models/article_model.dart';

class NewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    String status = json['status'] ?? ''; // Default value for status
    int totalResults =
        json['totalResults'] ?? 0; // Default value for totalResults
    List<Article> articles = [];

    if (json['articles'] != null) {
      articles = List<Article>.from(
          json['articles'].map((articleJson) => Article.fromJson(articleJson)));
    }

    return NewsModel(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}
