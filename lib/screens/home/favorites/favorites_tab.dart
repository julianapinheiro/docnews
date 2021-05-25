import 'package:docnews/data/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:docnews/data/db.dart';
import 'package:docnews/viewmodels/favorites_view_model.dart';
import 'package:docnews/widgets/app_search_bar.dart';
import 'package:docnews/widgets/article_item.dart';
import 'package:docnews/widgets/empty_list_view.dart';
import 'package:docnews/resources/colors.dart';

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
    final viewModel = locator.get<FavoritesViewModel>();
    return SafeArea(
      child: Container(
        color: DocnewsColors.gray50,
        child: AppSearchBar(
          title: 'Favorites',
          enableSearch: false,
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: StreamBuilder(
            stream: viewModel.favorites,
            builder: builder,
          ),
        ),
      ),
    );
  }

  Widget builder(BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
    if (snapshot.hasError) {
      return getErrorView();
    } else {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());
        default:
          final articles = (snapshot.data ?? []);
          if (articles.isEmpty) {
            return getEmptyView();
          } else {
            return ListView.builder(
              itemCount: articles.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return getHeader();
                }
                return ArticleItem(article: articles[index - 1]);
              },
            );
          }
      }
    }
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

  Widget getErrorView() {
    return EmptyListView(
      image: Image.asset(
        'assets/icons/ic_favorite_80.png',
        color: DocnewsColors.gray300,
        width: 80,
        height: 80,
      ),
      children: [
        Text(
          'An error ocurred while loading the articles.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: DocnewsColors.gray800,
          ),
        )
      ],
    );
  }

  Widget getHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Text(
        'Favorites',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: DocnewsColors.gray800,
        ),
      ),
    );
  }
}
