import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/repository/model/news_model.dart';
import 'package:news_feed/repository/news_repository.dart';

class HeadLineViewModel extends ChangeNotifier {
  final NewsRepository _newsRepository = NewsRepository();

  SearchType _searchType = SearchType.HEAD_LINE;
  get searchType => _searchType;
  String _keyWord = "";
  get keyWord => _keyWord;

  Category _category = categories[0];
  get category => _category;

  bool _isLoading = false;
  get isLoading => _isLoading;

  List<Article> _articles = [];
  get articles => _articles;

  Future<void> getheadLines({required SearchType searchType}) async {
    _searchType = searchType;
    _isLoading = true;
    notifyListeners();

    _articles = await _newsRepository.getNews(searchType: searchType);

    _isLoading=false;
    notifyListeners();
  }
}
