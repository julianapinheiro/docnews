import 'package:docnews/data/db.dart';
import 'package:docnews/data/models/article.dart';
import 'package:moor/moor.dart';

part 'article_dao.g.dart';

@UseDao(tables: [Articles])
class ArticleDao extends DatabaseAccessor<AppDatabase> with _$ArticleDaoMixin {
  ArticleDao(AppDatabase db) : super(db);

  Stream<List<Article>> getFavorites() {
    return (select(articles)..where((a) => a.isFavorite.equals(true))).watch();
  }

  Future<Article> addFavorite(Article article) async {
    final _article = article.copyWith(isFavorite: true);
    into(articles).insertOnConflictUpdate(_article);
    return _article;
  }

  Future<Article> removeFavorite(Article article) async {
    delete(articles).delete(article);
    return article.copyWith(isFavorite: false);
  }

  Stream<bool> isFavorite(Article article) {
    final _article = (select(articles)..where((e) => e.id.equals(article.id)))
        .watchSingle()
        .map((e) => e.isFavorite);
    return _article;
  }
}
