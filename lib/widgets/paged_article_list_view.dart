import 'package:docnews/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docnews/data/db.dart';
import 'package:docnews/widgets/article_item.dart';
import 'package:docnews/data/repositories/repository.dart';

class PagedArticleListView extends StatefulWidget {
  final Widget? errorView;
  final Widget? emptyListView;
  final String? headerText;
  final int? pageSize;
  final ArticleRepository repository;
  final String? searchTerm;

  const PagedArticleListView({
    Key? key,
    this.errorView,
    this.emptyListView,
    this.headerText,
    this.pageSize,
    this.searchTerm,
    required this.repository,
  }) : super(key: key);

  @override
  _PagedArticleListViewState createState() => _PagedArticleListViewState();
}

class _PagedArticleListViewState extends State<PagedArticleListView> {
  late final int _pageSize;

  final _pagingController = PagingController<int, Article>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _pageSize = widget.pageSize ?? 5;
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await widget.repository.getArticleListPage(
          pageKey * _pageSize, _pageSize, widget.searchTerm);

      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(PagedArticleListView oldWidget) {
    if (oldWidget.searchTerm != widget.searchTerm) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Article>(
          itemBuilder: (context, article, index) {
            if (index == 0 && widget.headerText != null) {
              return getHeader(widget.headerText!);
            }
            return ArticleItem(
              article: article,
            );
          },
          firstPageErrorIndicatorBuilder: (context) => widget.errorView,
          noItemsFoundIndicatorBuilder: (context) => widget.emptyListView,
        ),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }

  Widget getHeader(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Text(
        title,
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
