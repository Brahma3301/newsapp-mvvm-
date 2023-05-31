import 'package:flutter/material.dart';
import 'package:news_app_mvvm/viewmodels/newsArticleViewModel.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class NewsArticleDetailsPage extends StatelessWidget {

final NewsArticleViewModel article;

 NewsArticleDetailsPage({required this.article});

 



@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.article.title}"),
      ),
    body: WebView(initialUrl: "${this.article.url}")
    );
  }
}