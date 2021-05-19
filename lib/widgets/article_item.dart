import 'package:docnews/models/article.dart';
import 'package:docnews/utils/colors.dart';
import 'package:docnews/utils/date_formatter.dart';
import 'package:docnews/widgets/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final Widget? action;

  const ArticleItem({Key? key, required this.article, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 16.0;
    final double imgHeight =
        (MediaQuery.of(context).size.width - padding * 2) * 180 / 329;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: FeedColors.gray800.withOpacity(0.2),
              offset: Offset(0, 8),
              spreadRadius: -20,
              blurRadius: 30,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 4),
              spreadRadius: -5,
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 329 / 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.topCenter,
                    image: NetworkImage(article.imageUrl ?? ""),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: imgHeight * 0.8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      article.title ?? "",
                      style: TextStyle(
                        color: FeedColors.gray800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    getInfo(article)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getInfo(Article article) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'assets/icons/ic_calendar.png',
              color: FeedColors.gray500,
              width: 24,
              height: 24,
            ),
          ),
          if (article.publishedAt != null)
            Text(
              DateFormatter.toArticleDate(article.publishedAt!),
              style: TextStyle(
                color: FeedColors.gray500,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          SizedBox(
            width: 24,
          ),
          FavoriteButton(isFavorite: false, onPressed: () {})
        ],
      ),
    );
  }
}
