import 'package:flutter/material.dart';

import 'package:docnews/resources/colors.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? action;

  const TitleBar({Key? key, required this.title, this.action})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: DocnewsColors.gray900,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 64,
            maxHeight: 64,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (action != null) action!,
              Text(
                title,
                softWrap: false,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
