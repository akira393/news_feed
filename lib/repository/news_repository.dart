import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';

class NewsRepository{
  
  Future<void> getNews({
    required SearchType searchType,
    Category? category,
    String? keyWord,
  })async{
    print("repository");  
  }
}