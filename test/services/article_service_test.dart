import 'dart:io';

import 'package:docnews/data/db.dart';
import 'package:docnews/data/services/article_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../mocked_data/mocked_response.dart';

import 'article_services.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ArticleService', () {
    final uri = Uri.parse(
        "https://spaceflightnewsapi.net/api/v2//articles?_start=0&_limit=2&title_contains=");

    test('returns a list of Articles if the http call completes successfully',
        () async {
      final client = MockClient();
      final service = ArticleService();

      when(client.get(uri))
          .thenAnswer((_) async => http.Response(articlesJson, 200, headers: {
                HttpHeaders.contentTypeHeader:
                    'application/json; charset=utf-8',
              }));

      expect(
          await service.fetchArticles(0, 2, '', client), isA<List<Article>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();
      final service = ArticleService();

      when(client.get(uri))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(service.fetchArticles(0, 2, '', client), throwsException);
    });
  });
}
