// To parse this JSON data, do
//
//     final newResponse = newResponseFromJson(jsonString);

import 'dart:convert';

NewResponse newResponseFromJson(String str) =>
    NewResponse.fromJson(json.decode(str));

String newResponseToJson(NewResponse data) => json.encode(data.toJson());

class NewResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewResponse.fromJson(Map<String, dynamic> json) => NewResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Source source;
  String author;
  String title;
  dynamic description;
  String url;
  dynamic urlToImage;
  String publishedAt;
  dynamic content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? '' ?? '',
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        url: json["url"] ?? '',
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] ?? '',
        content: json["content"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}

class Source {
  String id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? '',
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
