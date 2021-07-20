import 'package:flutter/material.dart';
import 'package:news_feed/repository/model/news_model.dart';
import 'package:news_feed/view/components/image_from_url.dart';
import 'package:news_feed/view/components/lazy_load_text.dart';
import 'package:news_feed/view/components/page_transformer.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;
  final PageVisibility pageVisibility;
  final ValueChanged onArticleclicked;

  HeadLineItem(
      {required this.pageVisibility,
      required this.article,
      required this.onArticleclicked});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onArticleclicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black87,
                    Colors.black26,
                  ],
                ),
              ),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              bottom: 56,
              left: 32,
              right: 32,
              child: LazyLoadText(
                text: article.title ?? "",
                pageVisibility: pageVisibility,
              ),
            )
          ],
        ),
      ),
    );
  }
}
