class HistoryModel {
  const HistoryModel({
    required this.idRoutine,
    required this.routineName,
    required this.calories,
    required this.date,
    required this.ingestedMeals,
    required this.days,
  });

  final String idRoutine;
  final String routineName;
  final double calories;
  final String date;
  final List<Object> ingestedMeals;
  final List<bool> days;

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      idRoutine: map['idRoutine'],
      routineName: map['routineName'],
      calories: map['calories'],
      date: map['date'],
      ingestedMeals: map['ingestedMeals'],
      days: map['days'],
    );
  }
}
