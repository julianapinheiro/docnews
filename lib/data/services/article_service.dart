import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:docnews/data/db.dart';
import 'package:docnews/data/services/endpoints.dart';
import 'package:docnews/data/models/article.dart';

class ArticleService {
  Future<List<Article>> fetchArticles(int offset, int limit, String searchTerm,
      [http.Client? client]) async {
    final _client = client ?? http.Client();
    final uri = Uri.parse(Endpoints.articlesPage(offset, limit, searchTerm));
    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load articles');
    }

    final data = jsonDecode(response.body);
    return (data as List<dynamic>).map((d) => articlefromJson(d)).toList();
  }
}
