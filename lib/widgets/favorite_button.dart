import 'package:docnews/data/db.dart';
import 'package:docnews/data/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:docnews/resources/colors.dart';
import 'package:docnews/viewmodels/favorites_view_model.dart';

class FavoriteButton extends StatefulWidget {
  final Article article;

  const FavoriteButton({Key? key, required this.article}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.article.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final favorites = locator.get<FavoritesViewModel>();
    return IconButton(
      iconSize: 24,
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        favorites.setFavorite(widget.article, _isFavorite);
      },
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _buildIcon(context),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Image.asset(
      _isFavorite
          ? 'assets/icons/ic_favorite.png'
          : 'assets/icons/ic_favorite_outline.png',
      color: _isFavorite ? DocnewsColors.indigo : DocnewsColors.gray500,
      width: 24,
      height: 24,
      key: ValueKey<bool>(_isFavorite),
    );
  }
}
