import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_flutter/features/news/data/api/api_url.dart';

import '../../models/article_model.dart';

class NewsRemoteDataSource {
  Future<List<Article>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl().getQuestion));

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);
        final List<Article> articles = parsed['articles']
            .map<Article>((json) => Article.fromJson(json))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
