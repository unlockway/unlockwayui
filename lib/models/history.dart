class HistoryModel {
  const HistoryModel(
    this.idRoutine,
    this.date,
    this.ingestedMeals,
  );

  final String idRoutine;
  final DateTime date;
  final List<Object> ingestedMeals;
}
