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

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    // Check for null values or default values
    String status = json['status'] ?? '';
    int totalResults = json['totalResults'] ?? 0;
    List<Article> articles = [];

    if (json['articles'] != null) {
      articles = (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return NewsModel(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }
}
