import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class ArticleRepo{

  final dio = Dio();

  Future<List<Article>> getArticles() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=95d39f5147a247b2851094bfdfa24cd2');
    ArticleModel articleModel = ArticleModel.fromJson(response.data);
    return articleModel.articles;
  }
}
