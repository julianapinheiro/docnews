import 'package:docnews/widgets/app_search_bar.dart';
import 'package:docnews/widgets/empty_list_view.dart';
import 'package:docnews/widgets/paged_article_list_view.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
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
          title: 'Feed',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: PagedArticleListView(
            emptyListView: getEmptyView('There are no news yet'),
            headerView: getHeader(),
            errorView: getEmptyView(
                'An error ocurred while loading the articles, please try again'),
          ),
        ),
      ),
    );
  }

  Widget getHeader() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Text(
        'News feed',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: DocnewsColors.gray800,
        ),
      ),
    );
  }

  Widget getEmptyView(String text) {
    return EmptyListView(
      image: Image.asset(
        'assets/icons/ic_news_80.png',
        color: DocnewsColors.gray300,
        width: 80,
        height: 80,
      ),
      children: [
        Text(
          text,
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
}
