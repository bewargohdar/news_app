// news_repository.dart

import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/data/models/news_model.dart';

abstract class NewsRepository {
  Future<DataState<NewsModel>> getNews();
}
