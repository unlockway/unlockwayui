class HistoryModel {
  const HistoryModel(
    this.idRoutine,
    this.date,
    this.ingestedMeals,
    this.days,
  );

  final String idRoutine;
  final DateTime date;
  final List<Object> ingestedMeals;
  final List<bool> days;
}
