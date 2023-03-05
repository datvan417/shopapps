import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _page;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _page = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'My Favorites'},
    ];
  }

  int _slectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _slectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_slectedIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _page[_slectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedPage,
          selectedItemColor: Colors.yellowAccent,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _slectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.category),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.star),
                label: 'Favorite'),
          ]),
    );
  }
}
