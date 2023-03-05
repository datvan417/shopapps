import 'package:flutter/material.dart';
import 'package:meals_app/constants/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const categoryRoute = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    final title = selectedMeal.title;
    final String imageUrl = selectedMeal.imageUrl;
    final List<String> ingredients = selectedMeal.ingredients;
    final List<String> step = selectedMeal.steps;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl),
            const BuildSectionTitle(title: 'Ingredients'),
            TableWidget(
              child: ListView(
                children: ingredients.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.orangeAccent,
                        boxShadow: const [
                          BoxShadow(color: Colors.white, spreadRadius: 0.5),
                        ],
                      ),
                      padding: const EdgeInsets.all(4.0),
                      width: double.infinity,
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Raleway',
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const BuildSectionTitle(title: 'Step'),
            TableWidget(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index}'),
                        ),
                        title: Text(
                          step[index],
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 10,
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ],
                  );
                },
                itemCount: step.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}

class BuildSectionTitle extends StatelessWidget {
  const BuildSectionTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.child,
  });

  final dynamic child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black, spreadRadius: 0.5),
        ],
      ),
      child: child,
    );
  }
}
