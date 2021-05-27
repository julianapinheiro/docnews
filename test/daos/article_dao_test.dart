import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../mocked_data/mocked_articles.dart';

class MockArticleDao extends Mock implements ArticleDao {}

void main() {
  AppDatabase? database;
  ArticleDao? dao;

  setUp(() {
    database = AppDatabase(VmDatabase.memory());
    dao = ArticleDao(database!);
  });

  group('ArticleDao', () {
    test('add an article as a favorite', () async {
      assert(dao != null);

      final article = mockedArticles[0];

      dao!.addFavorite(article);
      final stream = dao!.isFavorite(article);

      expectLater(stream, emits(true));
    });

    test('get favorited articles', () async {
      assert(dao != null);

      Article articleA = mockedArticles[0];
      Article articleB = mockedArticles[1];

      articleA = await dao!.addFavorite(articleA);
      articleB = await dao!.addFavorite(articleB);

      final stream = dao!.getFavorites();

      expectLater(stream, emits([articleA, articleB]));
    });

    test('remove favorited article', () async {
      assert(dao != null);

      Article articleA = mockedArticles[0];
      Article articleB = mockedArticles[1];

      articleA = await dao!.addFavorite(articleA);
      articleB = await dao!.addFavorite(articleB);

      dao!.removeFavorite(articleA);

      final stream = dao!.getFavorites();

      expectLater(stream, emits([articleB]));
    });
  });

  tearDown(() async {
    await database?.close();
  });
}
