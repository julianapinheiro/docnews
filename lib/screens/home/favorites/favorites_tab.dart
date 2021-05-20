import 'package:docnews/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FavoritesTab extends StatefulWidget {
  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    // TODO
  }

  void _onCancelSearch() {
    _textController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: FeedColors.gray50,
        child: AppSearchBar(
          title: 'Favorites',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: Center(child: Text('Favorites')),
        ),
      ),
    );
  }
}
