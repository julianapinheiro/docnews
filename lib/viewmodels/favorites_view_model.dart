import 'dart:async';

import 'package:docnews/data/db.dart';
import 'package:docnews/data/repositories/repository.dart';
import 'package:flutter/foundation.dart';

class FavoritesViewModel extends ChangeNotifier {
  final ArticleRepository _repository;

  late Stream<List<Article>> favorites;

  FavoritesViewModel(this._repository) {
    this.favorites = this._repository.favorites;
  }

  void setFavorite(Article article, bool isFavorite) {
    _repository.setFavorite(article, isFavorite);
  }
}
