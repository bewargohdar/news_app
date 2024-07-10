import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';
import 'package:news_flutter/features/news/domain/repository/news_repository.dart';

class GetArticle {
  final NewsRepository repository;

  GetArticle(this.repository);

  Future<DataState<List<ArticleEntity>>> call() async {
    try {
      return await repository.getNews();
    } catch (e) {
      return DataError('Failed to fetch news: $e');
    }
  }
}
