import 'package:docnews/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

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
        color: FeedColors.gray50,
        child: AppSearchBar(
          title: 'Feed',
          textController: _textController,
          onCancelSearch: _onCancelSearch,
          child: Expanded(child: Center(child: Text('Feed'))),
        ),
      ),
    );
  }
}
