import 'dart:async';
import 'package:docnews/data/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:docnews/data/repositories/repository.dart';
import 'package:docnews/widgets/app_search_bar.dart';
import 'package:docnews/widgets/empty_list_view.dart';
import 'package:docnews/widgets/paged_article_list_view.dart';
import '../../../resources/colors.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  TextEditingController _textController = TextEditingController();
  Timer? _debounce;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchTextChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_searchTerm == _textController.text) return;
      setState(() {
        _searchTerm = _textController.text;
      });
    });
  }

  void _onCancelSearch() {
    _textController.text = "";
    setState(() {
      _searchTerm = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final repository = locator.get<ArticleRepository>();
    return SafeArea(
      child: Container(
        color: DocnewsColors.gray50,
        child: AppSearchBar(
          title: 'Feed',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: PagedArticleListView(
            searchTerm: _searchTerm,
            repository: repository,
            emptyListView: getEmptyView('There are no news yet'),
            headerText: 'News feed',
            errorView: getEmptyView(
                'An error ocurred while loading the articles, please try again'),
          ),
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
