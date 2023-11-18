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
  final String? img;
  final String description;
  final String category;
  final String preparationMethod;
  final List ingredients;
  final double totalCalories;
  final String createdAt;
  final String updatedAt;
}
