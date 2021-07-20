import 'package:news_feed/repository/model/dao.dart';
import 'package:news_feed/repository/model/database.dart';
import 'package:news_feed/repository/news_repository.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

List globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewMoedels,
];

List independentModels = [
  Provider<MyDatabase>(
    create: (_) => MyDatabase(),
    dispose: (_, db) => db.close(),
  ),
];

List dependentModels = [
  ProxyProvider<MyDatabase, NewsDao>(
    update: (_, db, dao) => NewsDao(db),
  ),
  ProxyProvider<NewsDao, NewsRepository>(
    update: (_, dao, repository) => NewsRepository(dao: dao),
  ),
];
