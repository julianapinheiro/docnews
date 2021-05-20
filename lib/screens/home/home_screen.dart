import 'package:docnews/screens/home/favorites/favorites_tab.dart';
import 'package:docnews/widgets/rounded_navigation_bar.dart';
import 'package:flutter/material.dart';
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
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          FeedTab(),
          FavoritesTab(),
        ],
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
