class HistoryModel {
  const HistoryModel(
    this.idRoutine,
    this.routineName,
    this.calories,
    this.date,
    this.ingestedMeals,
    this.days,
  );

  final String idRoutine;
  final String routineName;
  final double calories;
  final String date;
  final List<Object> ingestedMeals;
  final List<bool> days;
}
