import 'package:flutter/material.dart';
import 'package:unlockway/screens/home/components/home_meal_card.dart';

class NextMeals extends StatelessWidget {
  const NextMeals({
    super.key,
    required this.meals,
    required this.routineId,
    required this.method,
  });

  final List meals;
  final String routineId;
  final Function(String routineId, String mealId) method;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: meals.map((meal) {
          return HomeMealCard(
            method: (String routineId, String mealId) {
              method(routineId, mealId);
            },
            mealId: meal['id'],
            routineId: routineId,
            description: meal['description'],
            hour: meal['notifyAt'],
            category: meal['category'],
            imageUrl: meal['photo'],
          );
        }).toList(),
      ),
    );
  }
}
