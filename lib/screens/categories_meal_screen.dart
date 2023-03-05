import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meals_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const categoryRoute = '/categories-meals';
  const CategoriesMealsScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late String categoryTitle;
  late String categoryId;
  late List<Meal> displayedMeal;
  var _getData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_getData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      categoryId = routeArgs['id']!;
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _getData = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _removeMeal(String mealId) {
      setState(() {
        displayedMeal.removeWhere((element) => element.id == mealId);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              imageUrl: displayedMeal[index].imageUrl,
              duration: displayedMeal[index].duration,
              complexity: displayedMeal[index].complexity,
              affordability: displayedMeal[index].affordability,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}
