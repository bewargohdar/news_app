import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';
import 'package:news_flutter/features/news/domain/repository/news_repository.dart';

import '../../../../core/usecase/usecase.dart';

class GetArticle implements UseCase<DataState<List<ArticleEntity>>, void> {
  final NewsRepository repository;

  GetArticle(this.repository);

  Future<DataState<List<ArticleEntity>>> call({void params}) async {
    try {
      return await repository.getNews();
    } catch (e) {
      return DataError('Failed to fetch news: $e');
    }
  }
}
