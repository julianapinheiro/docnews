import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FeedColors.gray50,
      child: Center(child: Text('Favorites')),
    );
  }
}
