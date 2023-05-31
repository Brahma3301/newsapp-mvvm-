import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String? description;
  final String url;
  final String urlToImage;

  NewsArticle(
      {required this.title,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
        title: json["title"],
        description: json["description"], 
        url: json["url"],
        urlToImage: json["urlToImage"]??"default");
  }
}
