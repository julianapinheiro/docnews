import 'package:docnews/models/article.dart';
import 'package:docnews/widgets/app_search_bar.dart';
import 'package:docnews/widgets/article_item.dart';
import 'package:docnews/widgets/empty_list_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  TextEditingController _textController = TextEditingController();
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onSearchTextChanged);
    // articles = MockedArticles.articles;
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
          title: 'Feed',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: (articles.isEmpty)
              ? getEmptyView()
              : ListView.builder(
                  itemCount: articles.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return getHeader();
                    }
                    return ArticleItem(article: articles[index - 1]);
                  },
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
          color: FeedColors.gray800,
        ),
      ),
    );
  }

  Widget getEmptyView() {
    return EmptyListView(
      image: Image.asset(
        'assets/icons/ic_news_80.png',
        color: FeedColors.gray300,
        width: 80,
        height: 80,
      ),
      children: [
        Text(
          'There are no news yet.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: FeedColors.gray800,
          ),
        )
      ],
    );
  }
}

class MockedArticles {
  static final articles = [
    Article(
      title:
          'Long March 5B falls into Indian Ocean after world follows rocket reentry',
      imageUrl:
          'https://neoradar.uai.com.br/wp-content/uploads/sites/8/2021/03/20200831045838-950x604.jpg',
      publishedAt: DateTime.now(),
    ),
    Article(
      title:
          'SpaceX flies historic 10th mission of a Falcon 9 as Starlink constellation expands',
      imageUrl:
          'https://ibcdn.canaltech.com.br/bBvCV7Mud44YX6fdmXqidBCG8HE=/512x288/smart/i398159.jpeg',
      publishedAt: DateTime.now(),
    ),
    Article(
      title:
          'SpaceX ready to break another rocket reuse record with launch early Sunday',
      imageUrl:
          'https://e3.365dm.com/21/05/1600x900/skynews-china-rocket_5372647.jpg?20210507082659',
      publishedAt: DateTime.now(),
    ),
  ];
}
