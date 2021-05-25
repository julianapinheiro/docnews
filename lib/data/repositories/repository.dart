import 'package:docnews/data/db.dart';
import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/services/article_service.dart';

class ArticleRepository {
  final ArticleService _service;
  final ArticleDao _dao;
  const ArticleRepository(
    this._service,
    this._dao,
  );

  Stream<List<Article>> _getArticleListPage(
      int offset, int limit, String? searchTerm) async* {
    final articles =
        await _service.fetchArticles(offset, limit, searchTerm ?? '');
    final stream = await _dao.getFavorites().first;
    final ids = stream.map((e) => e.id).toList();
    yield [
      for (final article in articles)
        article.copyWith(isFavorite: ids.contains(article.id))
    ];
  }

  Future<List<Article>> getArticleListPage(
      int offset, int limit, String? searchTerm) async {
    final stream = _getArticleListPage(offset, limit, searchTerm);
    List<Article> list = [];
    await for (var value in stream) {
      list += value;
    }
    return list;
  }

  Stream<List<Article>> get favorites {
    return _dao.getFavorites();
  }

  Future<void> setFavorite(Article article, bool favorite) {
    return favorite ? _dao.addFavorite(article) : _dao.removeFavorite(article);
  }

  Stream<bool> isFavorite(Article article) {
    return _dao.isFavorite(article);
  }
}
