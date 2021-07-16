import 'package:flutter/material.dart';
import 'package:news_feed/view/components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => onRefresh(),
        tooltip: "更新",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(
              onSearch: (keyword)=>geKeywordNews(context,keyword),
            ),
            // CategoryChips(),
            Expanded(child: Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
    ));
  }
  //TODO: 記事更新処理
  onRefresh() {
    print("onRefresh");
  }
  //TODO: キーワード記事検索取得
  geKeywordNews(BuildContext context, keyword) {
    print("getkeywordnews");
    print(keyword);
  }
}