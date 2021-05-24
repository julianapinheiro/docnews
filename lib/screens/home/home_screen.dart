import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:docnews/data/daos/article_dao.dart';
import 'package:docnews/data/db.dart';
import 'package:docnews/data/repositories/repository.dart';
import 'package:docnews/data/service_locator.dart';
import 'package:docnews/data/services/article_service.dart';
import 'package:docnews/screens/home/favorites/favorites_tab.dart';
import 'package:docnews/widgets/rounded_navigation_bar.dart';
import 'package:docnews/screens/home/feed/feed_tab.dart';

import '../../resources/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = locator.get<AppDatabase>();
    return Scaffold(
      backgroundColor: DocnewsColors.gray50,
      bottomNavigationBar: RoundedNavBar(
        items: [
          buildNavBarItem('assets/icons/ic_home.png', 'Feed'),
          buildNavBarItem('assets/icons/ic_favorite.png', 'Favorites')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Provider(
        create: (_) =>
            ArticleRepository(service: ArticleService(), dao: ArticleDao(db)),
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            FeedTab(),
            FavoritesTab(),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildNavBarItem(String icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ImageIcon(AssetImage(icon)),
      ),
      label: label,
    );
  }
}
