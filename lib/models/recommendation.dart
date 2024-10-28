import 'package:unlockway/models/meal_suggestion.dart';
import 'package:unlockway/models/routine_suggestion.dart';

class RecommendationModel {
  const RecommendationModel({
    required this.id,
    required this.idNutritionist,
    required this.idPatient,
    required this.patientComment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.mealSuggestions,
    required this.routineSuggestions,
  });

  final String id;
  final String idNutritionist;
  final String idPatient;
  final String patientComment;
  final String status;
  final List<MealSuggestion> mealSuggestions;
  final List<RoutineSuggestion> routineSuggestions;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory RecommendationModel.fromMap(Map<String, dynamic> map) {
    return RecommendationModel(
      id: map['id'],
      idNutritionist: map['idNutritionist'],
      idPatient: map['idPatient'],
      patientComment: map['patientComment'],
      status: map['status'],
      mealSuggestions: List<MealSuggestion>.from(
        map['mealSuggestions'].map(
          (mealSuggestion) => MealSuggestion.fromMap(mealSuggestion),
        ),
      ),
      routineSuggestions: List<RoutineSuggestion>.from(
        map['routineSuggestions'].map(
          (routineSuggestion) => RoutineSuggestion.fromMap(routineSuggestion),
        ),
      ),
      createdAt: DateTime.parse(map['createdAt'].toString()),
      updatedAt: DateTime.parse(map['updatedAt'].toString()),
    );
  }
}
