import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:news_flutter/features/news/data/models/news_model.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';
import 'package:news_flutter/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataState<List<ArticleEntity>>> getNews() async {
    try {
      final news = await remoteDataSource.fetchNews();

      return DataSuccess(news);
    } catch (e) {
      return DataError('Failed to fetch news: $e');
    }
  }
}
