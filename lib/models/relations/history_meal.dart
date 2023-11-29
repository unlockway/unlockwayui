class HistoryMealOnGet {
  HistoryMealOnGet({
    required this.id,
    required this.idMeal,
    required this.idRoutineMeal,
    required this.ingested,
    required this.name,
    required this.photo,
    required this.description,
    required this.category,
    required this.totalCalories,
  });

  final String idMeal;
  final String idRoutineMeal;
  final bool ingested;
  final String id;
  final String? photo;
  final String name;
  final String description;
  final String category;
  final double totalCalories;
}
