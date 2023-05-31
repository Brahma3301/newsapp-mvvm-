import 'package:flutter/material.dart';
import 'package:news_app_mvvm/viewmodels/newsArticleViewModel.dart';

import '../pages/newsArticleDetails.dart';
class NewsList extends StatelessWidget {
 

 final List<NewsArticleViewModel> articles;
 final Function(NewsArticleViewModel article) onselected;
  const NewsList({ required this.articles,required this.onselected});



  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: ((context, index) {
          final article = articles[index];
          return ListTile(
            onTap: () {
              this.onselected(article);
              
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imageURL == "default"
                    ? Image.asset("images/news-placeholder.png")
                    : Image.network(article.imageURL)),
            title: Text(article.title),
          );
        }));
  }
}
