import 'package:flutter/material.dart';
import 'package:news_app_mvvm/pages/newsArticleDetails.dart';
import 'package:news_app_mvvm/viewmodels/newsArticleListViewModal.dart';
import 'package:provider/provider.dart';
import 'package:news_app_mvvm/widgets/newslist.dart';

import '../viewmodels/newsArticleViewModel.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(BuildContext context,NewsArticleViewModel article){

Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsArticleDetailsPage(article:article)));
}

  Widget _buildList(BuildContext context , NewsArticleListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.searching:
      return const Align(child: CircularProgressIndicator());

      case LoadingStatus.empty:
      return const Align(child: Text("No results found!"));

      case LoadingStatus.completed:
      return Expanded(child: NewsList(articles: vm.articles,onselected: (article) {
        _showNewsArticleDetails(context, article);
      } ));

    }

  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Top News")),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                //fetch all the news related to the keyword
                if(value.isNotEmpty){
                vm.search(value);
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Search Term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear), onPressed: () { 
                      _controller.clear();
                      setState(() {
                        Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
                        
                      });
                      
                     },
                  )),
            ),
            _buildList(context,vm)
          ],
        ));
  }
}
