import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final Dio dio = Dio();
  NewsService();
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=bd69309f04404465a1e8f04ff6f70c8d&country=us&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            title: article['title'],
            description: article['description'],
            image: article['urlToImage'],
            url: article['url']);
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
