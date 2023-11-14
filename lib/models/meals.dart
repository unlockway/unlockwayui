class MealsModel {
  const MealsModel(
    this.idMeal,
    this.name,
    this.img,
    this.description,
    this.category,
    this.preparationMethod,
    this.ingredients,
    this.totalCalories,
    this.createdAt,
    this.updatedAt,
  );

  final String idMeal;
  final String name;
  final String img;
  final String description;
  final List<String> category;
  final String preparationMethod;
  final List<Object> ingredients;
  final double totalCalories;
  final DateTime createdAt;
  final DateTime updatedAt;
}
