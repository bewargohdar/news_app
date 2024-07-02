import 'package:flutter/material.dart';
import 'package:news_flutter/features/news/presentation/pages/home_screen.dart';

class News extends StatelessWidget {
  const News({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'NewsApp',
      home: HomeScreen(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
