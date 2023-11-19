class RoutineModel {
  const RoutineModel(
    this.idRoutine,
    this.name,
    this.meals,
    this.inUsage,
    this.weekRepetitions,
    this.totalCaloriesInTheDay,
    this.createdAt,
    this.updatedAt,
  );

  final String idRoutine;
  final String name;
  final List<Object> meals;
  final bool inUsage;
  final List<bool> weekRepetitions;
  final double totalCaloriesInTheDay;
  final String createdAt;
  final String updatedAt;
}

class RoutineMeal {
  RoutineMeal(
    this.idMeal,
    this.notifyAt,
  );

  String idMeal;
  DateTime notifyAt;

  // Convert the object to a map
  Map<String, dynamic> toJson() => {
        'idMeal': idMeal,
        'notifyAt': notifyAt,
      };
}
