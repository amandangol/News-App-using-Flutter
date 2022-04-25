import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  //save json data inside this
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=84219bc9ca0e4a23a31fd60244709fe5";
    var response = await http.get(Uri.parse((url)));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && (element['description'] != null)) {
          //initialize our model class
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

///fetching news by category
class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin?country=us&category=$category&apiKey=84219bc9ca0e4a23a31fd60244709fe5";

    var response = await http.get(Uri.parse((url)));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && (element['description'] != null)) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
