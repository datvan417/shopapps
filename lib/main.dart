import 'package:flutter/material.dart';
import './constants/dummy_data.dart';
import './models/meals.dart';
import './screens/categories_screen.dart';
import './screens/categories_meal_screen.dart';
import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                fontSize: 25.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      initialRoute: CategoriesScreen.categoryRoute,
      routes: {
        CategoriesScreen.categoryRoute: (context) => TabScreen(
              favoriteMeals: _favoriteMeal,
            ),
        CategoriesMealsScreen.categoryRoute: (context) =>
            CategoriesMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.categoryRoute: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (context) =>
            FilterScreen(currentFilter: _filter, saveFilter: _setFilter),
      },
    );
  }
}
