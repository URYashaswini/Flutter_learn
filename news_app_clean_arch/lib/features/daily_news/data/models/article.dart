import 'package:news_app_clean_arch/features/daily_news/domain/entities/aticle.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {int? id,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publishedAt,
      String? content});
  factory ArticleModel.fromMap(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"],
      );

  // Map<String, dynamic> toMap() => {
  //       "id": id,
  //       "author": author,
  //       "title": title,
  //       "description": description,
  //       "url": url,
  //       "urlToImage": urlToImage,
  //       "publishedAt": publishedAt,
  //       "content": content,
  //     };
}
