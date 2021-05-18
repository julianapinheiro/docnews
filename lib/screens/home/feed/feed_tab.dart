import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class FeedTab extends StatefulWidget {
  @override
  _FeedTabState createState() => _FeedTabState();
}

class _FeedTabState extends State<FeedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: FeedColors.gray50,
      child: Center(child: Text('Feed')),
    );
  }
}
