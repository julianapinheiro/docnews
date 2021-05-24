import 'package:docnews/data/db.dart';
import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/services/article_service.dart';

class ArticleRepository {
  final ArticleService service;
  final ArticleDao dao;
  const ArticleRepository({
    required this.service,
    required this.dao,
  });

  Future<List<Article>> getArticleListPage(
      int offset, int limit, String? searchTerm) {
    return service.fetchArticles(offset, limit, searchTerm ?? '');
  }

  Stream<List<Article>> getFavorites(String? searchTerm) {
    return dao.getFavorites(searchTerm ?? '');
  }

  Future<void> setFavorite(Article article, bool favorite) {
    final id = article.id;
    return dao.insert(article).then((value) => dao.setFavorite(id, favorite));
  }
}
