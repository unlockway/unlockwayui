class RoutineMealOnCreation {
  RoutineMealOnCreation({required this.idMeal, required this.notifyAt});

  final String idMeal;
  String? notifyAt;

  Map<String, dynamic> toJson() => {
        'idMeal': idMeal,
        'notifyAt': notifyAt,
      };
}
