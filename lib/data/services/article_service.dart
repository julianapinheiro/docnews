import 'dart:convert';
import 'package:docnews/data/db.dart';
import 'package:http/http.dart' as http;

import 'package:docnews/data/services/endpoints.dart';
import 'package:docnews/data/models/article.dart';

class ArticleService {
  Future<List<Article>> fetchArticles(
      int offset, int limit, String searchTerm) async {
    final uri = Uri.parse(Endpoints.articlesPage(offset, limit, searchTerm));
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    return (data as List<dynamic>).map((d) => articlefromJson(d)).toList();
  }
}
