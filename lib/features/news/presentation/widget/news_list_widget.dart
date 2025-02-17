import 'package:flutter/material.dart';
import 'package:news_flutter/features/news/data/models/article_model.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';
import 'package:news_flutter/features/news/presentation/pages/news_detail_screen.dart'; // Adjust this import based on your actual model

class NewsListItemWidget extends StatelessWidget {
  final ArticleEntity article;

  const NewsListItemWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetail(article: article),
          ),
        );
      },
      child: Container(
        width: 280,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    article.urlToImage ?? '',
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text('No Image'),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                article.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(article.author ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
