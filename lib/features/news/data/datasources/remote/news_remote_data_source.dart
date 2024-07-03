import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_flutter/features/news/data/api/api_url.dart';
import 'package:news_flutter/features/news/data/models/news_model.dart';

class NewsRemoteDataSource {
  Future<NewsModel> fetchNews() async {
    try {
      final response = await http.get(Uri.parse(ApiUrl().getQuestion));

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);

        return NewsModel.fromJson(parsed);
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
