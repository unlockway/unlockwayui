import 'package:unlockway/constants.dart';
import 'package:unlockway/models/meals.dart';

List<MealsModel> meals = userMeals.map((entry) {
  return MealsModel(
    entry['id'],
    entry['name'],
    entry['photo'],
    entry['description'],
    entry['category'],
    entry['preparationMethod'],
    entry["ingredients"],
    entry['totalCalories'],
    entry['createdAt'],
    entry['updatedAt'],
  );
}).toList();
