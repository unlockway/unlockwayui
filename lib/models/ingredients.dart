class FoodModel {
  const FoodModel(
    this.idFood,
    this.imgURL,
    this.name,
    this.measurement,
    this.description,
    this.calories,
    this.proteins,
    this.water,
    this.minerals,
    this.vitamins,
    this.fats,
  );

  final String idFood;
  final String imgURL;
  final String name;
  final String measurement;
  final String description;
  final double calories;
  final double proteins;
  final double water;
  final String minerals;
  final String vitamins;
  final double fats;
}

class SelectedFood {
  const SelectedFood(
    this.id,
    this.amount,
  );

  final String id;
  final double amount;
}
