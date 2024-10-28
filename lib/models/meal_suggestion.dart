import 'package:unlockway/models/relations/meal_ingredients.dart';

import 'meals.dart';

class MealSuggestion extends MealsModel {
  const MealSuggestion({
    required super.id,
    required super.name,
    required super.photo,
    required super.description,
    required super.category,
    required super.preparationMethod,
    required super.ingredients,
    required super.totalCalories,
    required super.createdAt,
    required super.updatedAt,
    required this.idPatient,
    required this.idNutritionist,
    required this.idRecommendation,
  });

  final String idPatient;
  final String idNutritionist;
  final String idRecommendation;

  @override
  factory MealSuggestion.fromMap(Map<String, dynamic> map) {
    List mealIngredients = map["ingredients"];
    return MealSuggestion(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      photo: map["photo"],
      category: map["category"],
      preparationMethod: map["preparationMethod"],
      ingredients: mealIngredients.map((mi) {
        return MealIngredient(
          id: mi["id"].toString(),
          name: mi["name"].toString(),
          measure: mi["measure"].toString(),
          amount: double.parse(mi["amount"].toString()),
        );
      }).toList(),
      totalCalories: double.parse(map['totalCalories'].toString()),
      createdAt: DateTime.parse(map['createdAt'].toString()),
      updatedAt: DateTime.parse(map['updatedAt'].toString()),
      idPatient: map['idPatient'],
      idNutritionist: map['idNutritionist'],
      idRecommendation: map['idRecommendation'],
    );
  }
}
