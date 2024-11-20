import 'package:unlockway/models/relations/routine_meal_on_get.dart';

import 'routine.dart';

class RoutineSuggestion extends RoutineModel {
  const RoutineSuggestion({
    required super.id,
    required super.name,
    required super.meals,
    required super.inUsage,
    required super.weekRepetitions,
    required super.totalCaloriesInTheDay,
    required super.createdAt,
    required super.updatedAt,
    required this.idPatient,
    required this.idNutritionist,
    required this.idRecommendation,
    required this.originalRoutineId,
  });

  final String idPatient;
  final String idNutritionist;
  final String idRecommendation;
  final String? originalRoutineId;

  @override
  factory RoutineSuggestion.fromMap(Map<String, dynamic> map) {
    List routineMeals = map["meals"];
    Map<String, bool> weekRepetition =
        Map<String, bool>.from(map['weekRepetitions']);
    List<bool> weekRepetitionsList = weekRepetition.values.toList();

    return RoutineSuggestion(
      id: map['id'],
      originalRoutineId: map["originalRoutineId"],
      name: map['name'],
      inUsage: map['inUsage'],
      meals: routineMeals.map((e) {
        return RoutineMealOnGet(
          id: e["id"],
          notifyAt: e["notifyAt"],
          mealId: e["mealId"],
          photo: e["photo"],
          name: e["name"],
          description: e["description"],
          category: e["category"],
          totalCalories: e["totalCalories"],
        );
      }).toList(),
      weekRepetitions: weekRepetitionsList,
      totalCaloriesInTheDay: map["totalCaloriesInTheDay"],
      createdAt: DateTime.parse(map['createdAt'].toString()),
      updatedAt: DateTime.parse(map['updatedAt'].toString()),
      idPatient: map['idPatient'],
      idNutritionist: map['idNutritionist'],
      idRecommendation: map['idRecommendation'],
    );
  }
}
