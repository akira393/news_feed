import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/repository/model/news_model.dart';

class NewsRepository {
  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "b9b6c21472484911bf229e45ea976504";

  Future<List<Article>> getNews({
    required SearchType searchType,
    Category? category,
    String? keyWord,
  }) async {
    http.Response? response;
    List<Article> results = [];
    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(
            BASE_URL + "&q=$keyWord" + "&pageSize=30&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(
            BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }
    if (response.statusCode != 200) {
      throw Exception("request error");
    }
    
    final responseBody = response.body;
    results = News.fromJson(jsonDecode(responseBody)).articles;
    return results;
  }
}
