import 'package:docnews/widgets/loader_image.dart';
import 'package:flutter/material.dart';

import 'package:docnews/widgets/article_info_view.dart';
import 'package:docnews/widgets/title_bar.dart';
import 'package:docnews/data/db.dart';
import 'package:docnews/resources/colors.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;

  ArticleScreen({Key? key, required this.article}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  void _onPressed(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(
        title: 'Article',
        action: IconButton(
          color: Colors.white,
          onPressed: () => _onPressed(context),
          icon: ImageIcon(
            AssetImage('assets/icons/ic_arrow_back.png'),
          ),
        ),
      ),
      backgroundColor: DocnewsColors.gray50,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              LoaderImage(
                imageUrl: widget.article.imageUrl,
              ),
              Container(
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16)),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.title,
                      style: TextStyle(
                        color: DocnewsColors.gray800,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        bottom: 12.0,
                      ),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    getAuthorInfo(widget.article.newsSite),
                    ArticleInfoView(article: widget.article),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                child: Text(
                  widget.article.summary,
                  style: TextStyle(
                    color: DocnewsColors.gray700,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getAuthorInfo(String author) {
    return Row(
      children: [
        Text(
          'By',
          style: TextStyle(
            fontSize: 16,
            color: DocnewsColors.gray700,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          author,
          style: TextStyle(
            fontSize: 16,
            color: DocnewsColors.gray700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
