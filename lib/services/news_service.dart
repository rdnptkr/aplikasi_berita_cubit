import 'package:dio/dio.dart';
import '../models/news_model.dart';

class NewsService {
  final Dio _dio = Dio();
  final String _url = 'https://fakenews.squirro.com/news/sport';

  Future<List<News>> getNews() async {
    final response = await _dio.get(_url);
    final newsResponse = NewsResponse.fromJson(response.data);
    return newsResponse.news ?? [];
  }
}