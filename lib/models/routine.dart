class RoutineModel {
  const RoutineModel(
    this.idRoutine,
    this.meals,
    this.inUsage,
    this.weekRepetitions,
    this.totalCaloriesInTheDay,
    this.isEnable,
    this.createdAt,
    this.updatedAt,
  );

  final String idRoutine;
  final List<Object> meals;
  final bool inUsage;
  final Object weekRepetitions;
  final double totalCaloriesInTheDay;
  final bool isEnable;
  final DateTime createdAt;
  final DateTime updatedAt;
}
