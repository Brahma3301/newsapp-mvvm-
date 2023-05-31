import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:news_app_mvvm/models/newsArticle.dart';
import 'package:news_app_mvvm/utils/constants.dart';

class Webservice {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
   
    final response = await http.get(Uri.parse(Constants.TOP_HEADLINES_URL));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }

Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async{

  
  final response= await http.get(Uri.parse(Constants.headlinesfor(keyword)));
  if(response.statusCode==200){
    final result=jsonDecode(response.body);
    Iterable list=result["articles"];
    return list.map((article) => NewsArticle.fromJSON(article)).toList();

  }
  else{
    throw Exception("Failed to get news");
  }


}

}
