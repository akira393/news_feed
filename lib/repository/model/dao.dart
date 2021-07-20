import 'package:moor/moor.dart';
import 'package:news_feed/repository/model/database.dart';

part 'dao.g.dart';

@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {
  NewsDao(MyDatabase attachedDatabase) : super(attachedDatabase);

  Future<void> cleanDB() => delete(articleRecords).go();

  Future<void> insertDB(List<ArticleRecord> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles);
    });
  }

  Future<List<ArticleRecord>> get articleFromDB => select(articleRecords).get();

  Future<List<ArticleRecord>> insertReadFromDB(List<ArticleRecord> articles) =>
      transaction(() async {
        cleanDB();
        insertDB(articles);
        return await articleFromDB;
      });
}
