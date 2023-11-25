import 'package:unlockway/models/relations/routine_meal_on_get.dart';

class RoutineModel {
  const RoutineModel({
    required this.id,
    required this.name,
    required this.meals,
    required this.inUsage,
    required this.weekRepetitions,
    required this.totalCaloriesInTheDay,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final bool inUsage;
  final List<RoutineMealOnGet> meals;
  final List<bool> weekRepetitions;
  final double totalCaloriesInTheDay;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory RoutineModel.fromMap(Map<String, dynamic> map) {
    List routineMeals = map["meals"];
    Map<String, bool> weekRepetition = map['weekRepetitions'];
    List<bool> weekRepetitionsList = weekRepetition.values.toList();

    return RoutineModel(
      id: map['id'],
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
    );
  }
}
