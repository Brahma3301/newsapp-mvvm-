import 'package:flutter/cupertino.dart';
import 'package:news_app_mvvm/models/newsArticle.dart';
import 'package:news_app_mvvm/services/webservice.dart';
import 'package:news_app_mvvm/viewmodels/newsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> populateTopHeadlines() async {
   this.loadingStatus = LoadingStatus.searching;
    
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
//  your model should not be talking to the inteerface,the model is domain model(it contain all logic ) which is NewsArticle, and it shouldnt be talking
// to the interface thats why we created NewsArticleViewModel.dart thats the one we will be using
// to give to interface so that interface can display all of things
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus =this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    
    List<NewsArticle> newsArticles =await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
