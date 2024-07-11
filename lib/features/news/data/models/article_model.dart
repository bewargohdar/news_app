import 'package:json_annotation/json_annotation.dart';
import 'package:news_flutter/features/news/data/models/source_model.dart';
import 'package:news_flutter/features/news/domain/entitis/article.dart';
part 'article_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Article extends ArticleEntity {
  final Source source;

  final String author;
  final String title;
  final String description;
  final String url;
  @JsonKey(name: 'urlToImage')
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  }) : super(
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          source: source,
          content: content,
        );

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];
}
