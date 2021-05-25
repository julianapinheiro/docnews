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
  final favorites = locator.get<FavoritesViewModel>();

  @override
  Widget build(BuildContext context) {
    final isFavorite = favorites.isFavorite(widget.article);
    return StreamBuilder(
        stream: isFavorite,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return _buildIcon(false);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                height: 24, width: 24, child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return _buildIcon(snapshot.data!);
          }
          return SizedBox(height: 24, width: 24);
        });
  }

  Widget _buildIcon(bool isFavorite) {
    return IconButton(
      iconSize: 24,
      onPressed: () {
        favorites.setFavorite(widget.article, !isFavorite);
      },
      icon: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _getImage(isFavorite),
      ),
    );
  }

  Widget _getImage(bool isFavorite) {
    return Image.asset(
      isFavorite
          ? 'assets/icons/ic_favorite.png'
          : 'assets/icons/ic_favorite_outline.png',
      color: isFavorite ? DocnewsColors.indigo : DocnewsColors.gray500,
      width: 24,
      height: 24,
      key: ValueKey<bool>(isFavorite),
    );
  }
}
