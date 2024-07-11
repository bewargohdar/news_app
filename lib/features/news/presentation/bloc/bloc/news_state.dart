import 'package:news_flutter/features/news/data/models/article_model.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<ArticleEntity> articles;

  NewsLoaded(this.articles);
}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}
