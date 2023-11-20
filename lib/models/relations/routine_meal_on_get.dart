class RoutineMealOnGet {
  RoutineMealOnGet({
    required this.id,
    required this.notifyAt,
    required this.mealId,
    required this.photo,
    required this.name,
    required this.description,
    required this.category,
    required this.totalCalories,
  });

  final String id;
  final String mealId;
  final String notifyAt;
  final String photo;
  final String name;
  final String description;
  final String category;
  final double totalCalories;
}
