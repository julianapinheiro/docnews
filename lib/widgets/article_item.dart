import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:docnews/models/article.dart';
import 'package:docnews/resources/colors.dart';
import 'package:docnews/screens/routes.dart';
import 'package:docnews/widgets/article_info_view.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final Widget? action;

  const ArticleItem({Key? key, required this.article, this.action})
      : super(key: key);

  void _onPress(BuildContext context) {
    Navigator.push(context, Routes.artist(article: article));
  }

  @override
  Widget build(BuildContext context) {
    const double padding = 16.0;
    final double imgHeight =
        (MediaQuery.of(context).size.width - padding * 2) * 180 / 329;
    return InkWell(
      onTap: () => _onPress(context),
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: DocnewsColors.gray800.withOpacity(0.2),
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
                          color: DocnewsColors.gray800,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ArticleInfoView(article: article),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
