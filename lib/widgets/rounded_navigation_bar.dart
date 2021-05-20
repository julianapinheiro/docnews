import 'package:docnews/resources/colors.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class RoundedNavBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int? currentIndex;
  final ValueChanged<int>? onTap;

  const RoundedNavBar(
      {Key? key, required this.items, this.currentIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 10),
            spreadRadius: 0,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: items,
          currentIndex: currentIndex ?? 0,
          onTap: onTap,
          iconSize: 24,
          selectedItemColor: DocnewsColors.gray900,
          selectedIconTheme: IconThemeData(color: DocnewsColors.indigo),
          unselectedIconTheme: IconThemeData(color: DocnewsColors.gray400),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            color: DocnewsColors.gray700,
            letterSpacing: 0.8,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
