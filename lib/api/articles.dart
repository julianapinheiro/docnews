import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:docnews/api/endpoints.dart';
import 'package:docnews/models/article.dart';

Future<List<Article>> fetchArticles(int offset, int limit) async {
  final uri = Uri.parse(Endpoints.articles(offset, limit));
  final response = await http.get(uri);
  final data = jsonDecode(response.body);
  return (data as List<dynamic>).map((d) => Article.fromJson(d)).toList();
}
