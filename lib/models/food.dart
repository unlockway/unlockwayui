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
  final double minerals;
  final List<String> vitamins;
  final double fats;
}
