import 'package:unlockway/models/meals.dart';
import 'package:unlockway/models/relations/meal_ingredients.dart';

List<MealsModel> dummyMeals = [
  MealsModel(
    id: "meal_a",
    name: "Oatmeal with Berries",
    photo: "path/to/oatmeal.jpg",
    description: "A delicious and nutritious oatmeal breakfast with berries.",
    category: "Breakfast",
    preparationMethod:
        "Cook oats in water or milk, add berries and sweetener of choice.",
    ingredients: [
      MealIngredient(
          id: "ing_1", name: "Rolled Oats", measure: "cups", amount: 1.0),
      MealIngredient(id: "ing_2", name: "Milk", measure: "cups", amount: 1.0),
      MealIngredient(
          id: "ing_3", name: "Mixed Berries", measure: "cups", amount: 0.5),
      MealIngredient(id: "ing_4", name: "Honey", measure: "tbsp", amount: 1.0),
    ],
    totalCalories: 300.0,
    createdAt: DateTime.now(), // Use DateTime.now() for current time
    updatedAt: DateTime.now(), // Use DateTime.now() for current time
  ),
  MealsModel(
    id: "meal_a",
    name: "Oatmeal with Berries",
    photo: "path/to/oatmeal.jpg",
    description: "A delicious and nutritious oatmeal breakfast with berries.",
    category: "Breakfast",
    preparationMethod:
        "Cook oats in water or milk, add berries and sweetener of choice.",
    ingredients: [
      MealIngredient(
          id: "ing_1", name: "Rolled Oats", measure: "cups", amount: 1.0),
      MealIngredient(id: "ing_2", name: "Milk", measure: "cups", amount: 1.0),
      MealIngredient(
          id: "ing_3", name: "Mixed Berries", measure: "cups", amount: 0.5),
      MealIngredient(id: "ing_4", name: "Honey", measure: "tbsp", amount: 1.0),
    ],
    totalCalories: 300.0,
    createdAt: DateTime.now(), // Use DateTime.now() for current time
    updatedAt: DateTime.now(), // Use DateTime.now() for current time
  ),
  MealsModel(
    id: "meal_c",
    name: "Apple Slices with Almond Butter",
    photo: null, // No photo available for this meal
    description:
        "A healthy and quick snack of apple slices with almond butter.",
    category: "Snack",
    preparationMethod: "Slice apple and spread almond butter on top.",
    ingredients: [
      MealIngredient(id: "ing_9", name: "Apple", measure: "pcs", amount: 1.0),
      MealIngredient(
          id: "ing_10", name: "Almond Butter", measure: "tbsp", amount: 2.0),
    ],
    totalCalories: 200.0,
    createdAt: DateTime.now(), // Use DateTime.now() for current time
    updatedAt: DateTime.now(), // Use DateTime.now() for current time
  ),
  MealsModel(
    id: "meal_d",
    category: "Lunch",
    name: "Salmon with Roasted Vegetables",
    photo: "path/to/salmon_veggies.jpg",
    // Update description, preparationMethod, and ingredients with your specific details
    description: "",
    preparationMethod: "",
    ingredients: [],
    totalCalories: 500.0,
    createdAt: DateTime.now(), // Use DateTime.now() for current time
    updatedAt: DateTime.now(), // Use DateTime.now() for current time
  ),
];
