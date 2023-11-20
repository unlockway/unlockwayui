class IngredientModel {
  const IngredientModel(
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
  SelectedFood(
    this.id,
    this.amount,
  );

  String id;
  double amount;

  // Convert the object to a map
  Map<String, dynamic> toJson() => {'id': id, 'amount': amount};
}
