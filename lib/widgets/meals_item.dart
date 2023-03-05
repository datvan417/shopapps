import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final double duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  @override
  Widget build(BuildContext context) {
    void selectedMeal() {
      Navigator.pushNamed(context, MealDetailScreen.categoryRoute,
          arguments: id);
    }

    return InkWell(
      onTap: selectedMeal,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        margin: const EdgeInsets.all(12.0),
        elevation: 4,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20.0,
              right: 10.0,
              child: Container(
                color: Colors.black54,
                width: 300.0,
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 7.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 25.0,
                    overflow: TextOverflow.fade,
                  ),
                  softWrap: true,
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DescriptionMealsItem(
                    text: '${duration.toStringAsFixed(0)} min',
                    icon: Icons.schedule),
                DescriptionMealsItem(text: complexity.name, icon: Icons.work),
                DescriptionMealsItem(
                    text: affordability.name, icon: Icons.attach_money),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class DescriptionMealsItem extends StatelessWidget {
  const DescriptionMealsItem({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 25.0,
        ),
        SizedBox(width: 4.0),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }
}
