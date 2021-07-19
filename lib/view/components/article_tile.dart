import 'package:flutter/material.dart';
import 'package:news_feed/repository/model/news_model.dart';
import 'package:news_feed/view/components/article_tile_desc.dart';
import 'package:news_feed/view/components/image_from_url.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final ValueChanged onArticleclicked;

  const ArticleTile({required this.article, required this.onArticleclicked});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onArticleclicked(article),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageFromUrl(
                    imageUrl: article.urlToImage,
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: ArticleTileDesc(
                  article: article,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
