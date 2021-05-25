import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/repositories/repository.dart';
import 'package:docnews/data/services/article_service.dart';
import 'package:docnews/viewmodels/favorites_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:docnews/data/db.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  final db = AppDatabase();
  final repository = ArticleRepository(ArticleService(), ArticleDao(db));
  locator.registerSingleton(repository);
  locator.registerSingleton(FavoritesViewModel(repository));
}
