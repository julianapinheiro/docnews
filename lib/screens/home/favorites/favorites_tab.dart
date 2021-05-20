import 'package:docnews/widgets/app_search_bar.dart';
import 'package:docnews/widgets/empty_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../resources/colors.dart';

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
        color: DocnewsColors.gray50,
        child: AppSearchBar(
          title: 'Favorites',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: getEmptyView(),
        ),
      ),
    );
  }

  Widget getEmptyView() {
    return EmptyListView(
      image: Image.asset(
        'assets/icons/ic_favorite_80.png',
        color: DocnewsColors.gray300,
        width: 80,
        height: 80,
      ),
      children: [
        Text(
          'You don\'t have favorites yet.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: DocnewsColors.gray800,
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: [
            Text(
              'Tap on the',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DocnewsColors.gray800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset(
                'assets/icons/ic_favorite_outline.png',
                color: DocnewsColors.indigo,
                width: 20,
                height: 20,
              ),
            ),
            Text(
              'to mark an article as a favorite.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DocnewsColors.gray800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
