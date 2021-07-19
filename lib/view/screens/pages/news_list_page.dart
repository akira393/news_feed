import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/repository/model/news_model.dart';
import 'package:news_feed/view/components/article_tile.dart';
import 'package:news_feed/view/components/category_chips.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/view/components/search_bar.dart';
import 'package:news_feed/viewmodel/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    final primaryColor = Theme.of(context).primaryColor;
    if (!viewModel.isLoading && viewModel.articals.isEmpty) {
      Future(() => viewModel.getNews(
          searchType: SearchType.CATEGORY, category: categories[0]));
    }

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
              onSearch: (keyword) => geKeywordNews(context, keyword),
            ),
            CategoryChips(
                onCategorySelected: (category) =>
                    getCategoryNews(context, category)),
            Expanded(
              child: Consumer<NewsListViewModel>(
                builder: (context, model, child) {
                  return model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: primaryColor,
                        ))
                      : ListView.builder(
                          itemCount: model.articals.length,
                          itemBuilder: (context, int position) => ArticleTile(
                              article: model.articals[position],
                              onArticleclicked: (article) =>
                                  _onArticleclicked(article, context)),
                        );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  //TODO: 記事更新処理
  Future<void> onRefresh() async {
    print("onRefresh");
  }

  Future<void> geKeywordNews(BuildContext context, keyword) async {
    print(keyword);
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.KEYWORD,
      keyWord: keyword,
      category: categories[0],
    );
  }

  Future<void> getCategoryNews(BuildContext context, Category category) async {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
      // keyWord: keyword
    );
  }

  _onArticleclicked(Article article, BuildContext context) {
    print(article.url);
  }
}
