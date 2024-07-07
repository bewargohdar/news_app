import 'package:news_flutter/features/news/data/models/article_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articles;

  NewsLoaded(this.articles);
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
