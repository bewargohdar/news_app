import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/features/news/data/datasources/remote/news_remote_data_source.dart';
import 'package:news_flutter/features/news/data/repository/news_repository_iml.dart';
import 'package:news_flutter/features/news/domain/repository/news_repository.dart';
import 'package:news_flutter/features/news/domain/usecase/get_article.dart';
import 'package:news_flutter/features/news/presentation/bloc/bloc/news_bloc.dart';
import 'package:news_flutter/features/news/presentation/pages/home_screen.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        GetArticle(
          NewsRepositoryImpl(
            remoteDataSource: NewsRemoteDataSource(),
          ),
        ),
      ),
      child: const MaterialApp(
        title: 'NewsApp',
        home: HomeScreen(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}
