import 'package:flutter/material.dart';

import 'package:docnews/data/db.dart';
import 'package:docnews/screens/article/article_screen.dart';

class Routes {
  static MaterialPageRoute<void> artist({required Article article}) {
    return MaterialPageRoute(
      builder: (BuildContext context) => ArticleScreen(article: article),
    );
  }
}
