import 'package:docnews/models/article.dart';
import 'package:docnews/screens/article/article_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute<void> artist({required Article article}) {
    return MaterialPageRoute(
      builder: (BuildContext context) => ArticleScreen(article: article),
    );
  }
}
