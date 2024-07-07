import 'package:bloc/bloc.dart';
import 'package:news_flutter/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:news_flutter/features/news/presentation/bloc/bloc/news_event.dart';
import 'package:news_flutter/features/news/presentation/bloc/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsBloc(this.newsRemoteDataSource) : super(NewsInitial()) {
    on<FetchNews>(_onFetchNews);
  }

  void _onFetchNews(FetchNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());

    try {
      final news = await newsRemoteDataSource.fetchNews();
      emit(NewsLoaded(news.articles));
    } catch (e) {
      emit(NewsError('Failed to fetch news: $e'));
    }
  }
}
