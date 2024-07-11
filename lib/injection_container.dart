import 'package:get_it/get_it.dart';
import 'package:news_flutter/core/res/data_state.dart';
import 'package:news_flutter/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:news_flutter/features/news/data/repository/news_repository_iml.dart';
import 'package:news_flutter/features/news/domain/repository/news_repository.dart';
import 'package:news_flutter/features/news/domain/usecase/get_article.dart';
import 'package:news_flutter/features/news/presentation/bloc/bloc/news_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencis() async {
  sl.registerFactory(() => NewsBloc(sl()));

  sl.registerLazySingleton(() => GetArticle(sl()));

  sl.registerLazySingleton<NewsRepository>(
      () => NewsRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton(() => NewsRemoteDataSource());
}
