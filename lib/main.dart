import 'package:flutter/material.dart';
import 'package:news_app_mvvm/pages/newsListPage.dart';
import 'package:news_app_mvvm/viewmodels/newsArticleListViewModal.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fresh News",
        home: ChangeNotifierProvider(
          create: (BuildContext context) => NewsArticleListViewModel(),
          child: NewsListPage(),
        ));
  }
}
