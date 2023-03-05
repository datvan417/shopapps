import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.only(left: 20.0),
            height: 150,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 28.0,
                color: Colors.pinkAccent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          BuildListTile(
            title: 'Meals',
            icon: Icons.restaurant,
            tapHandler: () {
              Navigator.pushReplacementNamed(
                  context, CategoriesScreen.categoryRoute);
            },
          ),
          BuildListTile(
            title: 'Filters',
            icon: Icons.settings,
            tapHandler: () {
              Navigator.pushReplacementNamed(context, FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.tapHandler,
  });
  final String title;
  final IconData icon;
  final Function tapHandler;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler as Function(),
    );
  }
}
