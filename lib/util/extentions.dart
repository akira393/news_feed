import 'package:news_feed/repository/model/database.dart';
import 'package:news_feed/repository/model/news_model.dart';

//dartのモデルクラスからDBのテーブルクラスに変換
extension ConverterArticleRecord on List<Article> {
  List<ArticleRecord> toArticleRecords(List<Article> articles) {
    List<ArticleRecord> articleRecords = [];
    articles.forEach((article) {
      articleRecords.add(ArticleRecord(
          title: article.title ?? "",
          description: article.description ?? "",
          url: article.url ?? "",
          urlToImage: article.urlToImage ?? "",
          content: article.content ?? "",
          publishDate: article.publishDate ?? ""));
    });
    return articleRecords;
  }
}

//DBのテーブルクラスからdartのモデルクラスに変換
extension ConverterArticle on List<ArticleRecord> {
  List<Article> toArticles(List<ArticleRecord> articleRecords) {
    List<Article> articles = [];
    articleRecords.forEach((articleRecord) {
      articles.add(Article(
          title: articleRecord.title,
          description: articleRecord.description,
          url: articleRecord.url,
          urlToImage: articleRecord.urlToImage,
          content: articleRecord.content,
          publishDate: articleRecord.publishDate));
    });
    return articles;
  }
}
