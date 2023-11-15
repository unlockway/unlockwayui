import "package:unlockway/constants.dart";
import "package:unlockway/models/ingredients.dart";

List<FoodModel> ingredientsRegistered = ingredients.map((entry) {
  return FoodModel(
    entry["id"],
    entry["photo"],
    entry["name"],
    entry["measure"],
    entry["description"],
    entry["calories"],
    entry["proteins"],
    entry["water"],
    entry["minerals"],
    entry["vitamins"],
    entry["fats"],
  );
}).toList();
