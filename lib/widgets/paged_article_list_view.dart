import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:docnews/api/articles.dart';
import 'package:docnews/models/article.dart';
import 'package:docnews/widgets/article_item.dart';
import 'package:flutter/material.dart';

class PagedArticleListView extends StatefulWidget {
  final Widget? errorView;
  final Widget? emptyListView;
  final Widget? headerView;
  final int? pageSize;

  const PagedArticleListView({
    Key? key,
    this.errorView,
    this.emptyListView,
    this.headerView,
    this.pageSize,
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
      // TODO: use a parameter for this
      final newItems = await fetchArticles(pageKey * _pageSize, _pageSize);

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
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Article>(
          itemBuilder: (context, article, index) {
            if (index == 0 && widget.headerView != null) {
              return Column(
                children: [
                  widget.headerView!,
                  ArticleItem(
                    article: article,
                  )
                ],
              );
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
}
