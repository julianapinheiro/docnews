import 'package:flutter/material.dart';

import 'package:docnews/models/article.dart';
import 'package:docnews/resources/colors.dart';
import 'package:docnews/utils/date_formatter.dart';
import 'package:docnews/widgets/favorite_button.dart';

import '../resources/colors.dart';

class ArticleInfoView extends StatelessWidget {
  final Article article;

  const ArticleInfoView({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            'assets/icons/ic_calendar.png',
            color: DocnewsColors.gray500,
            width: 24,
            height: 24,
          ),
        ),
        if (article.publishedAt != null)
          Text(
            DateFormatter.toArticleDate(article.publishedAt!),
            style: TextStyle(
              color: DocnewsColors.gray500,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        SizedBox(
          width: 24,
        ),
        FavoriteButton(isFavorite: false, onPressed: () {})
      ],
    );
  }
}
