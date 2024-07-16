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
      child: ListView.separated(
        itemCount: meals.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          var meal = meals[index];
          return HomeMealCard(
            method: (String routineId, String mealId) {
              method(routineId, mealId);
            },
            description: meal["description"],
            category: meal["category"],
            hour: meal['notifyAt'],
            imageUrl: meal['photo'],
            mealId: meal['id'],
            routineId: routineId,
          );
        },
      ),
    );
  }
}
