import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';
import 'package:meals_app/widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const categoryRoute = '/';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(
            id: catData.id, title: catData.title, color: catData.color);
      }).toList(),
    );
  }
}
