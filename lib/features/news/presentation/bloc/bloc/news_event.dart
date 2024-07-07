import 'package:bloc/bloc.dart';
import 'package:news_flutter/features/news/presentation/bloc/bloc/news_state.dart';

import '../../../data/datasources/remote/news_remote_data_source.dart';

abstract class NewsEvent {}

class FetchNews extends NewsEvent {}

// Define the Bloc itself
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsBloc(this.newsRemoteDataSource) : super(NewsInitial());
}
