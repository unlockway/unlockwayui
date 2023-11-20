import 'dart:convert';

import 'package:unlockway/models/relations/meal_ingredients.dart';

class MealsModel {
  const MealsModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.description,
    required this.category,
    required this.preparationMethod,
    required this.ingredients,
    required this.totalCalories,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final Object? photo;
  final String description;
  final String category;
  final String preparationMethod;
  final List<MealIngredient> ingredients;
  final double totalCalories;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory MealsModel.fromMap(Map<String, dynamic> map) {
    List mealIngredients = map["ingredients"];

    return MealsModel(
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
    );
  }
}
