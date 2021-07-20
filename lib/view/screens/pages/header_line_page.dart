import 'package:flutter/material.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/view/components/head_line_item.dart';
import 'package:news_feed/view/components/page_transformer.dart';
import 'package:news_feed/view/screens/news_web_page_screen.dart';
import 'package:news_feed/viewmodel/head_line_viewmodel.dart';
import 'package:provider/provider.dart';

class HeaderLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor=Theme.of(context).primaryColor;
    // final viewModel = Provider.of<HeadLineViewModel>(context, listen: false);
    final viewModel = context.read<HeadLineViewModel>();
    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getheadLines(searchType: SearchType.HEAD_LINE));
    }
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<HeadLineViewModel>(builder: (context, model, child) {
            return model.isLoading
            ?Center(child:CircularProgressIndicator(
              color:primaryColor,))

            : PageTransformer(
                pageViewBuilder: (context, pageVisibilityResolver) {
              return PageView.builder(
                controller: PageController(
                  viewportFraction: 0.85,
                ),
                itemCount: model.articles.length,
                itemBuilder: (context, index) {
                  final article = model.articles[index];
                  final pageVisibility =
                      pageVisibilityResolver.resolvePageVisibility(index);
                  return HeadLineItem(article: article,pageVisibility: pageVisibility,onArticleclicked: (article)=>_onArticleWebPage(context,article),);
                },
              );
            });
          }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => _onRefresh(context),
        ),
      ),
    );
  }

  _onRefresh(BuildContext context) async {
    final viewModel = context.read<HeadLineViewModel>();
    await viewModel.getheadLines(searchType: SearchType.HEAD_LINE);
  }
  _onArticleWebPage(BuildContext context, article) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NewsWebPageScreen(
        article: article,
      ),
    ));
  }
}
