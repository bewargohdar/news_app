// news_repository.dart

import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/data/models/news_model.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';

abstract class NewsRepository {
  Future<DataState<List<ArticleEntity>>> getNews();
}
