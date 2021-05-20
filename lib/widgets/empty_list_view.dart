import 'package:docnews/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class EmptyListView extends StatelessWidget {
  final Image image;
  final List<Widget> children;

  const EmptyListView({
    Key? key,
    required this.image,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: FeedColors.gray100,
                  borderRadius: BorderRadius.circular(80.0),
                ),
                child: image,
              ),
              SizedBox(
                height: 16.0,
              ),
            ] +
            children,
      ),
    );
  }
}
