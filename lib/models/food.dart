class RoutineModel {
  const RoutineModel(
    this.idFood,
    this.name,
    this.description,
    this.calories,
    this.proteins,
    this.water,
    this.minerals,
    this.vitamins,
    this.fats,
  );

  final String idFood;
  final String name;
  final String description;
  final double calories;
  final double proteins;
  final double water;
  final double minerals;
  final List<String> vitamins;
  final double fats;
}
