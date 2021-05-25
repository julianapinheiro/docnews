import 'package:docnews/data/db.dart';
import 'package:docnews/data/models/article.dart';
import 'package:moor/moor.dart';

part 'article_dao.g.dart';

@UseDao(tables: [Articles])
class ArticleDao extends DatabaseAccessor<AppDatabase> with _$ArticleDaoMixin {
  ArticleDao(AppDatabase db) : super(db);

  Future<void> insert(Article article) async {
    into(articles).insertOnConflictUpdate(article);
  }

  Stream<List<Article>> getFavorites(String searchTerm) {
    return (select(articles)
          ..where(
              (a) => a.isFavorite.equals(true) & a.title.contains(searchTerm)))
        .watch();
  }

  Future<Article> addFavorite(Article article) async {
    final _article = article.copyWith(isFavorite: true);
    into(articles).insert(_article, mode: InsertMode.replace);
    return _article;
  }

  Future<Article> removeFavorite(Article article) async {
    delete(articles).delete(article);
    return article.copyWith(isFavorite: false);
  }
}
